*** Settings ***
Library           Browser
Library           Collections
Resource          ../resources/variables/env_variables.robot
Resource          ../resources/keywords/base.robot
Resource          ../resources/keywords/users_keywords.resource
Resource          ../resources/keywords/movies_keywords.resource
Suite Setup       Abrir Navegador
Suite Teardown    Fechar Navegador

*** Test Case ***
Cenário 03: Fazer uma reserva em uma sessão de um filme como usuário comum
    Ir Para Página De Login
    Preencher Formulário De Login
    Enviar Login
    Verificar Login Bem-Sucedido
    Ir para a página de filmes em cartaz
    Selecionar o primeiro filme em cartaz
    Selecionar Sessão Do Filme
    Confirmar Reserva
    Verificar Reserva Bem Sucedida