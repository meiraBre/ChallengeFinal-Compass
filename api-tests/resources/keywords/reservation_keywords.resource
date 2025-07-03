*** Settings ***
Library    RequestsLibrary

*** variables ***
${ENDPOINT_RESERVAS}    /reservations/me
${ID_SESSAO_VALIDO}=    6865ac675acb3c4ada24ab4f
${ENDPOINT_RESERVA}      /api/v1/reservations

*** Keywords ***
Enviar Requisicao De Busca De Reservas
    Create Session    reserva    ${BASE_URL}
    ${headers}=    Create Dictionary    Authorization=${TOKEN_USUARIO}
    ${resposta}=    GET On Session
    ...    reserva
    ...    ${ENDPOINT_RESERVAS}
    ...    headers=${headers}
    Set Test Variable    ${RESPOSTA_RESERVAS}    ${resposta}

Validar Resposta 200 Com Lista De Reservas
    Should Be Equal As Integers    ${RESPOSTA_RESERVAS.status_code}    200
    Should Be True    ${RESPOSTA_RESERVAS.json()['success']}
    Log    Total de reservas encontradas: ${RESPOSTA_RESERVAS.json()['count']}

Criar Corpo Da Reserva Sem Token
    ${assento1}=    Create Dictionary    row=D    number=1    type=full
    ${assento2}=    Create Dictionary    row=D    number=2    type=half
    ${seats}=       Create List    ${assento1}    ${assento2}
    ${corpo}=       Create Dictionary
    ...    session=${ID_SESSAO_VALIDO}
    ...    paymentMethod=credit_card
    ...    seats=${seats}
    Set Test Variable    ${CORPO_RESERVA}    ${corpo}

Enviar Requisicao De Reserva Sem Autenticacao
    Create Session    reserva_sem_token    ${BASE_URL}
    ${resposta}=    POST On Session
    ...    reserva_sem_token
    ...    ${ENDPOINT_RESERVA}
    ...    json=${CORPO_RESERVA}
    Set Test Variable    ${RESPOSTA_RESERVA}    ${resposta}

Validar Resposta 401 Sem Autorizacao
    Should Be Equal As Integers    ${RESPOSTA_RESERVA.status_code}    401
    Should Be True    "${RESPOSTA_RESERVA.json()['success']}" == "false"
    Log    Mensagem recebida: ${RESPOSTA_RESERVA.json()['message']}



