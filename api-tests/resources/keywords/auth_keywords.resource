*** Settings ***
Library    RequestsLibrary


*** Keywords ***
Cadastrar Usuário Com Dados Válidos
    Create Session    auth    ${BASE_URL}
    ${body}=    Create Dictionary    name=Brenda    email=brenda@email.com    password=123456
    ${response}=    POST On Session    auth    /auth/register    json=${body}
    Set Suite Variable    ${RESPONSE}    ${response}

Verifica Status De Resposta
    [Arguments]    ${expected_status}
    Status Should Be    ${expected_status}    ${RESPONSE}

Buscar Perfil Do Usuário Autenticado
    Create Session    auth    ${BASE_URL}
    ${headers}=    Create Dictionary    Authorization=Bearer ${TOKEN_USUARIO}
    ${response}=    GET On Session    auth    /auth/me    headers=${headers}
    Set Suite Variable    ${PROFILE_RESPONSE}    ${response}

Acessar Perfil Sem Token
    Create Session    sem_token    ${BASE_URL}
    ${response}=    GET On Session    sem_token    /auth/me    expected_status=ANY
    Status Should Be    401    ${response}
    Log    ✔️ Acesso negado sem token corretamente (401)

Acessar Perfil Com Token Invalido
    Create Session    token_invalido    ${BASE_URL}
    ${headers}=    Create Dictionary    Authorization=Bearer abc.def.123  # token fake
    ${response}=    GET On Session    token_invalido    /auth/me    headers=${headers}    expected_status=ANY
    Status Should Be    401    ${response}
    Log    ✔️ Token inválido rejeitado corretamente (401)
