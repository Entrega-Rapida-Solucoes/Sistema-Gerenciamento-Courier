Given("I am on the address creation page") do
    visit new_endereco_path
  end
  
  When("I fill in the form with valid CEP, street, number, complement, city, neighborhood, country, and postal code") do
    fill_in "CEP", with: "12345-678"
    fill_in "Logradouro", with: "Rua Example"
    fill_in "Número", with: "123"
    fill_in "Complemento", with: "Apt 101"
    fill_in "Cidade", with: "Example City"
    fill_in "Bairro", with: "Example Neighborhood"
    fill_in "País", with: "Example Country"
    fill_in "Código Postal", with: "ABCDE12345"
  end
  
  Then("I should be redirected to the address view page") do
    expect(page).to have_current_path(endereco_path(Endereco.last))
  end
  
  Then("I should see a success message confirming the creation of the address") do
    expect(page).to have_content("Address created successfully!")
  end
  
  Given("there is an address saved in the system") do
    @endereco = Endereco.create(
      cep: "12345-678",
      logradouro: "Rua Example",
      numero: "123",
      complemento: "Apt 101",
      cidade: "Example City",
      bairro: "Example Neighborhood",
      pais: "Example Country",
      codigo_postal: "ABCDE12345"
    )
  end
  
  Given("I am on the edit page of that address") do
    visit edit_endereco_path(@endereco)
  end
  
  When("I modify the fields of CEP, street, number, complement, city, neighborhood, country, or postal code") do
    fill_in "CEP", with: "54321-876"
    fill_in "Logradouro", with: "Avenida New Example"
    fill_in "Número", with: "456"
    fill_in "Complemento", with: "Apt 202"
    fill_in "Cidade", with: "New Example City"
    fill_in "Bairro", with: "New Example Neighborhood"
    fill_in "País", with: "New Example Country"
    fill_in "Código Postal", with: "FGHIJ54321"
  end
  
  Then("I should be redirected to the view page of the updated address") do
    expect(page).to have_current_path(endereco_path(@endereco))
  end
  
  Then("I should see a success message confirming the address edition") do
    expect(page).to have_content("Address updated successfully!")
  end
  
  When("I access the view page of that address") do
    visit endereco_path(@endereco)
  end
  
  Then("I should see all the details of the address, including CEP, street, number, complement, city, neighborhood, country, and postal code") do
    expect(page).to have_content(@endereco.cep)
    expect(page).to have_content(@endereco.logradouro)
    expect(page).to have_content(@endereco.numero)
    expect(page).to have_content(@endereco.complemento)
    expect(page).to have_content(@endereco.cidade)
    expect(page).to have_content(@endereco.bairro)
    expect(page).to have_content(@endereco.pais)
    expect(page).to have_content(@endereco.codigo_postal)
  end
  
  When("I click the {string} button to delete the address") do |button|
    click_link "Delete Address"
  end
  
  Then("I should see a confirmation message asking for the deletion of the address") do
    expect(page).to have_content("Are you sure you want to delete this address?")
  end
  
  When("I confirm the deletion of the address") do
    click_button "Confirm"
  end
  
  Then("upon confirmation, I should be redirected to the addresses list") do
    expect(page).to have_current_path(enderecos_path)
  end
  
  Then("the address should no longer be present in the addresses list") do
    expect(page).not_to have_content(@endereco.logradouro)
    expect(Endereco.exists?(@endereco.id)).to be_falsey
  end
  