class ChangeOrcamentoIdNullAbleInDespesas < ActiveRecord::Migration[7.2]
  def change
    change_column_null :despesas, :orcamento_id, true
  end
end
