json.extract! receita, :id, :usuario_id, :valor, :descricao, :dataEntrada, :dataEncerramento, :created_at, :updated_at
json.url receita_url(receita, format: :json)
