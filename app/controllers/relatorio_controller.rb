class RelatorioController < ApplicationController

  before_action :setar_periodo
  before_action :redirect_if_user_admin

  def visao_geral
    @despesa_total_categoria_gastos = 0
    @despesas_agrupadas_orcamentos = Hash.new { |hash, key| hash[key] = [] }
    @totais_por_orcamento = nil
    @ultimos_gastos_lancados = nil
  
    @total_receitas = @unidade_familiar.receita_total
    @despesas_categoria_contas = @unidade_familiar.contas
    valor_total_contas = @despesas_categoria_contas.sum(:valor)

    despesas = @unidade_familiar.despesas_no_periodo(@data_referencia)

    @despesa_total_categoria_gastos = despesas.sum { |despesa| despesa.valor }
    @despesas_agrupadas_orcamentos = despesas.group_by(&:orcamento)
    @despesas_agrupadas_forma_pagamento = despesas.group_by(&:forma_pagamento)

    @ultimos_gastos_lancados = despesas.sort_by(&:created_at)&.reverse&.first(5)

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

    @contas_pendentes = @despesas_categoria_contas.select do |conta|
      !conta.possui_historico_pagamento?(@data_referencia)
    end
  end

  private
  
  def calcular_totais_por_orcamento
    @despesas_agrupadas_orcamentos.transform_values { |despesas| despesas.sum(&:valor) }
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