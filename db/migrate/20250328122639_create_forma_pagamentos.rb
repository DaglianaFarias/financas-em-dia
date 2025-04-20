class CreateFormaPagamentos < ActiveRecord::Migration[7.2]
  def change
    create_table :forma_pagamentos do |t|
      t.references :usuario, null: false, foreign_key: true
      t.string :nome
      t.text :descricao
      t.integer :tipo
      t.date :vencimento_fatura
      t.date :fechamento_fatura
      t.integer :status
      t.integer :categoria

      t.timestamps
    end
  end
end
