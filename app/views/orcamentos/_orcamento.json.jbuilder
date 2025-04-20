json.extract! orcamento, :id, :unidade_familiar_id, :categoria, :status, :descricao, :valorEstimado, :created_at, :updated_at
json.url orcamento_url(orcamento, format: :json)
