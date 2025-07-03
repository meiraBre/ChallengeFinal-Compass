*** Keywords ***

Abrir Navegador
    New Browser    headless=false
    New Page    ${BASE_URL}

Fechar Navegador
    Close Browser