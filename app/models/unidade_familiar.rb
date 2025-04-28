class UnidadeFamiliar < ApplicationRecord
  has_many :usuarios, dependent: :destroy
  has_many :orcamentos
  has_many :despesas

  after_initialize :definir_status_padrao, if: :new_record?

  enum status: { ativa: 1, inativa: 2 }

  def contas
    self.despesas.where(categoria: 'contas').order(dia_vencimento: :asc)
  end

  def ultimos_gastos_lancados
    self.despesas.where(categoria: 'gastos').order(created_at: :desc).limit(5)
  end

  private

  def definir_status_padrao
    self.status ||= :ativa
  end 
end
