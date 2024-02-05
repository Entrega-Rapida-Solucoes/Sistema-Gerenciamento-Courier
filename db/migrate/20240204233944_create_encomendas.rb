class CreateEncomendas < ActiveRecord::Migration[7.0]
  def change
    create_table :encomendas do |t|
      t.float :peso
      t.string :status
      t.date :data_entrega
      t.references :destinatario, null: false, foreign_key: true
      t.references :remetente, null: false, foreign_key: true

      t.timestamps
    end
  end
end
