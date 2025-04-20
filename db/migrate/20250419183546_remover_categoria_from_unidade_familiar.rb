class RemoverCategoriaFromUnidadeFamiliar < ActiveRecord::Migration[7.2]
  def change
    remove_column :unidade_familiares, :categoria, :integer
  end
end
