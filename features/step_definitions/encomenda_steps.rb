
Given("I am on the order creation page") do
    visit new_encomenda_path
  end
  
  When("I fill in the form with valid weight, status, delivery date, destinatario ID, and remetente ID") do
    fill_in "Weight", with: 5.0
    fill_in "Status", with: "Pending"
    fill_in "Delivery Date", with: "2024-02-07"
    fill_in "Destinatario ID", with: destinatario.id
    fill_in "Remetente ID", with: remetente.id
  end
  
  Then("I should be redirected to the encomenda view page") do
    expect(page).to have_current_path(encomenda_path(Encomenda.last))
  end
  
  Then("I should see a success message confirming the creation of the encomenda") do
    expect(page).to have_content("Encomenda created successfully!")
  end
  
  Given("there is an encomenda saved in the system") do
    @encomenda = Encomenda.create(
      peso: 5.0,
      status: "Pending",
      data_entrega: "2024-02-07",
      destinatario_id: destinatario.id,
      remetente_id: remetente.id
    )
  end
  
  Given("I am on the edit page of that encomenda") do
    visit edit_encomenda_path(@encomenda)
  end
  
  When("I modify the fields of weight, status, delivery date, destinatario ID, or remetente ID") do
    fill_in "Weight", with: 10.0
    fill_in "Status", with: "Delivered"
    fill_in "Delivery Date", with: "2024-02-10"
    fill_in "Destinatario ID", with: new_destinatario.id
    fill_in "Remetente ID", with: new_remetente.id
  end
  
  Then("I should be redirected to the view page of the updated encomenda") do
    expect(page).to have_current_path(encomenda_path(@encomenda))
  end
  
  Then("I should see a success message confirming the encomenda edition") do
    expect(page).to have_content("Encomenda updated successfully!")
  end
  
  When("I access the view page of that encomenda") do
    visit encomenda_path(@encomenda)
  end
  
  Then("I should see all the details of the encomenda, including weight, status, delivery date, destinatario ID, and remetente ID") do
    expect(page).to have_content(@encomenda.peso)
    expect(page).to have_content(@encomenda.status)
    expect(page).to have_content(@encomenda.data_entrega)
    expect(page).to have_content(@encomenda.destinatario_id)
    expect(page).to have_content(@encomenda.remetente_id)
  end
  
  When("I click the {string} button to delete the encomenda") do |button|
    click_link "Delete Encomenda"
  end
  
  Then("I should see a confirmation message asking for the deletion of the encomenda") do
    expect(page).to have_content("Are you sure you want to delete this encomenda?")
  end
  
  When("I confirm the deletion of the encomenda") do
    click_button "Confirm"
  end
  
  Then("upon confirmation, I should be redirected to the encomendas list") do
    expect(page).to have_current_path(encomendas_path)
  end
  
  Then("the encomenda should no longer be present in the encomendas list") do
    expect(page).not_to have_content(@encomenda.peso)
    expect(Encomenda.exists?(@encomenda.id)).to be_falsey
  end
  