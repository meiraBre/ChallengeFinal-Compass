*** Settings ***
Library    RequestsLibrary
Library    Collections
Library    BuiltIn

*** Keywords ***

Criar E Autenticar Usuário De Teste
    ${timestamp}=    Get Time    epoch
    ${email}=        Set Variable    teste${timestamp}@email.com
    ${senha}=        Set Variable    123456

    Create Session    auth    ${BASE_URL}

    ${dados}=        Create Dictionary    name=Teste QA    email=${email}    password=${senha}
    ${cadastro}=     POST On Session    auth    /auth/register    json=${dados}
    Should Be Equal As Integers    ${cadastro.status_code}    201

    ${login}=        Create Dictionary    email=${email}    password=${senha}
    ${login_response}=    POST On Session    auth    /auth/login    json=${login}
    Should Be Equal As Integers    ${login_response.status_code}    200

    ${dados}=       Get From Dictionary    ${login_response.json()}    data
    ${token}=       Get From Dictionary    ${dados}    token
    ${user_id}=     Get From Dictionary    ${dados}    _id

    Set Suite Variable    ${TOKEN_USUARIO}     ${token}
    Set Suite Variable    ${USER_ID}           ${user_id}
    Set Suite Variable    ${EMAIL_USUARIO}     ${email}
    Set Suite Variable    ${SENHA_USUARIO}     ${senha}

Excluir Usuario Criado
    [Arguments]    ${token}    ${user_id}
    Create Session    users    ${BASE_URL}
    ${headers}=    Create Dictionary    Authorization=Bearer ${token}
    ${response}=    DELETE On Session    users    /users/${user_id}    headers=${headers}
    Status Should Be    200    ${response}

Autenticar Como Admin
    ${login}=    Create Dictionary    email=admin@email.com    password=admin123
    Create Session    auth    ${BASE_URL}
    ${response}=    POST On Session    auth    /auth/login    json=${login}
    ${dados}=       Get From Dictionary    ${response.json()}    data
    ${token_admin}= Get From Dictionary    ${dados}    token
    [Return]        ${token_admin}

Excluir Usuario Criado Com Token Admin
    ${token_admin}=    Autenticar Como Admin
    Excluir Usuario Criado    ${token_admin}    ${USER_ID}





