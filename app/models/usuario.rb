class Usuario < ApplicationRecord
  belongs_to :unidade_familiar
  has_many :receitas
end
