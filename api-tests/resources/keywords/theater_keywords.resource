*** Settings ***
Library    RequestsLibrary

*** Keywords ***
Listar todos os teatros
    Create Session    listar_teatros    ${BASE_URL}
    ${res}=    GET On Session    listar_teatros    /theaters
    Status Should Be    200    ${res}
    Log    Lista de teatros recebida com sucesso

Tentar Atualizar Teatro Como Usuario Comum
    [Documentation]    Envia PUT /theaters/{id} com token de usuário comum, espera status 403.

    ${headers}=    Create Dictionary    Authorization=${TOKEN_USUARIO}
    ${id_fake}=    Set Variable    000000000000000000000000
    ${dados}=    Create Dictionary    name=Theater Fake    capacity=100    type=standard

    Create Session    put_teatro_user    ${BASE_URL}
    ${res}=    PUT On Session    put_teatro_user    /theaters/${id_fake}    headers=${headers}    json=${dados}    expected_status=ANY
    Status Should Be    403    ${res}
    Log    Atualização de teatro bloqueada para usuário comum (403)