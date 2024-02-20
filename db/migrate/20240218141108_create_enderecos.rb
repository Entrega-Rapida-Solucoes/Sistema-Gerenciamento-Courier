class CreateEnderecos < ActiveRecord::Migration[7.0]
  def change
    create_table :enderecos do |t|
      t.string :cep
      t.string :logradouro
      t.string :numero
      t.string :complemento
      t.string :cidade
      t.string :bairro
      t.string :pais
      t.string :codigo_postal

      t.timestamps
    end
  end
end
