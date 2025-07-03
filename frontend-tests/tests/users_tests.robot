*** Settings ***
Library           Browser
Library           Collections
Resource          ../resources/variables/env_variables.robot
Resource          ../resources/keywords/base.robot
Resource          ../resources/keywords/users_keywords.resource
Suite Setup       Abrir Navegador
Suite Teardown    Fechar Navegador

*** Test Case ***
Cenário 01: Fazer um cadastro de um usuário comum 
    Ir Para Página De Cadastro
    Preencher Formulário De Cadastro
    Enviar Cadastro
    Verificar Mensagem De Sucesso

Cenário 02: Realizar o login desse usuário
    Ir Para Página De Login
    Preencher Formulário De Login
    Enviar Login
    Verificar Login Bem-Sucedido