class Encomenda < ApplicationRecord
  belongs_to :destinatario
  belongs_to :remetente
  belongs_to :transportadora

  validates :peso, presence: true, numericality: { greater_than: 0 }
  validates :status, presence: true, inclusion: { in: %w(Em_Transito Entregue Pendente) }

  scope :search, ->(data_entrega, peso, transportadora_id) {
    query = all
    query = query.where(data_entrega: data_entrega) if data_entrega.present?
    query = query.where(peso: peso) if peso.present?
    query = query.where(transportadora_id: transportadora_id) if transportadora_id.present?
    query
  }
end
