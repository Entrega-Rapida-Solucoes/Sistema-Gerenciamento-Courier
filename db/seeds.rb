# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#

# Criação de funcionários com diferentes nomes
Funcionario.create(nome: 'João Silva', cargo: 'Analista', cpf: '111.222.333-44', email: 'joao@example.com', telefone: '1234567890')
Funcionario.create(nome: 'Maria Souza', cargo: 'Gerente', cpf: '555.666.777-88', email: 'maria@example.com', telefone: '9876543210')

#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
