class CreateUnidadeFamiliar < ActiveRecord::Migration[7.2]
  def change
    create_table :unidade_familiares do |t|
      t.string :nome
      t.string :descricao
      t.integer :status
      t.integer :categoria

      t.timestamps
    end
  end
end
