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
Cenário 05: Verificar minhas reservas atuais
    Ir para a página de minhas reservas
    Verificar Lista De Reservas
    Verificar Titulo Minhas Reservas
    Verificar Redirecionamento Para Pagina Inicial
