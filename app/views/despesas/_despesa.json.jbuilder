json.extract! despesa, :id, :orcamento_id, :forma_pagamento_id, :descricao, :categoria, :data_gasto, :valor, :status, :quantidade_parcelas, :parcela_atual, :dia_vencimento, :data_vencimento, :alertar_vencimento, :created_at, :updated_at
json.url despesa_url(despesa, format: :json)
