json.extract! pagamento, :id, :troco, :dinheiro, :matricula_id, :curso_id, :created_at, :updated_at
json.url pagamento_url(pagamento, format: :json)