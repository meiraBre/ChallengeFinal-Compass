*** Settings ***
Library    RequestsLibrary

*** Keywords ***
Listar Usuarios Como Admin
    [Documentation]    Lista todos os usuários usando um token de admin válido.
    ...                Endpoint: GET /users
    ...                Espera status 200 e retorno com campo "data".
    [Tags]    admin    smoke

    ${headers}=    Create Dictionary    Authorization=${ADMIN_TOKEN}
    Create Session    admin    ${BASE_URL}
    ${response}=    GET On Session    admin    /users    headers=${headers}    expected_status=ANY

    Status Should Be    200    ${response}
    Dictionary Should Contain Key    ${response.json()}    data
    Log    ✔️ Lista de usuários recebida com sucesso (200)
    Log    🔢 Total de usuários: ${response.json()['count']}
