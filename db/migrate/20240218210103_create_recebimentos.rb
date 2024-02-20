class CreateRecebimentos < ActiveRecord::Migration[7.0]
  def change
    create_table :recebimentos do |t|
      t.date :data_recebimento
      t.references :funcionario, null: false, foreign_key: true
      t.references :encomenda, null: false, foreign_key: true

      t.timestamps
    end
  end
end
