class CreateDespesas < ActiveRecord::Migration[7.2]
  def change
    create_table :despesas do |t|
      t.references :orcamento, null: false, foreign_key: true
      t.references :forma_pagamento, null: false, foreign_key: true
      t.text :descricao
      t.integer :categoria
      t.date :data_gasto
      t.float :valor
      t.integer :status
      t.integer :quantidade_parcelas
      t.integer :parcela_atual
      t.integer :dia_vencimento
      t.date :data_vencimento
      t.boolean :alertar_vencimento

      t.timestamps
    end
  end
end
