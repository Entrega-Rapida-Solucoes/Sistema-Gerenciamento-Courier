Feature: Busca de funcionario
  As a Usuario do sistema
  I want to buscar funcionarios por nome ou CPF
  So that eu visualize o historico de encomendas que o funcionario recebeu

  Scenario: Buscar funcionário por nome
    Given que existem funcionários no sistema com diferentes nomes
    And estou na página de índice de funcionários
    When preencho o campo "Nome" com um nome específico
    And clico no botão "Buscar"
    Then devo ver apenas os funcionários com aquele nome específico

  Scenario: Buscar funcionário por CPF
    Given que existem funcionários no sistema com diferentes CPFs
    And estou na página de índice de funcionários
    When preencho o campo "CPF" com um CPF específico
    And clico no botão "Buscar"
    Then devo ver apenas os funcionários com aquele CPF específico

  Scenario: Tentar buscar funcionário com nome inexistente
    Given que estou na página de índice de funcionários
    When preencho o campo "Nome" com um nome que não existe
    And clico no botão "Buscar"
    Then devo ver uma mensagem indicando que nenhum funcionário foi encontrado

  Scenario: Tentar buscar funcionário com CPF inexistente
    Given que estou na página de índice de funcionários
    When preencho o campo "CPF" com um CPF que não existe
    And clico no botão "Buscar"
    Then devo ver uma mensagem indicando que nenhum funcionário foi encontrado

  Scenario: Buscar funcionário por nome e CPF
    Given que existem funcionários no sistema com diferentes nomes e CPFs
    And estou na página de índice de funcionários
    When preencho ambos os campos "Nome" e "CPF"
    And clico no botão "Buscar"
    Then devo ver apenas os funcionários com aquele nome e CPF específicos
