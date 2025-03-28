class FormaPagamento < ApplicationRecord
  belongs_to :usuario
  has_many :despesas
end
