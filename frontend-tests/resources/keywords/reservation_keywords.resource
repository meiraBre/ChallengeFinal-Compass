*** Keywords ***

Ir para a página de minhas reservas
    Go To    ${BASE_URL}/reservations

Verificar Lista De Reservas
    ${resultado}=    Run Keyword And Ignore Error    Wait For Elements State    xpath=//h1[text()="Minhas Reservas"]    visible    timeout=5s
    Run Keyword If    '${resultado}[0]' == 'PASS'    Verificar Titulo Minhas Reservas
    ...    ELSE    Verificar Redirecionamento Para Pagina Inicial

Verificar Titulo Minhas Reservas
    ${titulo}=    Get Text    xpath=//h1[text()="Minhas Reservas"]
    Should Be Equal    ${titulo}    Minhas Reservas

Verificar Redirecionamento Para Pagina Inicial
    ${url}=    Get Location
    Should Be Equal    ${url}    http://localhost:3002/
