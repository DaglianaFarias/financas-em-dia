json.extract! historico_pagamento, :id, :despesa_id, :data_pagamento, :created_at, :updated_at
json.url historico_pagamento_url(historico_pagamento, format: :json)
