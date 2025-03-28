class Usuario < ApplicationRecord
  belongs_to :unidade_familiar
  has_many :receitas
  has_many :forma_pagamentos
end
