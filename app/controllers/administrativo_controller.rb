class AdministrativoController < ApplicationController

  def index
    @ultimas_despesas_lancadas = @unidade_familiar.despesas.where(categoria: 'gastos').order(created_at: :desc).limit(8)
    @contas_cadastradas = @unidade_familiar.despesas.where(categoria: 'contas').order(dia_vencimento: :asc)
    @valor_total_contas = @contas_cadastradas.sum(:valor)

    # @usuarios_unidade_familiar = @unidade_familiar&.usuarios.where(status: 'ativo')
    @usuarios_unidade_familiar = @unidade_familiar&.usuarios
    @total_receitas = @usuarios_unidade_familiar.where(status: 'ativo')&.joins(:receitas).sum("receitas.valor")

    @orcamentos = @unidade_familiar.orcamentos
    @despesa_total_categoria_gastos = 0
    @gastos_por_orcamento = 0
    @despesas_agrupadas = {} unless defined?(@despesas_agrupadas)
    @totais_por_orcamento = nil

    data_atual = Date.today

    @usuarios_unidade_familiar.each do |usuario|
      next if usuario.forma_pagamentos.blank?

      usuario.forma_pagamentos.each do |forma_pagamento|
        data_inicio = data_atual.beginning_of_month
        data_fim = data_atual.end_of_month

        if forma_pagamento.cartao_credito?
          melhor_dia_compra = forma_pagamento.melhor_dia_compra&.to_i

          data_inicio = data_atual.change(day: melhor_dia_compra) << 1 rescue (data_atual.beginning_of_month << 1).change(day: melhor_dia_compra)
          data_fim = data_atual.change(day: melhor_dia_compra) rescue data_atual.end_of_month.change(day: melhor_dia_compra)
        end

        @despesa_total_categoria_gastos += (forma_pagamento.despesas.where(categoria: 'gastos', data_gasto: data_inicio..data_fim )&.sum(:valor) || 0)

        despesas = forma_pagamento.despesas
          .includes(:orcamento)
          .where(data_gasto: data_inicio..data_fim)
          .where(orcamentos: { unidade_familiar_id: @unidade_familiar.id })

        despesas.each do |despesa|
          orcamento = despesa.orcamento
          next unless orcamento

          @despesas_agrupadas[orcamento] ||= []
          @despesas_agrupadas[orcamento] << despesa
        end

        @totais_por_orcamento = @despesas_agrupadas.transform_values { |despesas| despesas.sum(&:valor) }
      end
    end

    @total_contas_previstas = @valor_total_contas + @unidade_familiar.orcamentos.sum(:valorEstimado)
    @dados_orcamento = @unidade_familiar.orcamentos.group(:categoria).sum(:valorEstimado)
  end
end