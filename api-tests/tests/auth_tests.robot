*** Settings ***
Suite Setup    Criar E Autenticar Usuário De Teste
Suite Teardown  Excluir Usuario Criado Com Token Admin

Resource    ../resources/keywords/common_keywords.robot
Resource    ../resources/keywords/auth_keywords.resource
Resource    ../resources/variables/env_variables.robot

*** Test Cases ***
Cenário 01: Cadastro de usuário válido
    Cadastrar Usuário Com Dados Válidos
    Verifica Status De Resposta    201

Cenário 02: Buscar perfil do usuário autenticado
    Buscar Perfil Do Usuário Autenticado
    Status Should Be    200    ${PROFILE_RESPONSE}

Cenário 03: Acessar /auth/me sem token
    [Tags]    security    smoke
    Acessar Perfil Sem Token

Cenário 04: Token expirado ou inválido
    [Tags]    security    smoke
    Acessar Perfil Com Token Invalido
