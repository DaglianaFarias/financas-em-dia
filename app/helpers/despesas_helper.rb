module DespesasHelper
  def status_conta(conta, data_referencia)
    if conta.possui_historico_pagamento?(data_referencia)
      content_tag(:span, "Pago", class: "badge bg-success")
    else
      button_to(
        pagamento_despesa_path(id: conta.id, data: data_referencia),
        method: :post,
        class: "btn btn-sm btn-warning",
        data: { turbo_confirm: "Deseja marcar esta conta como paga?" }
      ) do
        "Pendente"
      end
    end
  end

  def cor_barra_progresso(valor_previsto, valor_executado)
    utilizado = valor_previsto.positive? ? ((valor_executado / valor_previsto.to_f) * 100).round : 0
    passou_orcamento = utilizado > 100

    cor_barra = if utilizado < 75
                  'bg-success'
                elsif utilizado < 100
                  'bg-warning text-dark'
                else
                  'bg-danger'
                end

    return cor_barra
  end

  def barra_de_progresso(valor_previsto, valor_executado)
    utilizado = valor_previsto.positive? ? ((valor_executado / valor_previsto.to_f) * 100).round : 0

    content_tag :div, class: "progress mt-1", style: "height: 12px;", role: "progressbar",
                aria: { valuenow: utilizado, valuemin: 0, valuemax: 100 } do
      content_tag :div, "#{utilizado}%",
                  class: "progress-bar #{cor_barra_progresso(valor_previsto, valor_executado)}",
                  style: "width: #{utilizado}%;"
    end
  end

  def valor_total_despesa_parcelada(despesa)
    return 0 if despesa.blank?

    despesa.valor * despesa.quantidade_parcelas
  end

  def parcela_atual_calculada(despesa)
    return nil unless despesa.parcelas? && despesa.quantidade_parcelas.present?

    meses_passados = (Date.current.year * 12 + Date.current.month) - (despesa.data_gasto.year * 12 + despesa.data_gasto.month)
    atual = meses_passados + 1

    atual > despesa.quantidade_parcelas ? despesa.quantidade_parcelas : atual
  end

  def valor_total_parcelas(despesas)
    return 0 if despesas.blank?

    despesas.sum { |despesa| valor_total_despesa_parcelada(despesa) }
  end

  def valor_faltante_a_pagar(despesas)
    return 0 if despesas.blank?

    despesas.sum do |despesa|
      parcelas_faltantes = despesa.quantidade_parcelas - parcela_atual_calculada(despesa)
      parcelas_faltantes * despesa.valor
    end
  end 
end
