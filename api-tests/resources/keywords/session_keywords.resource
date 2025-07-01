*** Settings ***
Library    RequestsLibrary

*** Keywords ***
Criar Filme Para Sessao
    [Documentation]    Cria um novo filme e armazena o ID para uso em sessões.

    ${headers}=    Create Dictionary    Authorization=${ADMIN_TOKEN}    Content-Type=application/json
    ${dados_filme}=    Create Dictionary
    ...    title=Filme Sessão
    ...    synopsis=Filme para criação de sessão
    ...    director=Diretor Sessão
    ...    genres=["Drama"]
    ...    duration=120
    ...    classification=14
    ...    poster=filme_sessao.jpg
    ...    releaseDate=2025-07-01

    Create Session    filme_sessao    ${BASE_URL}
    ${res}=    POST On Session    filme_sessao    /movies    headers=${headers}    json=${dados_filme}
    Status Should Be    201    ${res}
    Set Suite Variable    ${ID_FILME_SESSAO}    ${res.json()['data']['_id']}

Criar Teatro Para Sessao
    [Documentation]    Cria um novo teatro e armazena o ID para uso em sessões.

    ${headers}=    Create Dictionary
    ...    Authorization=${ADMIN_TOKEN}
    ...    Content-Type=application/json

    ${dados_teatro}=    Create Dictionary
    ...    name=Teatro Sessão
    ...    capacity=120
    ...    type=standard

    Create Session    teatro_sessao    ${BASE_URL}
    ${res}=    POST On Session    teatro_sessao    /theaters    headers=${headers}    json=${dados_teatro}
    Status Should Be    201    ${res}
    Set Suite Variable    ${ID_TEATRO_SESSAO}    ${res.json()['data']['_id']}

Criar sessao com sucesso
    [Documentation]    Cria uma sessão com os IDs válidos de filme e teatro.

    ${headers}=    Create Dictionary    Authorization=${ADMIN_TOKEN}    Content-Type=application/json

    ${agora}=    Get Time    result_format=%Y-%m-%dT%H:%M:%S.000Z
    ${dados_sessao}=    Create Dictionary
    ...    movie=${ID_FILME_SESSAO}
    ...    theater=${ID_TEATRO_SESSAO}
    ...    datetime=${agora}
    ...    fullPrice=30
    ...    halfPrice=15

    Create Session    sessao    ${BASE_URL}
    ${res}=    POST On Session    sessao    /sessions    headers=${headers}    json=${dados_sessao}
    Status Should Be    201    ${res}
    Set Suite Variable    ${ID_SESSAO_CRIADA}    ${res.json()['data']['_id']}
    Log    Sessão criada com sucesso para o filme e teatro informados

Criar sessão com ID Invalido
    [Documentation]    Envia IDs inválidos para criar uma sessão e valida que a API responde com 404.

    ${headers}=    Create Dictionary
    ...    Authorization=${ADMIN_TOKEN}
    ...    Content-Type=application/json

    ${id_invalido_filme}=    Set Variable    000000000000000000000001
    ${id_invalido_teatro}=   Set Variable    000000000000000000000002

    ${agora}=    Get Time    result_format=%Y-%m-%dT%H:%M:%S.000Z

    ${dados_sessao}=    Create Dictionary
    ...    movie=${id_invalido_filme}
    ...    theater=${id_invalido_teatro}
    ...    datetime=${agora}
    ...    fullPrice=20
    ...    halfPrice=10

    Create Session    sessao_invalida    ${BASE_URL}
    ${res}=    POST On Session    sessao_invalida    /sessions    headers=${headers}    json=${dados_sessao}    expected_status=ANY

    Should Be Equal As Integers    ${res.status_code}    404
    Log    API retornou corretamente erro 404 para sessão com IDs inválidos






       

