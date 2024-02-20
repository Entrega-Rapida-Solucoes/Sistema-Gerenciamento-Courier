require "application_system_test_case"

class DestinatariosTest < ApplicationSystemTestCase
  setup do
    @destinatario = destinatarios(:one)
  end

  test "visiting the index" do
    visit destinatarios_url
    assert_selector "h1", text: "Destinatarios"
  end

  test "should create destinatario" do
    visit destinatarios_url
    click_on "New destinatario"

    fill_in "Cpf", with: @destinatario.cpf
    fill_in "Data nascimento", with: @destinatario.data_nascimento
    fill_in "Email", with: @destinatario.email
    fill_in "Endereco", with: @destinatario.endereco_id
    fill_in "Nome", with: @destinatario.nome
    fill_in "Telefone", with: @destinatario.telefone
    click_on "Create Destinatario"

    assert_text "Destinatario was successfully created"
    click_on "Back"
  end

  test "should update Destinatario" do
    visit destinatario_url(@destinatario)
    click_on "Edit this destinatario", match: :first

    fill_in "Cpf", with: @destinatario.cpf
    fill_in "Data nascimento", with: @destinatario.data_nascimento
    fill_in "Email", with: @destinatario.email
    fill_in "Endereco", with: @destinatario.endereco_id
    fill_in "Nome", with: @destinatario.nome
    fill_in "Telefone", with: @destinatario.telefone
    click_on "Update Destinatario"

    assert_text "Destinatario was successfully updated"
    click_on "Back"
  end

  test "should destroy Destinatario" do
    visit destinatario_url(@destinatario)
    click_on "Destroy this destinatario", match: :first

    assert_text "Destinatario was successfully destroyed"
  end
end
