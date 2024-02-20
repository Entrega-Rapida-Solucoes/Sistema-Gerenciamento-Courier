class Remetente < ApplicationRecord
  belongs_to :endereco
  accepts_nested_attributes_for :endereco

  validates :nome, presence: true, length: { in: 2..50 }
  validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: 'deve ser um e-mail válido' }
  validates :telefone, presence: true, format: { with: /\A\d{10,11}\z/, message: 'deve ter 10 ou 11 dígitos numéricos' }
end
