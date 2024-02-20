Given("que existem funcionários no sistema com diferentes nomes") do
  Funcionario.create(nome: 'João Silva', cargo: 'Analista', cpf: '111.222.333-44', email: 'joao@example.com', telefone: '1234567890')
  Funcionario.create(nome: 'Maria Souza', cargo: 'Gerente', cpf: '555.666.777-88', email: 'maria@example.com', telefone: '9876543210')
end

Given("que existem funcionários no sistema com diferentes CPFs") do
  Funcionario.create(nome: 'Carlos Silva', cargo: 'Analista', cpf: '123.456.789-01', email: 'carlos@example.com', telefone: '9876543210')
  Funcionario.create(nome: 'Fernanda Oliveira', cargo: 'Gerente', cpf: '987.654.321-09', email: 'fernanda@example.com', telefone: '1234567890')
end

Given("estou na página de índice de funcionários") do
  visit funcionarios_path
end

When("preencho o campo {string} com um nome específico") do |campo|
  fill_in campo, with: 'João Silva'
end

And("clico no botão {string}") do |botao|
  click_button botao
end

Then("devo ver apenas os funcionários com aquele nome específico") do
  expect(page).to have_content('João Silva')
  expect(page).not_to have_content('Maria Souza')
end

When("preencho o campo {string} com um CPF específico") do |campo|
  fill_in campo, with: '111.222.333-44'
end

And("clico no botão {string}") do |botao|
  click_button botao
end

Then("devo ver apenas os funcionários com aquele CPF específico") do
  expect(page).to have_content('João Silva')
  expect(page).not_to have_content('Maria Souza')
end

When("preencho o campo {string} com um nome que não existe") do |campo|
  fill_in campo, with: 'NomeInexistente'
end

And("clico no botão {string}") do |botao|
  click_button botao
end

Then("devo ver uma mensagem indicando que nenhum funcionário foi encontrado") do
  expect(page).to have_content('Nenhum funcionário foi encontrado.')
end

When("preencho o campo {string} com um CPF que não existe") do |campo|
  fill_in campo, with: '999.888.777-66'
end

And("clico no botão {string}") do |botao|
  click_button botao
end

Then("devo ver uma mensagem indicando que nenhum funcionário foi encontrado") do
  expect(page).to have_content('Nenhum funcionário foi encontrado.')
end

When("preencho ambos os campos {string} e {string}") do |campo_nome, campo_cpf|
  fill_in campo_nome, with: 'João Silva'
  fill_in campo_cpf, with: '111.222.333-44'
end

And("clico no botão {string}") do |botao|
  click_button botao
end

Then("devo ver apenas os funcionários com aquele nome e CPF específicos") do
  expect(page).to have_content('João Silva')
  expect(page).not_to have_content('Maria Souza')
end