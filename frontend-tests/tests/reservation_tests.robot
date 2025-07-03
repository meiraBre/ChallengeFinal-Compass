*** Settings ***
Library           Browser
Library           Collections
Resource          ../resources/variables/env_variables.robot
Resource          ../resources/keywords/base.robot
Resource          ../resources/keywords/users_keywords.resource
Resource          ../resources/keywords/reservation_keywords.resource
Suite Setup       Abrir Navegador
Suite Teardown    Fechar Navegador

*** Test Case ***
Cenário 04: Verificar minhas reservas atuais
    Ir Para Página De Login
    Preencher Formulário De Login
    Enviar Login
    Verificar Login Bem-Sucedido
    Ir para a página de minhas reservas
    Verificar Lista De Reservas
