class RemoveSenhaFromUsuarios < ActiveRecord::Migration[7.2]
  def change
    remove_column :usuarios, :senha, :string
  end
end
