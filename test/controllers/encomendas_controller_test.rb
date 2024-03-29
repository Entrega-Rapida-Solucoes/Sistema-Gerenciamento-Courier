require "test_helper"

class EncomendasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @encomenda = encomendas(:one)
  end

  test "should get index" do
    get encomendas_url
    assert_response :success
  end

  test "should get new" do
    get new_encomenda_url
    assert_response :success
  end

  test "should create encomenda" do
    assert_difference("Encomenda.count") do
      post encomendas_url, params: { encomenda: { data_entrega: @encomenda.data_entrega, destinatario_id: @encomenda.destinatario_id, peso: @encomenda.peso, remetente_id: @encomenda.remetente_id, status: @encomenda.status } }
    end

    assert_redirected_to encomenda_url(Encomenda.last)
  end

  test "should show encomenda" do
    get encomenda_url(@encomenda)
    assert_response :success
  end

  test "should get edit" do
    get edit_encomenda_url(@encomenda)
    assert_response :success
  end

  test "should update encomenda" do
    patch encomenda_url(@encomenda), params: { encomenda: { data_entrega: @encomenda.data_entrega, destinatario_id: @encomenda.destinatario_id, peso: @encomenda.peso, remetente_id: @encomenda.remetente_id, status: @encomenda.status } }
    assert_redirected_to encomenda_url(@encomenda)
  end

  test "should destroy encomenda" do
    assert_difference("Encomenda.count", -1) do
      delete encomenda_url(@encomenda)
    end

    assert_redirected_to encomendas_url
  end
end
