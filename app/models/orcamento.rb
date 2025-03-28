class Orcamento < ApplicationRecord
  belongs_to :unidade_familiar
  has_many :despesas
end
