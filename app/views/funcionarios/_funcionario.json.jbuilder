json.extract! funcionario, :id, :nome, :cargo, :data_nascimento, :cpf, :email, :telefone, :created_at, :updated_at
json.url funcionario_url(funcionario, format: :json)
