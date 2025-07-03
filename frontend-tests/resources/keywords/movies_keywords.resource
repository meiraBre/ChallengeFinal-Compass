*** Keywords ***

Ir para a página de filmes em cartaz
    Go To    ${BASE_URL}/filmes

Selecionar o primeiro filme em cartaz
    Click    css=.movie-card:first-child a.btn.btn-primary

Selecionar Sessão Do Filme
    Click    css=.sessao-item:first-child button.reservar

Confirmar Reserva
    Click    css=button.confirmar-reserva

Verificar Reserva Bem Sucedida
    Wait For Elements State    text=Reserva confirmada com sucesso!    visible    timeout=5s
