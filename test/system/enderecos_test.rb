require "application_system_test_case"

class EnderecosTest < ApplicationSystemTestCase
  setup do
    @endereco = enderecos(:one)
  end

  test "visiting the index" do
    visit enderecos_url
    assert_selector "h1", text: "Enderecos"
  end

  test "should create endereco" do
    visit enderecos_url
    click_on "New endereco"

    fill_in "Bairro", with: @endereco.bairro
    fill_in "Cep", with: @endereco.cep
    fill_in "Cidade", with: @endereco.cidade
    fill_in "Codigo postal", with: @endereco.codigo_postal
    fill_in "Complemento", with: @endereco.complemento
    fill_in "Logradouro", with: @endereco.logradouro
    fill_in "Numero", with: @endereco.numero
    fill_in "Pais", with: @endereco.pais
    click_on "Create Endereco"

    assert_text "Endereco was successfully created"
    click_on "Back"
  end

  test "should update Endereco" do
    visit endereco_url(@endereco)
    click_on "Edit this endereco", match: :first

    fill_in "Bairro", with: @endereco.bairro
    fill_in "Cep", with: @endereco.cep
    fill_in "Cidade", with: @endereco.cidade
    fill_in "Codigo postal", with: @endereco.codigo_postal
    fill_in "Complemento", with: @endereco.complemento
    fill_in "Logradouro", with: @endereco.logradouro
    fill_in "Numero", with: @endereco.numero
    fill_in "Pais", with: @endereco.pais
    click_on "Update Endereco"

    assert_text "Endereco was successfully updated"
    click_on "Back"
  end

  test "should destroy Endereco" do
    visit endereco_url(@endereco)
    click_on "Destroy this endereco", match: :first

    assert_text "Endereco was successfully destroyed"
  end
end
