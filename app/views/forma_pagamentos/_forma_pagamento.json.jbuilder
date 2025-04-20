json.extract! forma_pagamento, :id, :usuario_id, :nome, :descricao, :tipo, :vencimento_fatura, :fechamento_fatura, :status, :categoria, :created_at, :updated_at
json.url forma_pagamento_url(forma_pagamento, format: :json)
