json.extract! usuario, :id, :unidade_familiar_id, :nome, :email, :senha, :status, :perfil, :receber_alerta, :created_at, :updated_at
json.url usuario_url(usuario, format: :json)
