class RelatorioController < ApplicationController

  before_action :setar_periodo
  before_action :redirect_if_user_admin

  def visao_geral
    @despesa_total_categoria_gastos = 0
    @despesas_agrupadas = Hash.new { |hash, key| hash[key] = [] }
    @totais_por_orcamento = nil
    @ultimos_gastos_lancados = nil
  
    @total_receitas = @unidade_familiar.receita_total
    @despesas_categoria_contas = @unidade_familiar.contas
    valor_total_contas = @despesas_categoria_contas.sum(:valor)

    agrupar_despesas

    @total_contas_previstas = valor_total_contas + @unidade_familiar.orcamentos.sum(:valorEstimado)

    @dados_orcamento = @unidade_familiar.orcamentos.group(:categoria).sum(:valorEstimado)
    @dados_orcamento[:contas] = valor_total_contas

    valor_total_contas_pagas = somar_contas_pagas(@data_referencia)

    @despesa_total = valor_total_contas_pagas + @despesa_total_categoria_gastos

    @totais_por_orcamento = calcular_totais_por_orcamento.tap do |totais|
      @unidade_familiar.orcamentos.each do |orcamento|
        totais[orcamento] ||= 0
      end
    end
  end

  private
  
  def agrupar_despesas
    despesas_no_periodo = []

    @unidade_familiar&.usuarios&.each do |usuario|
      next if usuario.forma_pagamentos.blank?

      usuario.forma_pagamentos.each do |forma_pagamento|
        data_inicio, data_fim = definir_periodo_referencia_pagamento(forma_pagamento)

        despesas_no_periodo.concat(forma_pagamento.despesas_no_periodo(data_inicio, data_fim))
      end
    end

    @despesa_total_categoria_gastos = despesas_no_periodo.sum { |despesa| despesa.valor }
    @despesas_agrupadas = despesas_no_periodo.group_by(&:orcamento)
    @ultimos_gastos_lancados = despesas_no_periodo.sort_by(&:created_at)&.reverse&.first(5)
  end
  
  def definir_periodo_referencia_pagamento(forma_pagamento)
    if forma_pagamento.cartao_credito?
      melhor_dia_compra = forma_pagamento.melhor_dia_compra&.to_i
      data_inicio = @data_referencia.change(day: melhor_dia_compra) << 1 rescue (@data_referencia.beginning_of_month << 1).change(day: melhor_dia_compra)
      data_fim = @data_referencia.change(day: melhor_dia_compra) rescue @data_referencia.end_of_month.change(day: melhor_dia_compra)
    else
      data_inicio = @data_referencia.beginning_of_month
      data_fim = @data_referencia.end_of_month
    end
  
    [data_inicio, data_fim]
  end
  
  def calcular_totais_por_orcamento
    @despesas_agrupadas.transform_values { |despesas| despesas.sum(&:valor) }
  end

  def somar_contas_pagas(data_referencia)
    @despesas_categoria_contas.sum do |conta|
      conta.possui_historico_pagamento?(data_referencia) ? conta.valor : 0
    end
  end

  def setar_periodo
    if params[:filtro_periodo] && params[:filtro_periodo][:mes_periodo].present? && params[:filtro_periodo][:ano_periodo].present?
      mes = params[:filtro_periodo][:mes_periodo].to_i
      ano = params[:filtro_periodo][:ano_periodo].to_i

      @data_referencia = Date.new(ano, mes, 1)
    else
      @data_referencia = Date.today
    end
  end

  def redirect_if_user_admin
    if current_usuario.administrador?
      redirect_to area_administrativa_path and return
    end
  end
end