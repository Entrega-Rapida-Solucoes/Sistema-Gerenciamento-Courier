class Encomenda < ApplicationRecord
  belongs_to :destinatario
  belongs_to :remetente

  validates :peso, presence: true, numericality: { greater_than: 0 }
  validates :status, presence: true, inclusion: { in: %w(Em_Transito Entregue Pendente) }
end
