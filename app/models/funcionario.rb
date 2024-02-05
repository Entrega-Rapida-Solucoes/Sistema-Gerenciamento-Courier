class Funcionario < ApplicationRecord
  validates :nome, presence: true, length: { in: 2..50 }
  validates :cargo, presence: true, length: { in: 2..30 }
  validates :data_nascimento_valida, presence: true
  validates :cpf, presence: true, uniqueness: true, format: { with: /\A\d{3}\.\d{3}\.\d{3}-\d{2}\z/, message: 'deve ter formato XXX.XXX.XXX-XX' }
  validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: 'deve ser um e-mail válido' }
  validates :telefone, presence: true, format: { with: /\A\d{10,11}\z/, message: 'deve ter 10 ou 11 dígitos numéricos' }

  def data_nascimento_valida
    if data_nascimento.present? && data_nascimento > Date.today
      errors.add(:data_nascimento, "não pode ser no futuro")
    end
  end
end
