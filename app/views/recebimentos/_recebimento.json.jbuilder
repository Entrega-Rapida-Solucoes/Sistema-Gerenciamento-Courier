json.extract! recebimento, :id, :data_recebimento, :funcionario_id, :encomenda_id, :created_at, :updated_at
json.url recebimento_url(recebimento, format: :json)
