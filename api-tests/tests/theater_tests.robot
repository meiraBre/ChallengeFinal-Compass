*** Settings ***
Suite Setup       Setup - Criar Usuário Admin
Suite Teardown    Teardown - Deletar Usuário Admin

Resource    ../resources/keywords/common_keywords.robot
Resource    ../resources/keywords/theater_keywords.resource
Resource   ../resources/keywords/teardowns_keywords.robot
Resource    ../resources/keywords/auth_keywords.resource
Resource    ../resources/variables/env_variables.robot

*** Test Cases ***
Cenário 11: Listar todos os teatros
    [Documentation]    Testa se a API retorna a lista de todos os teatros com sucesso.
    [Tags]    teatros    get    integracao

    Listar todos os teatros

Cenário 12: Usuário comum tenta atualizar teatro
    [Documentation]    Testa se um usuário comum é impedido de atualizar um teatro (esperado: 403 Forbidden).
    [Tags]    teatros    put    forbidden    usuario_comum
    
    [Teardown]    Deletar Usuario Criado
    Criar E Autenticar Usuario Comum
    Tentar Atualizar Teatro Como Usuario Comum