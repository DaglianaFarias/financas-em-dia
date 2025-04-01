class Despesa < ApplicationRecord
  belongs_to :orcamento, optional: true
  belongs_to :forma_pagamento
  belongs_to :unidade_familiar
  has_many :historico_pagamentos

  enum :categoria, { assinatura: 1, contas: 2, gastos: 3, parcelas: 4 }
end
