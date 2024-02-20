require "test_helper"

class TransportadoraTest < ActiveSupport::TestCase
  test "deve salvar transportadora com informações válidas" do
    transportadora = Transportadora.new(
      nome: "Transportadora Teste",
      telefone: "1234567890",
      cnpj: "12.345.678/0001-90",
      endereco_attributes: {
        cep: "12345-678",
        logradouro: "Rua Teste",
        numero: "123",
        complemento: "Apto 1",
        cidade: "Cidade Teste",
        bairro: "Bairro Teste",
        pais: "Brasil",
        codigo_postal: "987654"
      }
    )

    assert transportadora.save
  end

  test "não deve salvar transportadora sem nome" do
    transportadora = Transportadora.new(
      telefone: "1234567890",
      cnpj: "12.345.678/0001-90",
      endereco_attributes: {
        cep: "12345-678",
        logradouro: "Rua Teste",
        numero: "123",
        complemento: "Apto 1",
        cidade: "Cidade Teste",
        bairro: "Bairro Teste",
        pais: "Brasil",
        codigo_postal: "987654"
      }
    )

    assert_not transportadora.save
    assert_includes transportadora.errors[:nome], "Nome can't be blank"
  end

  test "não deve salvar transportadora sem telefone" do
    transportadora = Transportadora.new(
      nome: "Transportadora Teste",
      cnpj: "12.345.678/0001-90",
      endereco_attributes: {
        cep: "12345-678",
        logradouro: "Rua Teste",
        numero: "123",
        complemento: "Apto 1",
        cidade: "Cidade Teste",
        bairro: "Bairro Teste",
        pais: "Brasil",
        codigo_postal: "987654"
      }
    )

    assert_not transportadora.save
    assert_includes transportadora.errors[:telefone], "Telefone can't be blank"
  end
end
