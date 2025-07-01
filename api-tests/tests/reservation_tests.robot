*** Settings ***
Suite Setup       Setup - Criar Usuário Admin
Suite Teardown    Teardown - Deletar Usuário Admin

Resource    ../resources/keywords/common_keywords.robot
Resource   ../resources/keywords/teardowns_keywords.robot
Resource    ../resources/keywords/auth_keywords.resource
Resource    ../resources/keywords/session_keywords.resource
Resource    ../resources/keywords/reservation_keywords.resource
Resource    ../resources/variables/env_variables.robot

*** Test Cases ***
Cenário 13: Criar nova reserva
    [Documentation]    Testa se um usuário autenticado consegue criar uma nova reserva com sucesso.
    [Tags]    reservas    post    usuario    integracao

    [Teardown]    Executar Teardowns da Reserva

    Criar E Autenticar Usuario Comum
    Criar Teatro Para Sessao
    Criar Filme Para Sessao
    Criar sessao com sucesso
    Criar reserva como usuario autenticado

Cenário 14: Buscar reservas do próprio usuário
    [Documentation]    Testa se um usuário autenticado consegue listar suas próprias reservas.
    [Tags]    reservas    get    usuario    integracao

    [Teardown]    Executar Teardowns da Reserva
    Criar E Autenticar Usuario Comum
    Criar Teatro Para Sessao
    Criar Filme Para Sessao
    Criar sessao com sucesso
    Criar reserva como usuario autenticado
    Buscar Reservas Do Usuário Autenticado

Cenário 15: Criar reserva sem autenticação
    [Documentation]    Testa se a API impede criar reserva sem autenticação.
    [Tags]    reservas    post    integracao    sem_token

    [Teardown]    Executar Teardowns da Reserva
    Criar E Autenticar Usuario Comum
    Criar Teatro Para Sessao
    Criar Filme Para Sessao
    Criar sessao com sucesso

    Tentar Criar Reserva Sem Autenticacao

Cenário 16: Usuário comum tenta deletar reserva
    [Documentation]    Testa se um usuário comum é impedido de deletar uma reserva.
    [Tags]    reservas    delete    usuario    seguranca

    Criar E Autenticar Usuario Comum
    Criar Teatro Para Sessao
    Criar Filme Para Sessao
    Criar sessao com sucesso
    Criar reserva como usuario autenticado

    Usuario Comum Tenta Deletar Reserva