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

  def despesas_por_forma_de_pagamento(data_inicio, data_fim, unidade_familiar)
    despesas.includes(:orcamento).where(data_gasto: data_inicio..data_fim)
            .where(orcamentos: { unidade_familiar_id: unidade_familiar.id })
  end

  def despesas_no_periodo(data_inicio, data_fim)
    despesas.includes(:orcamento).where(categoria: 'gastos', data_gasto: data_inicio..data_fim)
  end

  def definir_periodo_referencia_pagamento(data_referencia)
    if self.cartao_credito?
      melhor_dia_compra = self.melhor_dia_compra&.to_i
      data_inicio = data_referencia.change(day: melhor_dia_compra) << 1 rescue (data_referencia.beginning_of_month << 1).change(day: melhor_dia_compra)
      data_fim = data_referencia.change(day: melhor_dia_compra - 1) rescue data_referencia.end_of_month.change(day: melhor_dia_compra)
    else
      data_inicio = data_referencia.beginning_of_month
      data_fim = data_referencia.end_of_month
    end
  
    [data_inicio, data_fim]
  end
end
