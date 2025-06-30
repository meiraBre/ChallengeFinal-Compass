*** Settings ***
Library           RequestsLibrary
Resource          ../resources/variables/env_variables.robot

*** Test Cases ***
Cenário 01: Cadastro Válido
    [Tags]    smoke
    Create Session    auth    ${BASE_URL}
    ${body}=    Create Dictionary    name=Brenda    email=brenda@email.com    password=123456
    ${response}=    POST    auth/register    json=${body}
    Status Should Be    201    ${response}