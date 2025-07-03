*** Settings ***
Library           Browser
Library           Collections
Resource          ./resources/variables/env_variables.robot
Resource          ./resources/keywords/base.robot
Resource          ./resources/keywords/users_keywords.resource
Resource          ./resources/keywords/movies_keywords.resource
Resource          ./resources/keywords/reservation_keywords.resource

Suite Setup       Abrir Navegador
Suite Teardown    Fechar Navegador

*** Test Cases ***
Cenário 01: Fazer um cadastro de um usuário comum
    Ir Para Página De Cadastro
    Preencher Formulário De Cadastro
    Enviar Cadastro
    Verificar Mensagem De Sucesso

Cenário 02: Realizar o login desse usuário
    Ir Para Página De Login
    Preencher Formulário De Login
    Enviar Login
    Verificar Login Bem-Sucedido

Cenário 03: Fazer uma reserva em uma sessão de um filme como usuário comum
    Ir para a página de filmes em cartaz
    Selecionar o primeiro filme em cartaz
    Selecionar Sessão Do Filme
    Selecionar assento
    Confirmar Pagamento
    Finalizar Compra
    Verificar Reserva Bem Sucedida

Cenário 04: Ver os filmes de cartaz
    Ir Para Página Inicial
    Clicar Botao Ver Filmes Em Cartaz
    Verificar Lista De Filmes Em Cartaz Está Visível

Cenário 05: Verificar minhas reservas atuais
    Ir para a página de minhas reservas
    Verificar Lista De Reservas
    Verificar Titulo Minhas Reservas
    Verificar Redirecionamento Para Pagina Inicial