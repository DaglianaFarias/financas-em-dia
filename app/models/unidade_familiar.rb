class UnidadeFamiliar < ApplicationRecord
  has_many :usuarios, dependent: :destroy
  has_many :orcamentos
  has_many :despesas

  after_initialize :definir_status_padrao, if: :new_record?

  enum status: { ativa: 1, inativa: 2 }

  private

  def definir_status_padrao
    self.status ||= :ativa
  end
end
