json.extract! endereco, :id, :cep, :logradouro, :numero, :complemento, :cidade, :bairro, :pais, :codigo_postal, :created_at, :updated_at
json.url endereco_url(endereco, format: :json)
