*** Keywords ***

Ir para a página de minhas reservas
    Go To    ${BASE_URL}/reservas

Verificar Lista De Reservas
    Wait For Elements State    xpath=//h1[text()="Minhas Reservas"]    visible    timeout=10s
    ${titulo}=    Get Text    xpath=//h1[text()="Minhas Reservas"]
    Should Be Equal    ${titulo}    Minhas Reservas
