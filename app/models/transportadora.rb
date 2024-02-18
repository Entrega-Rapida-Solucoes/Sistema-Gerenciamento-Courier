class Transportadora < ApplicationRecord
  belongs_to :endereco
  accepts_nested_attributes_for :endereco

  validates :nome, presence: true, length: { in: 2..50 }
  validates :telefone, presence: true, format: { with: /\A\d{10,11}\z/, message: 'deve ter 10 ou 11 dígitos numéricos' }
  validates :cnpj, presence: true, format: { with: /\A\d{2}\.\d{3}\.\d{3}\/\d{4}-\d{2}\z/, message: "formato de CNPJ inválido" }
end
