*** Keywords ***

Ir Para Página Inicial
    Go To    http://localhost:3002/

Clicar Botao Ver Filmes Em Cartaz
    Click    xpath=//*[@id="root"]/main/div/div[1]/div/a

Verificar Lista De Filmes Em Cartaz Está Visível
    Wait For Elements State    css=.movie-card    visible    timeout=10s
    ${qtd}=    Get Element Count    css=.movie-card

Ir para a página de filmes em cartaz
    Go To    ${BASE_URL}/movies

Selecionar o primeiro filme em cartaz
    Click    css=.movie-card:first-child a.btn.btn-primary

Selecionar Sessão Do Filme
    Click    xpath=//*[@id="root"]/main/div/div/div/div[2]/div[5]/div/div[1]/div/div[1]/a

Selecionar assento
    Click    xpath=//*[@id="root"]/main/div/div/div[5]/div[1]/div[2]/button[1]

Confirmar Pagamento
    Click    xpath=//button[contains(., 'Continuar para Pagamento')]

Finalizar Compra
    Click    xpath=//button[contains(text(), 'Finalizar Compra')]

Verificar Reserva Bem Sucedida
    Wait For Elements State    text=Reserva Confirmada!    visible    timeout=5s
