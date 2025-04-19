class Usuario < ApplicationRecord
  belongs_to :unidade_familiar, optional: true
  has_many :receitas, dependent: :destroy
  has_many :forma_pagamentos

  enum :status, { ativo: 1, inativo: 2 }
  enum :perfil, { administrador: 1, usuario_regular: 2 }

  devise :database_authenticatable, :recoverable, :rememberable, :validatable 

  before_validation :set_valor_padrao, on: :create
  validates :unidade_familiar_id, presence: true, unless: -> { perfil == 'administrador' }

  validates :nome, presence: true
  validates :email, presence: true, uniqueness: true

  private

  def set_valor_padrao
    self.perfil ||= "usuario_regular"
    self.status ||= "ativo"
    self.receber_alerta = true if self.receber_alerta.nil?
  end
end
