class RemoveDescricaoFromFormaPagamento < ActiveRecord::Migration[7.2]
  def change
    remove_column :forma_pagamentos, :descricao, :text
  end
end
