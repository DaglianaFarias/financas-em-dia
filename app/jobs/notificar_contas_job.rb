class NotificarContasJob < ApplicationJob
  queue_as :default

  def perform
    dias_proximo_vencimento = (Date.today..(Date.today + 5.days)).map(&:day)
    despesas_por_unidade_familiar = Hash.new { |h, k| h[k] = [] }
  
    Despesa.where(
      dia_vencimento: dias_proximo_vencimento,
      categoria: 'contas',
      alertar_vencimento: true
    ).find_each do |conta|
      next if conta.possui_historico_pagamento?(Date.today)
  
      despesas_por_unidade_familiar[conta.unidade_familiar_id] << conta
    end

    despesas_por_unidade_familiar.each do |unidade_familiar_id, contas|
      unidade_familiar = UnidadeFamiliar.find_by(id: unidade_familiar_id)
    
      if unidade_familiar.present?
        usuarios = unidade_familiar.usuarios&.where(receber_alerta: true)

        usuarios.each do |usuario|
          UsuarioMailer.notificacao_vencimento(usuario, contas).deliver_later
        end
      end
    end
  end  
end
