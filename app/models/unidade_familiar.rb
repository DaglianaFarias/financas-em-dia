class UnidadeFamiliar < ApplicationRecord
  has_many :usuarios, dependent: :destroy
  has_many :orcamentos, dependent: :destroy
  has_many :despesas, dependent: :destroy

  after_initialize :definir_status_padrao, if: :new_record?

  enum status: { ativa: 1, inativa: 2 }

  def contas
    self.despesas.where(categoria: 'contas').order(dia_vencimento: :asc)
  end

  def ultimos_gastos_lancados(periodo)
    self.despesas.where(categoria: 'gastos').order(created_at: :desc).limit(5)
  end

  def receita_total
    usuarios.where(status: 'ativo').joins(:receitas).sum('receitas.valor')
  end

  def despesas_no_periodo(data_referencia)
    despesas_no_periodo = []

    usuarios&.each do |usuario|
      next if usuario.forma_pagamentos.blank?

      usuario.forma_pagamentos.each do |forma_pagamento|
        data_inicio, data_fim = forma_pagamento.definir_periodo_referencia_pagamento(data_referencia)

        despesas_no_periodo.concat(forma_pagamento.despesas_no_periodo(data_inicio, data_fim))
      end
    end

    despesas_no_periodo
  end

  private

  def definir_status_padrao
    self.status ||= :ativa
  end 
end
