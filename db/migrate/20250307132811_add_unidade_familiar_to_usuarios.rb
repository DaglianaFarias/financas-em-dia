class AddUnidadeFamiliarToUsuarios < ActiveRecord::Migration[7.2]
  def change
    add_reference :usuarios, :unidade_familiar, null: false, foreign_key: true
  end
end
