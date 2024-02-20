require "test_helper"

class RemetenteTest < ActiveSupport::TestCase
  test "should create remetente" do
    assert_difference('Sender.count') do
      Sender.create(nome: "João da Silva",
                    email: "joao.silva@example.com",
                    telefone: "123456789")
    end
  end

  test "should update remetente" do
    remetente = Sender.create(nome: "João da Silva",
                              email: "joao.silva@example.com",
                              telefone: "123456789")
    remetente.update(nome: "Maria Souza")
    assert_equal "Maria Souza", remetente.nome
  end

  test "should read remetente" do
    remetente = Sender.create(nome: "João da Silva",
                              email: "joao.silva@example.com",
                              telefone: "123456789")
    assert_equal "João da Silva", remetente.nome
  end

  test "should delete remetente" do
    remetente = Sender.create(nome: "João da Silva",
                              email: "joao.silva@example.com",
                              telefone: "123456789")
    assert_difference('Sender.count', -1) do
      remetente.destroy
    end
end
