*** Settings ***
Suite Setup    Criar E Autenticar Usuário De Teste
Suite Teardown    Excluir Usuario Criado    ${TOKEN_USUARIO}    ${USER_ID}


Resource    ../resources/keywords/common_keywords.robot
Resource    ../resources/keywords/auth_keywords.resource
Resource    ../resources/variables/env_variables.robot

*** Test Cases ***
Cenário 05: Listar todos os usuários
    [Tags]    admin    smoke
    Listar Usuarios Como Admin