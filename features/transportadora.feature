Feature: Gerenciamento de transportadora
  As a Usuario do sistema
  I want to registrar, editar e remover uma transportadora da encomenda
  So that eu mantenha as transportadoras atualizadas

  Scenario: Cadastrar uma transportadora
    Given que estou na página de cadastro de transportadoras
    When preencho os campos obrigatórios para cadastrar uma nova transportadora
    And clico no botão "Cadastrar"
    Then devo ver uma mensagem indicando que a transportadora foi cadastrada com sucesso

  Scenario: Editar uma transportadora
    Given que existem transportadoras cadastradas no sistema
    And estou na página de edição de transportadora
    When seleciono uma transportadora para editar
    And faço as alterações necessárias nos campos
    And clico no botão "Editar transportadora"
    Then devo ver uma mensagem indicando que a transportadora foi atualizada com sucesso

  Scenario: Remover uma transportadora
    Given que existem transportadoras cadastradas no sistema
    And estou na página de índice de transportadoras
    When seleciono uma transportadora para remover
    And clico no botão "Deletar"
    Then devo ver uma mensagem de confirmação
    And a transportadora não deve mais aparecer na lista de transportadoras

  Scenario: Tentar cadastrar uma transportadora com dados inválidos
    Given que estou na página de cadastro de transportadoras
    When preencho os campos obrigatórios com dados inválidos
    And clico no botão "Cadastrar"
    Then devo ver mensagens de erro indicando os problemas nos campos

  Scenario: Tentar editar uma transportadora com dados inválidos
    Given que existem transportadoras cadastradas no sistema
    And estou na página de edição de transportadora
    When seleciono uma transportadora para editar
    And faço alterações nos campos, incluindo dados inválidos
    And clico no botão "Editar transportadora"
    Then devo ver mensagens de erro indicando os problemas nos campos
