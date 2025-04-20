class FormaPagamento < ApplicationRecord
  belongs_to :usuario
  has_many :despesas

  enum tipo: {
    dinheiro: 0,
    cartao_credito: 1,
    cartao_debito: 2,
    pix: 3,
    boleto: 4,
    transferencia_bancaria: 5,
    ted: 6,
    doc: 7
  }

  enum status: {
    ativo: 0,
    inativo: 1
  }

  scope :por_data_referencia, ->(data_referencia_param) {
    where(data_gasto: data_referencia_param.at_beginning_of_month..data_referencia_param.at_end_of_month)
  }
end
