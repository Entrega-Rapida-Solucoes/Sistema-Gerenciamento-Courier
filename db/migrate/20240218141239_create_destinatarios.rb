class CreateDestinatarios < ActiveRecord::Migration[7.0]
  def change
    create_table :destinatarios do |t|
      t.string :nome
      t.date :data_nascimento
      t.string :cpf
      t.string :email
      t.string :telefone
      t.references :endereco, foreign_key: true

      t.timestamps
    end
  end
end
