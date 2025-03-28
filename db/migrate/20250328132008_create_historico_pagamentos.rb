class CreateHistoricoPagamentos < ActiveRecord::Migration[7.2]
  def change
    create_table :historico_pagamentos do |t|
      t.references :despesa, null: false, foreign_key: true
      t.date :data_pagamento

      t.timestamps
    end
  end
end
