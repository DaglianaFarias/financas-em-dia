class CreateReceitas < ActiveRecord::Migration[7.2]
  def change
    create_table :receitas do |t|
      t.references :usuario, null: false, foreign_key: true
      t.float :valor
      t.text :descricao
      t.date :dataEntrada
      t.date :dataEncerramento

      t.timestamps
    end
  end
end
