json.extract! remetente, :id, :nome, :email, :telefone, :endereco_id, :created_at, :updated_at
json.url remetente_url(remetente, format: :json)
