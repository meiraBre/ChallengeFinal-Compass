*** Settings ***
Library    RequestsLibrary


*** Keywords ***
Criar reserva como usuario autenticado
    ${headers}=    Create Dictionary    Authorization=${TOKEN_USUARIO}
    ${seat}=    Create Dictionary    row=B    number=3    type=full
    ${seats}=    Create List    ${seat}

    ${dados_reserva}=    Create Dictionary
    ...    session=${ID_SESSAO_CRIADA}
    ...    seats=${seats}
    ...    paymentMethod=credit_card

    Create Session    reserva    ${BASE_URL}
    ${res}=    POST On Session    reserva    /reservations    headers=${headers}    json=${dados_reserva}
    Status Should Be    201    ${res}
    ${id_reserva}=    Set Variable    ${res.json()['data']['_id']}
    Set Suite Variable    ${ID_RESERVA_CRIADA}    ${id_reserva}
    Log    Reserva criada com sucesso

Buscar Reservas Do Usuário Autenticado
    [Documentation]    Realiza GET em /reservations/me e retorna reservas do usuário autenticado.

    ${headers}=    Create Dictionary    Authorization=${TOKEN_USUARIO}
    Create Session    reservas_usuario    ${BASE_URL}
    ${res}=    GET On Session    reservas_usuario    /reservations/me    headers=${headers}
    Status Should Be    200    ${res}
    Log    ✔️ Reservas do usuário listadas com sucesso
    Set Suite Variable    ${RESERVAS_USUARIO}    ${res.json()}

Tentar Criar Reserva Sem Autenticacao
    ${dados_reserva}=    Create Dictionary
    ...    session=${ID_SESSAO_CRIADA}
    ...    seats=[{"row": "B", "number": 4, "type": "full"}]
    ...    paymentMethod=credit_card

    Create Session    reserva_sem_token    ${BASE_URL}
    ${res}=    POST On Session    reserva_sem_token    /reservations    json=${dados_reserva}    expected_status=ANY
    Status Should Be    401    ${res}
    Log    ✔️ A API bloqueou corretamente a tentativa de reserva sem autenticação (401)

Usuario Comum Tenta Deletar Reserva
    ${headers}=    Create Dictionary    Authorization=${TOKEN_USUARIO}

    Create Session    tentativa_delete    ${BASE_URL}
    ${res}=    DELETE On Session    tentativa_delete    /reservations/${ID_RESERVA_CRIADA}    headers=${headers}    expected_status=ANY

    Status Should Be    403    ${res}
    Log    ✔️ Usuário comum não tem permissão para deletar reservas (403)

