*** Settings ***
Suite Setup       Setup - Criar Usuário Admin
Suite Teardown    Teardown - Deletar Usuário Admin

Resource    ../resources/keywords/common_keywords.robot
Resource    ../resources/keywords/movie_keywords.resource
Resource    ../resources/variables/env_variables.robot

*** Test Cases ***
Cenário 06: Criar novo filme - admin
    [Documentation]    Testa se um admin consegue criar um novo filme com sucesso.
    [Tags]    admin    filmes    post    integracao
    Criar um novo filme como admin

Cenário 07: Listar todos os filmes
    [Documentation]    Testa se a API retorna com sucesso a lista de filmes, sem necessidade de autenticação.
    [Tags]    filmes    get    smoke    publico
    Listar todos os filmes

Cenário 08: Usuário comum tenta criar filme
    [Documentation]    Testa se um usuário comum consegue criar um novo filme com sucesso.
    [Tags]    filmes    post    integracao
    Criar um novo filme como usuário comum