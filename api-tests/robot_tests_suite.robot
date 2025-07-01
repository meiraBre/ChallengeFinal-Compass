*** Settings ***
Documentation     Suite de testes da API Cinema Challenge
Resource          ../resources/variables.robot
Resource          ../keywords/common_keywords.robot
Resource          ../keywords/auth_keywords.robot
Resource          ../keywords/users_keywords.robot
Library           RequestsLibrary

Suite Setup       Criar E Autenticar Usuario Admin

Test Setup        Log    🔹 Início do teste
Test Teardown     Log    🔸 Fim do teste

