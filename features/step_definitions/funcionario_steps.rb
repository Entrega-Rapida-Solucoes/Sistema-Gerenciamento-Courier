
Given("Eu estou na página de New funcionario") do
    visit new_funcionario_path
  end
  
  When("Eu preencho \"Nome\" com \"{string}\"") do |nome|
    fill_in "Nome", with: nome
  end
  
  When("Eu preencho \"Cargo\" com \"{string}\"") do |cargo|
    fill_in "Cargo", with: cargo
  end
  
  When("Eu preencho \"Data de Nascimento\" com \"{string}\"") do |data_nascimento|
    fill_in "Data de Nascimento", with: data_nascimento
  end
  
  When("Eu preencho \"CPF\" com \"{string}\"") do |cpf|
    fill_in "CPF", with: cpf
  end
  
  When("Eu preencho \"E-mail\" com \"{string}\"") do |email|
    fill_in "E-mail", with: email
  end
  
  When("Eu preencho \"Telefone\" com \"{string}\"") do |telefone|
    fill_in "Telefone", with: telefone
  end
  
  When("Eu clico no botao \"Create Funcionario\"") do
    click_button "Create Funcionario"
  end
  
  Then("Eu vejo a mensagem de sucesso \"{string}\"") do |mensagem|
    expect(page).to have_content mensagem
  end

  Given("Eu estou na página de Edit funcionario com o ID {int}") do |id|
    visit edit_funcionario_path(id)
  end
  
  When("Eu preencho \"Nome\" com \"{string}\"") do |nome|
    fill_in "Nome", with: nome
  end
  
  When("Eu preencho \"Cargo\" com \"{string}\"") do |cargo|
    fill_in "Cargo", with: cargo
  end
  
  When("Eu preencho \"Data de Nascimento\" com \"{string}\"") do |data_nascimento|
    fill_in "Data de Nascimento", with: data_nascimento
  end
  
  When("Eu preencho \"CPF\" com \"{string}\"") do |cpf|
    fill_in "CPF", with: cpf
  end
  
  When("Eu preencho \"E-mail\" com \"{string}\"") do |email|
    fill_in "E-mail", with: email
  end
  
  When("Eu preencho \"Telefone\" com \"{string}\"") do |telefone|
    fill_in "Telefone", with: telefone
  end
  
  When("Eu clico no botao \"Update Funcionario\"") do
    click_button "Update Funcionario"
  end
  
  Then("Eu vejo a mensagem de sucesso \"{string}\"") do |mensagem|
    expect(page).to have_content mensagem
  end


  Given("Eu estou na página de Index funcionarios") do
    visit funcionarios_path
  end
  
  When("Eu clico no link \"Visualizar\" com o ID {int}") do |id|
    click_link("Visualizar", href: funcionario_path(id))
  end
  
  Then("Eu vejo os detalhes do funcionário com o ID {int}") do |id|
    expect(page).to have_content("Nome: Carlos Teste")
    expect(page).to have_content("Cargo: Gerente")
    expect(page).to have_content("Data de Nascimento: 1990-05-12")
    expect(page).to have_content("CPF: 12345678901")
    expect(page).to have_content("E-mail: carlos.teste@exemplo.com")
    expect(page).to have_content("Telefone: 12-123456789")
  end

  Given("Eu estou na página de Index funcionarios") do
    visit funcionarios_path
  end
  
  When("Eu clico no link \"Visualizar\" com o ID {int}") do |id|
    click_link("Visualizar", href: funcionario_path(id))
  end
  
  Then("Eu vejo os detalhes do funcionário com o ID {int}") do |id|
    expect(page).to have_content("Nome: Carlos Teste")
    expect(page).to have_content("Cargo: Gerente")
    expect(page).to have_content("Data de Nascimento: 1990-05-12")
    expect(page).to have_content("CPF: 12345678901")
    expect(page).to have_content("E-mail: carlos.teste@exemplo.com")
    expect(page).to have_content("Telefone: 12-123456789")
  end

  Given("Eu estou na página de Index funcionarios") do
    visit funcionarios_path
  end
  
  When("Eu clico no link \"Excluir\" com o ID {int}") do |id|
    click_link("Excluir", href: funcionario_path(id), method: :delete)
  end
  
  When("Eu confirmo a exclusão") do
    page.driver.browser.switch_to.alert.accept
  end
  
  Then("Eu não vejo o funcionário com o ID {int} na lista") do |id|
    expect(page).not_to have_content("Nome: Carlos Teste")
    expect(page).not_to have_content("Cargo: Gerente")
    expect(page).not_to have_content("Data de Nascimento: 1990-05-12")
    expect(page).not_to have_content("CPF: 12345678901")
    expect(page).not_to have_content("E-mail: carlos.teste@exemplo.com")
    expect(page).not_to have_content("Telefone: 12-123456789")
  end