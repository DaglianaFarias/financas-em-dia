class Despesa < ApplicationRecord
  belongs_to :orcamento
  belongs_to :forma_pagamento
  has_many :historico_pagamentos
end
