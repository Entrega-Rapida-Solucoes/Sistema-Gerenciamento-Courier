require "test_helper"

class DestinatarioTest < ActiveSupport::TestCase
  test "should create destinatario" do
    assert_difference('Recipient.count') do
      Recipient.create(nome: "João Silva",
                       data_nascimento: Date.new(1985, 1, 1),
                       telefone: "1234",
                       cpf: "12345678901",
                       email: "joao.silva@example.com")
    end
  end

  test "should update destinatario" do
    destinatario = Recipient.create(nome: "João Silva",
                                    data_nascimento: Date.new(1985, 1, 1),
                                    telefone: "1234",
                                    cpf: "12345678901",
                                    email: "joao.silva@example.com")
    destinatario.update(nome: "Maria Souza")
    assert_equal "Maria Souza", destinatario.nome
  end

  test "should read destinatario" do
    destinatario = Recipient.create(nome: "João Silva",
                                    data_nascimento: Date.new(1985, 1, 1),
                                    telefone: "1234",
                                    cpf: "12345678901",
                                    email: "joao.silva@example.com")
    assert_equal "João Silva", destinatario.nome
  end

  test "should delete destinatario" do
    destinatario = Recipient.create(nome: "João Silva",
                                    data_nascimento: Date.new(1985, 1, 1),
                                    telefone: "1234",
                                    cpf: "12345678901",
                                    email: "joao.silva@example.com")
    assert_difference('Recipient.count', -1) do
      destinatario.destroy
    end
end
