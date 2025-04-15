class Despesa < ApplicationRecord
  belongs_to :orcamento, optional: true
  belongs_to :forma_pagamento
  belongs_to :unidade_familiar
  has_many :historico_pagamentos

  enum :categoria, { assinatura: 1, contas: 2, gastos: 3, parcelas: 4 }

  def possui_historico_pagamento?(data_referencia)
    historico_pagamentos.find_by(
      data_pagamento: data_referencia.at_beginning_of_month..data_referencia.at_end_of_month
    )
  end
end
