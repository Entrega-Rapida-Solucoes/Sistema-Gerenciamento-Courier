class Recebimento < ApplicationRecord
  belongs_to :funcionario
  belongs_to :encomenda

  validates :data_recebimento, presence: true
end
