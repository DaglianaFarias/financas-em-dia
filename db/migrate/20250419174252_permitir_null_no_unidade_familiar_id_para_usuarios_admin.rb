class PermitirNullNoUnidadeFamiliarIdParaUsuariosAdmin < ActiveRecord::Migration[7.2]
  def change
    change_column_null :usuarios, :unidade_familiar_id, true
  end
end
