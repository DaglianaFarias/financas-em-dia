class NotificarContasJob < ApplicationJob
  queue_as :default

  def perform
    dias_proximo_vencimento = (Date.today..(Date.today + 5.days)).map(&:day)

    despesas_a_vencer = []
    Despesa.where(dia_vencimento: dias_proximo_vencimento, categoria: 'contas', alertar_vencimento: true)&.find_each do |conta|
      next if conta&.possui_historico_pagamento?(Date.today)
      despesas_a_vencer << conta
    end

    UsuarioMailer.notificacao_vencimento(despesas_a_vencer).deliver_later
  end
end
