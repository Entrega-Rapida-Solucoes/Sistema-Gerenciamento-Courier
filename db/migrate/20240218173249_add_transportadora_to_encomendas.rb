class AddTransportadoraToEncomendas < ActiveRecord::Migration[7.0]
  def change
    add_reference :encomendas, :transportadora, null: false, foreign_key: true
  end
end
