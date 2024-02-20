require "application_system_test_case"

class TransportadorasTest < ApplicationSystemTestCase
  setup do
    @transportadora = transportadoras(:one)
  end

  test "visiting the index" do
    visit transportadoras_url
    assert_selector "h1", text: "Transportadoras"
  end

  test "should create transportadora" do
    visit transportadoras_url
    click_on "New transportadora"

    fill_in "Cnpj", with: @transportadora.cnpj
    fill_in "Endereco", with: @transportadora.endereco_id
    fill_in "Nome", with: @transportadora.nome
    fill_in "Telefone", with: @transportadora.telefone
    click_on "Create Transportadora"

    assert_text "Transportadora was successfully created"
    click_on "Back"
  end

  test "should update Transportadora" do
    visit transportadora_url(@transportadora)
    click_on "Edit this transportadora", match: :first

    fill_in "Cnpj", with: @transportadora.cnpj
    fill_in "Endereco", with: @transportadora.endereco_id
    fill_in "Nome", with: @transportadora.nome
    fill_in "Telefone", with: @transportadora.telefone
    click_on "Update Transportadora"

    assert_text "Transportadora was successfully updated"
    click_on "Back"
  end

  test "should destroy Transportadora" do
    visit transportadora_url(@transportadora)
    click_on "Destroy this transportadora", match: :first

    assert_text "Transportadora was successfully destroyed"
  end
end
