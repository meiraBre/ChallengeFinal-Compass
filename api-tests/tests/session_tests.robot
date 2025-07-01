*** Settings ***
Suite Setup       Setup - Criar Usuário Admin
Suite Teardown    Teardown - Deletar Usuário Admin

Resource    ../resources/keywords/common_keywords.robot
Resource   ../resources/keywords/teardowns_keywords.robot
Resource    ../resources/keywords/session_keywords.resource
Resource    ../resources/variables/env_variables.robot

*** Test Cases ***
Cenário 09: Criar nova sessão - admin
    [Documentation]    Testa se um admin consegue criar uma nova sessão com sucesso, usando IDs válidos de filme e teatro.
    [Tags]    admin    sessão    post    integracao

    [Teardown]    Deletar sessão, filme e teatro criados

    Criar Filme Para Sessao
    Criar Teatro Para Sessao
    Criar sessao com sucesso

Cenário 10: Criar sessão com IDs inválidos
    [Documentation]    Testa se a API retorna erro ao tentar criar uma sessão com movie e theater inexistentes.
    [Tags]    admin    sessão    post    ids_invalidos    integracao

    Criar sessão com ID Invalido
    