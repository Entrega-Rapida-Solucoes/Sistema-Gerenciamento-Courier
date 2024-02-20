Given("que estou na página de cadastro de novo funcionário") do
  visit new_funcionario_path
end

Given("que há um funcionário existente no sistema") do
  # Criar um funcionário para edição e remoção
  @funcionario = Funcionario.create(
    nome: "Funcionario Existente",
    cargo: "Cargo Padrão",
    cpf: "123.456.789-01",
    email: "funcionario_existente@example.com",
    telefone: "9876543210"
  )
end

Given("estou na página de edição do funcionário") do
  visit edit_funcionario_path(@funcionario)
end

Given("estou na página de exibição do funcionário") do
  visit funcionario_path(@funcionario)
end

When("preencho o formulário com informações válidas do funcionário") do
  fill_in "Nome", with: "Novo Funcionario"
  fill_in "Cargo", with: "Cargo Novo"
  fill_in "CPF", with: "987.654.321-00"
  fill_in "Email", with: "novo_funcionario@example.com"
  fill_in "Telefone", with: "1234567890"
end

When("atualizo as informações do funcionário") do
  fill_in "Nome", with: "Funcionario Atualizado"
  click_button "Atualizar Funcionário"
end

When("clico no botão {string}") do |botao|
  click_button botao
end

Then("devo ver uma mensagem de sucesso") do
  expect(page).to have_content("Funcionario was successfully")
end

Then("devo estar na página de exibição do funcionário recém-criado") do
  expect(page).to have_content("Funcionario was successfully created.")
  expect(page).to have_content("Nome: Novo Funcionario")
end

Then("devo ver uma mensagem de confirmação") do
  expect(page).to have_content("Are you sure?")
end

Then("o funcionário deve ser removido do sistema") do
  expect(Funcionario.find_by(id: @funcionario.id)).to be_nil
end

Then("devo estar na página de índice de funcionários") do
  expect(page).to have_current_path(funcionarios_path)
end

Then("devo ver mensagens de erro indicando campos obrigatórios") do
  expect(page).to have_content("can't be blank")
end

Then("devo ver uma mensagem de erro indicando que o funcionário não foi encontrado") do
  expect(page).to have_content("Funcionario not found")
end
