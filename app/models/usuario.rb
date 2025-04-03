class Usuario < ApplicationRecord
  belongs_to :unidade_familiar
  has_many :receitas, dependent: :destroy
  has_many :forma_pagamentos

  enum :status, { ativo: 1, inativo: 2 }
  enum :perfil, { administrador: 1, usuario_regular: 2 }

  before_validation :set_valor_padrao, on: :create
  
  private

  def set_valor_padrao
    self.perfil ||= "usuario_regular"
    self.status ||= "ativo"
    self.receber_alerta = true if self.receber_alerta.nil?
  end
end
