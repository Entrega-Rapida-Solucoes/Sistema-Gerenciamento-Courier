
Given("I am on the destinatario creation page") do
    visit new_destinatario_path
  end
  
  When("I fill in the form with valid name, date of birth, CPF, email, and phone") do
    fill_in "Name", with: "John Doe"
    fill_in "Date of Birth", with: "1990-01-01"
    fill_in "CPF", with: "123.456.789-00"
    fill_in "Email", with: "john.doe@example.com"
    fill_in "Phone", with: "(00) 1234-5678"
  end
  
  When("I click the {string} button") do |button|
    click_button button
  end
  
  Then("I should be redirected to the destinatario view page") do
    expect(page).to have_current_path(destinatario_path(Destinatario.last))
  end
  
  Then("I should see a success message confirming the creation of the destinatario") do
    expect(page).to have_content("Destinatario created successfully!")
  end
  
  Given("there is a destinatario saved in the system") do
    @destinatario = Destinatario.create(
      name: "John Doe",
      date_of_birth: "1990-01-01",
      cpf: "123.456.789-00",
      email: "john.doe@example.com",
      phone: "(00) 1234-5678"
    )
  end
  
  Given("I am on the edit page of that destinatario") do
    visit edit_destinatario_path(@destinatario)
  end
  
  When("I modify the fields of name, date of birth, CPF, email, or phone") do
    fill_in "Name", with: "Jane Doe"
   
  end
  
  Then("I should be redirected to the view page of the updated destinatario") do
    expect(page).to have_current_path(destinatario_path(@destinatario))
  end
  
  Then("I should see a success message confirming the destinatario edition") do
    expect(page).to have_content("Destinatario updated successfully!")
  end
  
  When("I access the view page of that destinatario") do
    visit destinatario_path(@destinatario)
  end
  
  Then("I should see all the details of the destinatario, including name, date of birth, CPF, email, and phone") do
    expect(page).to have_content(@destinatario.name)
    expect(page).to have_content(@destinatario.date_of_birth)
    expect(page).to have_content(@destinatario.cpf)
    expect(page).to have_content(@destinatario.email)
    expect(page).to have_content(@destinatario.phone)
  end
  
  When("I click the {string} button to delete the destinatario") do |button|
    click_link "Delete Destinatario"
  end
  
  Then("I should see a confirmation message asking for the deletion of the destinatario") do
    expect(page).to have_content("Are you sure you want to delete this destinatario?")
  end
  
  When("I confirm the deletion of the destinatario") do
    click_button "Confirm"
  end
  
  Then("upon confirmation, I should be redirected to the destinatarios list") do
    expect(page).to have_current_path(destinatarios_path)
  end
  
  Then("the destinatario should no longer be present in the destinatarios list") do
    expect(page).not_to have_content(@destinatario.name)
    expect(Destinatario.exists?(@destinatario.id)).to be_falsey
  end
  