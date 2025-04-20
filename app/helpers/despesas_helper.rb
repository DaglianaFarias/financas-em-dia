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
end
