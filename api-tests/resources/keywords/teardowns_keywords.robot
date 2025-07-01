*** Keywords ***
Deletar Usuario Criado
    [Documentation]    Deleta o usuário criado durante o teste, usando token de admin.

    ${headers}=    Create Dictionary    Authorization=${ADMIN_TOKEN}
    Create Session    deletar_user    ${BASE_URL}
    ${res}=    DELETE On Session    deletar_user    /users/${ID_USUARIO_TESTE}    headers=${headers}
    Status Should Be    200    ${res}
    Log    Usuário deletado com sucesso

Deletar sessão, filme e teatro criados
    [Documentation]    Remove a sessão, o filme e o teatro criados durante o teste.

    ${headers}=    Create Dictionary    Authorization=${ADMIN_TOKEN}

    # Deletar sessão
    Create Session    deletar_sessao    ${BASE_URL}
    ${res_sessao}=    DELETE On Session    deletar_sessao    /sessions/${ID_SESSAO_CRIADA}    headers=${headers}
    Status Should Be    200    ${res_sessao}
    Log    Sessão deletada com sucesso

    # Deletar filme
    Create Session    deletar_filme    ${BASE_URL}
    ${res_filme}=    DELETE On Session    deletar_filme    /movies/${ID_FILME_SESSAO}    headers=${headers}
    Status Should Be    200    ${res_filme}
    Log    Filme deletado com sucesso

    # Deletar teatro
    Create Session    deletar_teatro    ${BASE_URL}
    ${res_teatro}=    DELETE On Session    deletar_teatro    /theaters/${ID_TEATRO_SESSAO}    headers=${headers}
    Status Should Be    200    ${res_teatro}
    Log    Teatro deletado com sucesso

Deletar Reserva Criada
    [Documentation]    Remove a reserva criada durante o teste.
    ${headers}=    Create Dictionary    Authorization=${TOKEN_USUARIO}
    Create Session    deletar_reserva    ${BASE_URL}
    ${res}=    DELETE On Session    deletar_reserva    /reservations/${ID_RESERVA_CRIADA}    headers=${headers}
    Status Should Be    200    ${res}
    Log    Reserva deletada com sucesso - ID: ${ID_RESERVA_CRIADA}

Executar Teardowns da Reserva
    Deletar Reserva Criada
    Deletar sessão, filme e teatro criados
    Deletar Usuario Criado