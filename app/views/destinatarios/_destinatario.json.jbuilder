json.extract! destinatario, :id, :nome, :data_nascimento, :cpf, :email, :telefone, :endereco_id, :created_at, :updated_at
json.url destinatario_url(destinatario, format: :json)
