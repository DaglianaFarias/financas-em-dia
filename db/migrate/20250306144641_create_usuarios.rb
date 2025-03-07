class CreateUsuarios < ActiveRecord::Migration[7.2]
  def change
    create_table :usuarios do |t|
      t.string :nome
      t.string :email
      t.string :senha
      t.integer :status
      t.integer :perfil

      t.timestamps
    end
  end
end
