class CreateFuncionarios < ActiveRecord::Migration[7.0]
  def change
    create_table :funcionarios do |t|
      t.string :nome
      t.string :cargo
      t.date :data_nascimento
      t.string :cpf
      t.string :email
      t.string :telefone

      t.timestamps
    end
  end
end
