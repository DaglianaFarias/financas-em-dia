class RemoverOldFaturaFieldsFromFormaPagamentos < ActiveRecord::Migration[7.2]
  def change
    remove_column :forma_pagamentos, :vencimento_fatura_old, :date
    remove_column :forma_pagamentos, :fechamento_fatura_old, :date
  end
end
