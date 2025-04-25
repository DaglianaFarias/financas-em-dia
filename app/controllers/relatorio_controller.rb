class RelatorioController < ApplicationController

  before_action :setar_periodo
  before_action :redirect_if_user_admin

  def visao_geral
    @despesa_total_categoria_gastos = 0
    @despesas_agrupadas = Hash.new { |hash, key| hash[key] = [] }
    @totais_por_orcamento = nil
  
    @ultimas_despesas_lancadas = @unidade_familiar
                                  .despesas.where(categoria: 'gastos')
                                  .order(created_at: :desc)
                                  .limit(8)
    
    @contas_cadastradas = @unidade_familiar
                          .despesas
                          .where(categoria: 'contas')
                          .order(dia_vencimento: :asc)

    @valor_total_contas = @contas_cadastradas.sum(:valor)
  
    @usuarios_unidade_familiar = @unidade_familiar&.usuarios
    @total_receitas = @usuarios_unidade_familiar.where(status: 'ativo')&.joins(:receitas).sum("receitas.valor")
  
    @orcamentos = @unidade_familiar.orcamentos
    @despesa_total_categoria_gastos = 0
  
    @usuarios_unidade_familiar.each do |usuario|
      next if usuario.forma_pagamentos.blank?
  
      usuario.forma_pagamentos.each do |forma_pagamento|
        data_inicio, data_fim = calcular_periodo_pagamento(@data_referencia, forma_pagamento)
  
        @despesa_total_categoria_gastos += calcular_despesas_gastos(forma_pagamento, data_inicio, data_fim)
  
        despesas = buscar_despesas_por_periodo(forma_pagamento, data_inicio, data_fim)
  
        despesas.each do |despesa|
          orcamento = despesa.orcamento
          next unless orcamento

          @despesas_agrupadas[orcamento] << despesa
        end
      end
    end
  
    @totais_por_orcamento = calcular_totais_por_orcamento
  
    @total_contas_previstas = @valor_total_contas + @unidade_familiar.orcamentos.sum(:valorEstimado)
  
    @dados_orcamento = @unidade_familiar.orcamentos.group(:categoria).sum(:valorEstimado)
    @dados_orcamento[:contas] = @valor_total_contas

    @valor_total_contas_pagas = somar_contas_pagas(@data_referencia)

    @despesa_total = @valor_total_contas_pagas + @despesa_total_categoria_gastos
  end
  
  private
  
  def calcular_periodo_pagamento(data_atual, forma_pagamento)
    if forma_pagamento.cartao_credito?
      melhor_dia_compra = forma_pagamento.melhor_dia_compra&.to_i
  
      data_inicio = data_atual.change(day: melhor_dia_compra) << 1 rescue (data_atual.beginning_of_month << 1).change(day: melhor_dia_compra)
      data_fim = data_atual.change(day: melhor_dia_compra) rescue data_atual.end_of_month.change(day: melhor_dia_compra)
    else
      data_inicio = data_atual.beginning_of_month
      data_fim = data_atual.end_of_month
    end
  
    [data_inicio, data_fim]
  end
  
  def calcular_despesas_gastos(forma_pagamento, data_inicio, data_fim)
    forma_pagamento.despesas.where(categoria: 'gastos', data_gasto: data_inicio..data_fim)&.sum(:valor) || 0
  end
  
  def buscar_despesas_por_periodo(forma_pagamento, data_inicio, data_fim)
    forma_pagamento.despesas
      .includes(:orcamento)
      .where(data_gasto: data_inicio..data_fim)
      .where(orcamentos: { unidade_familiar_id: @unidade_familiar.id })
  end
  
  def calcular_totais_por_orcamento
    @despesas_agrupadas.transform_values { |despesas| despesas.sum(&:valor) }
  end

  def somar_contas_pagas(data_referencia)
    @contas_cadastradas.sum do |conta|
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