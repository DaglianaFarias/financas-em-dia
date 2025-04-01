class AddUnidadeFamiliarToDespesas < ActiveRecord::Migration[7.2]
  def change
    add_reference :despesas, :unidade_familiar, null: false, foreign_key: true
  end
end
