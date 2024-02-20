Given("que estou na página de cadastro de transportadoras") do
  visit new_transportadora_path
end

When("preencho os campos obrigatórios para cadastrar uma nova transportadora") do
  fill_in "Nome", with: "Transportadora Teste"
  fill_in "Telefone", with: "12345678901"
  fill_in "Cnpj", with: "12.345.678/0001-90"
end

And("clico no botão {string}") do |botao|
  click_button botao
end

Then("devo ver uma mensagem indicando que a transportadora foi cadastrada com sucesso") do
  expect(page).to have_content("Transportadora cadastrada com sucesso.")
end

Given("que existem transportadoras cadastradas no sistema") do
  @transportadora = Transportadora.create(
    nome: "Transportadora Existente",
    telefone: "9876543210",
    cnpj: "98.765.432/0001-21",
    endereco_attributes: {
      cep: "12345-678",
      logradouro: "Rua Teste",
      numero: "123",
      complemento: "Complemento",
      cidade: "Cidade Teste",
      bairro: "Bairro Teste",
      pais: "País Teste"
    }
  )
end

And("estou na página de edição de transportadora") do
  visit edit_transportadora_path(@transportadora)
end

When("seleciono uma transportadora para editar") do
  # Simulando a seleção de uma transportadora na implementação real
  choose "transportadora_id", option: @transportadora.nome
end

And("faço as alterações necessárias nos campos") do
  fill_in "Nome", with: "Transportadora Atualizada"
  fill_in "Telefone", with: "9876543210"
  fill_in "Cnpj", with: "12.345.678/0001-90"
end

Then("devo ver uma mensagem indicando que a transportadora foi atualizada com sucesso") do
  expect(page).to have_content("Transportadora atualizada com sucesso.")
end

When("seleciono uma transportadora para remover") do
  # Simulando a seleção de uma transportadora na implementação real
  choose "transportadora_id", option: @transportadora.nome
end

Then("devo ver uma mensagem de confirmação") do
  expect(page).to have_content("Tem certeza que deseja remover esta transportadora?")
end

And("a transportadora não deve mais aparecer na lista de transportadoras") do
  expect(page).not_to have_content(@transportadora.nome)
end

When("preencho os campos obrigatórios com dados inválidos") do
  fill_in "Nome", with: ""
  fill_in "Telefone", with: "invalid_telefone"
  fill_in "Cnpj", with: "invalid_cnpj"
end

Then("devo ver mensagens de erro indicando os problemas nos campos") do
  expect(page).to have_content("Nome não pode ficar em branco")
  expect(page).to have_content("Telefone não é válido")
  expect(page).to have_content("Formato de CNPJ inválido")
end

When("faço alterações nos campos, incluindo dados inválidos") do
  fill_in "Nome", with: ""
end
