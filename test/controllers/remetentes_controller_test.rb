require "test_helper"

class RemetentesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @remetente = remetentes(:one)
  end

  test "should get index" do
    get remetentes_url
    assert_response :success
  end

  test "should get new" do
    get new_remetente_url
    assert_response :success
  end

  test "should create remetente" do
    assert_difference("Remetente.count") do
      post remetentes_url, params: { remetente: { email: @remetente.email, endereco_id: @remetente.endereco_id, nome: @remetente.nome, telefone: @remetente.telefone } }
    end

    assert_redirected_to remetente_url(Remetente.last)
  end

  test "should show remetente" do
    get remetente_url(@remetente)
    assert_response :success
  end

  test "should get edit" do
    get edit_remetente_url(@remetente)
    assert_response :success
  end

  test "should update remetente" do
    patch remetente_url(@remetente), params: { remetente: { email: @remetente.email, endereco_id: @remetente.endereco_id, nome: @remetente.nome, telefone: @remetente.telefone } }
    assert_redirected_to remetente_url(@remetente)
  end

  test "should destroy remetente" do
    assert_difference("Remetente.count", -1) do
      delete remetente_url(@remetente)
    end

    assert_redirected_to remetentes_url
  end
end
