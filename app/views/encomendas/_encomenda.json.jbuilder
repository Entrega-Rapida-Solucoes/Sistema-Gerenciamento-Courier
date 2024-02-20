json.extract! encomenda, :id, :peso, :status, :data_entrega, :destinatario_id, :remetente_id, transportadora_id, :created_at, :updated_at
json.url encomenda_url(encomenda, format: :json)
