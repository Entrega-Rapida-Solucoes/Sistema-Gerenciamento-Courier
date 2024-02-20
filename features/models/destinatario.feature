Funcionalidade: Gerenciamento de Destinatários

  Cenário: Criação de Destinatário
    Dado que estou na página de criação de destinatários
    Quando preencho o formulário com um nome, data de nascimento, CPF, e-mail e telefone válidos
    E clico no botão "Criar Destinatário"
    Então devo ser redirecionado para a página de visualização do destinatário
    E devo ver uma mensagem de sucesso confirmando a criação do destinatário

  Cenário: Edição de Destinatário
    Dado que exista um destinatário cadastrado no sistema
    E estou na página de edição desse destinatário
    Quando modifico os campos de nome, data de nascimento, CPF, e-mail ou telefone
    E clico no botão "Salvar Alterações"
    Então devo ser redirecionado para a página de visualização do destinatário atualizado
    E devo ver uma mensagem de sucesso confirmando a edição do destinatário

  Cenário: Visualização de Destinatário
    Dado que exista um destinatário cadastrado no sistema
    Quando acesso a página de visualização desse destinatário
    Então devo ver todos os detalhes do destinatário, incluindo nome, data de nascimento, CPF, e-mail e telefone

  Cenário: Exclusão de Destinatário
    Dado que exista um destinatário cadastrado no sistema
    E estou na página de visualização desse destinatário
    Quando clico no botão "Excluir Destinatário"
    Então devo ver uma mensagem de confirmação solicitando a exclusão do destinatário
    E ao confirmar, devo ser redirecionado para a lista de destinatários
    E o destinatário não deve mais estar presente na lista de destinatários
