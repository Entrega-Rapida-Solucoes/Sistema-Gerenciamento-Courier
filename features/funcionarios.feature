Feature: Gerenciamento de funcionario
  As a Usuario do sistema
  I want to registrar, editar e remover um funcionario
  So that eu mantenha o registro de funcionarios atualizado


  Scenario: Cadastrar um funcionário
    Given que estou na página de cadastro de novo funcionário
    And preencho o formulário com informações válidas do funcionário
    When clico no botão "Criar Funcionário"
    Then devo ver uma mensagem de sucesso
    And devo estar na página de exibição do funcionário recém-criado

  Scenario: Editar um funcionário
    Given que há um funcionário existente no sistema
    And estou na página de edição do funcionário
    When atualizo as informações do funcionário
    And clico no botão "Atualizar Funcionário"
    Then devo ver uma mensagem de sucesso
    And devo estar na página de exibição do funcionário atualizado

  Scenario: Remover um funcionário
    Given que há um funcionário existente no sistema
    And estou na página de exibição do funcionário
    When clico no botão "Remover Funcionário"
    Then devo ver uma mensagem de confirmação
    And o funcionário deve ser removido do sistema
    And devo estar na página de índice de funcionários

  Scenario: Tentar cadastrar um funcionário sem preencher campos obrigatórios
    Given que estou na página de cadastro de novo funcionário
    When clico no botão "Criar Funcionário" sem preencher os campos obrigatórios
    Then devo ver mensagens de erro indicando campos obrigatórios

  Scenario: Tentar remover um funcionário inexistente
    Given que não há funcionário com ID especificado no sistema
    And estou na página de índice de funcionários
    When clico no botão "Remover Funcionário"
    Then devo ver uma mensagem de erro indicando que o funcionário não foi encontrado
