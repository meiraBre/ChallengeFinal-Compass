*** Settings ***
Library    RequestsLibrary

*** Keywords ***
Listar Usuarios Como Admin
    Criar E Autenticar Usuario Admin
    Create Dictionary    Authorization=Bearer ${TOKEN_ADMIN}
    ${headers}=    Create Dictionary    Authorization=Bearer ${TOKEN_ADMIN}
    Create Session    admin    ${BASE_URL}
    ${response}=    GET On Session    admin    /users    headers=${headers}    expected_status=ANY
    Status Should Be    200    ${response}
    Log    ✔️ Lista de usuários recebida com sucesso (200)