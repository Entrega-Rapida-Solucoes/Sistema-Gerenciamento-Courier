require "application_system_test_case"

class RemetentesTest < ApplicationSystemTestCase
  setup do
    @remetente = remetentes(:one)
  end

  test "visiting the index" do
    visit remetentes_url
    assert_selector "h1", text: "Remetentes"
  end

  test "should create remetente" do
    visit remetentes_url
    click_on "New remetente"

    fill_in "Email", with: @remetente.email
    fill_in "Endereco", with: @remetente.endereco_id
    fill_in "Nome", with: @remetente.nome
    fill_in "Telefone", with: @remetente.telefone
    click_on "Create Remetente"

    assert_text "Remetente was successfully created"
    click_on "Back"
  end

  test "should update Remetente" do
    visit remetente_url(@remetente)
    click_on "Edit this remetente", match: :first

    fill_in "Email", with: @remetente.email
    fill_in "Endereco", with: @remetente.endereco_id
    fill_in "Nome", with: @remetente.nome
    fill_in "Telefone", with: @remetente.telefone
    click_on "Update Remetente"

    assert_text "Remetente was successfully updated"
    click_on "Back"
  end

  test "should destroy Remetente" do
    visit remetente_url(@remetente)
    click_on "Destroy this remetente", match: :first

    assert_text "Remetente was successfully destroyed"
  end
end
