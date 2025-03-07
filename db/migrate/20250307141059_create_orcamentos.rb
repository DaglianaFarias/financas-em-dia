class CreateOrcamentos < ActiveRecord::Migration[7.2]
  def change
    create_table :orcamentos do |t|
      t.references :unidade_familiar, null: false, foreign_key: true
      t.string :categoria
      t.integer :status
      t.string :descricao
      t.float :valorEstimado

      t.timestamps
    end
  end
end
