class ChangeFormaPagamentoColumnType < ActiveRecord::Migration[7.2]
  def change
    rename_column :forma_pagamentos, :vencimento_fatura, :vencimento_fatura_old
    rename_column :forma_pagamentos, :fechamento_fatura, :fechamento_fatura_old

    add_column :forma_pagamentos, :dia_vencimento_fatura, :integer
    add_column :forma_pagamentos, :melhor_dia_compra, :integer
  end
end
