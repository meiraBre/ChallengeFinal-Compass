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
Cenário 13: Buscar reservas do próprio usuário
    [Tags]    reserva    get    sucesso
    [Teardown]    Deletar Usuario Criado

    Criar E Autenticar Usuario Comum
    Enviar Requisicao De Busca De Reservas
    Validar Resposta 200 Com Lista De Reservas

Cenário 14: Criar reserva sem autenticação
    [Tags]    reserva    post    nao-autenticado
    Criar Corpo Da Reserva Sem Token
    Enviar Requisicao De Reserva Sem Autenticacao
    Validar Resposta 401 Sem Autorizacao