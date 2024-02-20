require "test_helper"

class FuncionarioTest < ActiveSupport::TestCase
  test "should create funcionario" do
    assert_difference('Employee.count') do
      Employee.create(nome: "João Silva", cargo: "Gerente",
                      data_nascimento: Date.new(1985, 1, 1),
                      cpf: "12345678901",
                      telefone: "1234", email: "joao.silva@example.com")
    end
  end

  test "should update funcionario" do
    funcionario = Employee.create(nome: "João Silva", cargo: "Gerente",
                                  data_nascimento: Date.new(1985, 1, 1),
                                  cpf: "12345678901",
                                  telefone: "1234", email: "joao.silva@example.com")
    funcionario.update(nome: "Maria Souza")
    assert_equal "Maria Souza", funcionario.nome
  end

  test "should read funcionario" do
    funcionario = Employee.create(nome: "João Silva", cargo: "Gerente",
                                  data_nascimento: Date.new(1985, 1, 1),
                                  cpf: "12345678901",
                                  telefone: "1234", email: "joao.silva@example.com")
    assert_equal "João Silva", funcionario.nome
  end

  test "should delete funcionario" do
    funcionario = Employee.create(nome: "João Silva", cargo: "Gerente",
                                  data_nascimento: Date.new(1985, 1, 1),
                                  cpf: "12345678901",
                                  telefone: "1234", email: "joao.silva@example.com")
    assert_difference('Employee.count', -1) do
      funcionario.destroy
    end
end
