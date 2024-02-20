Feature: Funcionário
    
    Scenario: Adicionar um novo funcionário
    Given Eu estou na página de New funcionario
    When Eu preencho "Nome" com "Carlos Teste"
    And Eu preencho "Cargo" com "Gerente"
    And Eu preencho "Data de Nascimento" com "1990-05-12"
    And Eu preencho "CPF" com "12345678901"
    And Eu preencho "E-mail" com "carlos.teste@exemplo.com"
    And Eu preencho "Telefone" com "12-123456789"
    And Eu clico no botao "Create Funcionario"
    Then Eu vejo a mensagem de sucesso "Funcionario was successfully created."

    Scenario: Editar um funcionário
    Given Eu estou na página de Edit funcionario com o ID 1
    When Eu preencho "Nome" com "Carlos Novo Teste"
    And Eu preencho "Cargo" com "Supervisor"
    And Eu preencho "Data de Nascimento" com "1991-06-01"
    And Eu preencho "CPF" com "98765432101"
    And Eu preencho "E-mail" com "carlos.novo.teste@exemplo.com"
    And Eu preencho "Telefone" com "13-987654321"
    And Eu clico no botao "Update Funcionario"
    Then Eu vejo a mensagem de sucesso "Funcionario was successfully updated."