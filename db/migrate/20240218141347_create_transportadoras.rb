class CreateTransportadoras < ActiveRecord::Migration[7.0]
  def change
    create_table :transportadoras do |t|
      t.string :nome
      t.string :telefone
      t.string :cnpj
      t.references :endereco, foreign_key: true

      t.timestamps
    end
  end
end
