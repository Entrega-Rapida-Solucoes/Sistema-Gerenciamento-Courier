require "test_helper"

class RecebimentosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @recebimento = recebimentos(:one)
  end

  test "should get index" do
    get recebimentos_url
    assert_response :success
  end

  test "should get new" do
    get new_recebimento_url
    assert_response :success
  end

  test "should create recebimento" do
    assert_difference("Recebimento.count") do
      post recebimentos_url, params: { recebimento: { data_recebimento: @recebimento.data_recebimento, encomenda_id: @recebimento.encomenda_id, funcionario_id: @recebimento.funcionario_id } }
    end

    assert_redirected_to recebimento_url(Recebimento.last)
  end

  test "should show recebimento" do
    get recebimento_url(@recebimento)
    assert_response :success
  end

  test "should get edit" do
    get edit_recebimento_url(@recebimento)
    assert_response :success
  end

  test "should update recebimento" do
    patch recebimento_url(@recebimento), params: { recebimento: { data_recebimento: @recebimento.data_recebimento, encomenda_id: @recebimento.encomenda_id, funcionario_id: @recebimento.funcionario_id } }
    assert_redirected_to recebimento_url(@recebimento)
  end

  test "should destroy recebimento" do
    assert_difference("Recebimento.count", -1) do
      delete recebimento_url(@recebimento)
    end

    assert_redirected_to recebimentos_url
  end
end
