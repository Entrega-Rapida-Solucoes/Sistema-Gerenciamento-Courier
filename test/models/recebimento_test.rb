require "test_helper"

class RecebimentoTest < ActiveSupport::TestCase

  setup do
    @remetente = Remetente.create(nome: "Remetente Teste", email: "remetente@example.com", telefone: "123456789", endereco_attributes: { cep: "12345-678", logradouro: "Rua A", numero: "123", complemento: "Apto 1", cidade: "Cidade A", bairro: "Bairro A", pais: "Brasil", codigo_postal: "123456" })
    @destinatario = Destinatario.create(nome: "Destinatario Teste", data_nascimento: Date.new(1990, 1, 1), cpf: "987.654.321-00", email: "destinatario@example.com", telefone: "987654321", endereco_attributes: { cep: "98765-432", logradouro: "Rua B", numero: "456", complemento: "Apto 2", cidade: "Cidade B", bairro: "Bairro B", pais: "Brasil", codigo_postal: "654321" })
    @transportadora = Transportadora.create(nome: "Transportadora Teste", telefone: "987654321", cnpj: "12345678901234", endereco_attributes: { cep: "54321-098", logradouro: "Rua C", numero: "789", complemento: "Apto 3", cidade: "Cidade C", bairro: "Bairro C", pais: "Brasil", codigo_postal: "321098" })
    @encomenda = Encomenda.create(peso: 2.5, status: "Em trânsito", data_entrega: Date.tomorrow, destinatario: @destinatario, remetente: @remetente, transportadora: @transportadora)
    @funcionario = Funcionario.create(nome: "João", cargo: "Analista", data_nascimento: Date.new(1990, 1, 1), cpf: "123.456.789-00", email: "joao@example.com", telefone: "123456789")
  end

  teardown do
    @remetente.destroy
    @destinatario.destroy
    @transportadora.destroy
    @encomenda.destroy
    @funcionario.destroy
  end

  test "não deve criar um recebimento válido" do
    recebimento = Recebimento.new(
      data_recebimento: Date.today,
      funcionario_id: 11111111,
      encomenda_id: 1111111111
    )

    assert_equal ["Funcionario must exist"], assigns(:recebimento).errors[:funcionario_id]
    assert_equal ["Encomenda must exist"], assigns(:recebimento).errors[:encomenda_id]
  end

  # Teste
  test "não deve salvar recebimento sem data de recebimento" do
    assert_no_difference('Recebimento.count') do
      post :create, params: {
        recebimento: {
          funcionario_id: 1,
          encomenda_id: 1
        }
      }
    end

    assert_response :unprocessable_entity
    assert_template :new
    assert_not_empty assigns(:recebimento).errors[:data_recebimento]

    assert_equal ["Data recebimento can't be blank"], assigns(:recebimento).errors[:data_recebimento]
  end

  test "deve criar um recebimento com informações válidas" do
    assert_difference('Recebimento.count') do
      post recebimentos_url, params: {
        recebimento: {
          data_recebimento: Date.today,
          funcionario_id: @funcionario.id,
          encomenda_id: @encomenda.id
        }
      }
    end

    assert_redirected_to recebimento_path(assigns(:recebimento))
    assert_equal "Recebimento was successfully created.", flash[:notice]
  end
end
