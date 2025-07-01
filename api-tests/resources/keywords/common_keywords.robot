*** Settings ***
Library    RequestsLibrary
Library    Collections
Library    BuiltIn

Resource    ../variables/env_variabless

*** Keywords ***

Setup - Criar Usuário Admin
    ${timestamp}=    Get Time    epoch
    ${ADMIN_EMAIL}=    Set Variable    admin_teste_${timestamp}@email.com
    Set Suite Variable    ${ADMIN_EMAIL}

    Create Session    setup    ${BASE_URL}
    ${payload}=    Create Dictionary    name=${ADMIN_NAME}    email=${ADMIN_EMAIL}    password=${ADMIN_PASSWORD}
    ${response}=    POST On Session    setup    /setup/admin    json=${payload}
    Should Be Equal As Integers    ${response.status_code}    201

    ${login_data}=    Create Dictionary    email=${ADMIN_EMAIL}    password=${ADMIN_PASSWORD}
    ${login_response}=    POST On Session    setup    /auth/login    json=${login_data}
    Should Be Equal As Integers    ${login_response.status_code}    200

    ${token}=   Set Variable   Bearer ${login_response.json()['data']['token']}
    Set Global Variable    ${ADMIN_TOKEN}    ${token}
    Set Global Variable    ${ADMIN_ID}    ${login_response.json()['data']['_id']}

Teardown - Deletar Usuário Admin
    Create Session    teardown    ${BASE_URL}    headers={"Authorization": "${ADMIN_TOKEN}"}
    ${response}=    DELETE On Session    teardown    /users/${ADMIN_ID}
    Should Be Equal As Integers    ${response.status_code}    200






