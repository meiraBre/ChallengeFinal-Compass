*** Settings ***
Library    RequestsLibrary

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

Tentar Deletar Reserva Comum Com ID Fixo
    ${reservation_id}=    Set Variable    685da09fd93340dcbb031357
    ${headers}=    Create Dictionary    Authorization=${TOKEN_USUARIO}
    Create Session    reserva    ${BASE_URL}
    ${response}=    DELETE On Session    reserva    /reservations/${reservation_id}    headers=${headers}    expected_status=403
    Set Test Variable    ${delete_response}    ${response}

Validar Falha Deletar Reserva Sem Permissão
    Should Be Equal As Integers    ${delete_response.status_code}    403
    Should Contain    ${delete_response.text}    User role user is not authorized to access this route

Tentar Criar Reserva Sem Assentos
    ${body}=    Create Dictionary
    ...    session=${ID_SESSAO_VALIDO}
    Create Session    reserva    ${BASE_URL}
    ${headers}=    Create Dictionary    Authorization=${TOKEN_USUARIO}
    ${response}=    POST On Session    reserva    /reservations    headers=${headers}    json=${body}    expected_status=500
    Set Test Variable    ${reserva_sem_assento_response}    ${response}

Validar Erro Campo Obrigatório Assentos
    Should Be Equal As Integers    ${reserva_sem_assento_response.status_code}    500
    Should Contain    ${reserva_sem_assento_response.text}    seats is not iterable