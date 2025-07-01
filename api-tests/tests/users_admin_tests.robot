*** Settings ***
Suite setup           Setup - Criar Usuário Admin
Suite Teardown        Teardown - Deletar Usuário Admin

Resource    ../resources/keywords/common_keywords.robot
Resource    ../resources/keywords/auth_keywords.resource
Resource    ../resources/keywords/users_admin_keywords.resource
Resource    ../resources/variables/env_variables.robot

*** Test Cases ***
Cenário 05: Listar todos os usuários
    [Tags]    admin    smoke
    Listar Usuarios Como Admin