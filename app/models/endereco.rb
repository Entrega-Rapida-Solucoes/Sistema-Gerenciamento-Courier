class Endereco < ApplicationRecord

  validates :logradouro, presence: true, length: {in: 3..30}
  validates :complemento, length: {in: 2..10}
  validates_format_of :cep, with: /\A\d{5}-\d{3}\z/, presence: true,
                      message: 'deve ter formato XXXXX-XXX'
  validates :numero, length: { maximum: 10 }, allow_blank: true
  validates :bairro, presence: true, length: {in: 2..20}
  validates :cidade, presence: true, length: {in: 2..20}
  validates :pais, length: { maximum: 20 }, allow_blank: true
  validates :codigo_postal, length: { maximum: 20 }, allow_blank: true
end
