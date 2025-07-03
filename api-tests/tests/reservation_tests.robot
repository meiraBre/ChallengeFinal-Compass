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

Cenário 14: Usuário comum tenta deletar reserva
    [Tags]    reserva    seguranca    forbidden
    [Teardown]    Deletar Usuario Criado
    
    Criar E Autenticar Usuario Comum
    Tentar Deletar Reserva Comum Com ID Fixo
    Validar Falha Deletar Reserva Sem Permissão

Cenário 15: Criar reserva sem assentos
    [Tags]    reserva    validacao    negativo
    [Teardown]    Deletar Usuario Criado
    
    Criar E Autenticar Usuario Comum
    Tentar Criar Reserva Sem Assentos
    Validar Erro Campo Obrigatório Assentos