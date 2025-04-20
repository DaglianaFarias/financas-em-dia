class CreateUsuarios < ActiveRecord::Migration[7.2]
  def change
    create_table :usuarios do |t|
      t.references :unidade_familiar, null: false, foreign_key: true
      t.string :nome
      t.string :email
      t.string :senha
      t.integer :status
      t.integer :perfil
      t.boolean :receber_alerta

      t.timestamps
    end
  end
end
