class CreateRemetentes < ActiveRecord::Migration[7.0]
  def change
    create_table :remetentes do |t|
      t.string :nome
      t.string :email
      t.string :telefone
      t.references :endereco, foreign_key: true

      t.timestamps
    end
  end
end
