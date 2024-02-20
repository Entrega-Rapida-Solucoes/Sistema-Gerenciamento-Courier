require "test_helper"

class EnderecoTest < ActiveSupport::TestCase
  test "should create address" do
    assert_difference('Address.count') do
      Address.create(logradouro: "Rua Teste",
                     numero: "123",
                     complemento: "Apto 45",
                     cidade: "São Paulo",
                     bairro: "Jardins",
                     pais: "Brazil",
                     codigo_postal: "12345678")
    end
  end

  test "should update address" do
    address = Address.create(logradouro: "Rua Teste",
                             numero: "123",
                             complemento: "Apto 45",
                             cidade: "São Paulo",
                             bairro: "Jardins",
                             pais: "Brazil",
                             codigo_postal: "12345678")
    address.update(logradouro: "Rua Teste 2")
    assert_equal "Rua Teste 2", address.logradouro
  end

  test "should read address" do
    address = Address.create(logradouro: "Rua Teste",
                             numero: "123",
                             complemento: "Apto 45",
                             cidade: "São Paulo",
                             bairro: "Jardins",
                             pais: "Brazil",
                             codigo_postal: "12345678")
    assert_equal "Rua Teste", address.logradouro
  end

  test "should delete address" do
    address = Address.create(logradouro: "Rua Teste",
                             numero: "123",
                             complemento: "Apto 45",
                             cidade: "São Paulo",
                             bairro: "Jardins",
                             pais: "Brazil",
                             codigo_postal: "12345678")
    assert_difference('Address.count', -1) do
      address.destroy
    end
end
