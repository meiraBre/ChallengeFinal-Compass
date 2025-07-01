*** Settings ***
Library    RequestsLibrary

*** Keywords ***

Criar um novo filme como admin
    [Documentation]    Envia uma requisição POST /movies com dados válidos de um novo filme usando token de admin.

    ${headers}=    Create Dictionary    Authorization=${ADMIN_TOKEN}    Content-Type=application/json
    ${dados_filme}=    Create Dictionary
    ...    title=Revolutions
    ...    synopsis=Uma revolução de máquinas.
    ...    director=Lana Mendes
    ...    genres=["Ação", "Ficção Científica"]
    ...    duration=129
    ...    classification=16
    ...    poster=revolução3.jpg
    ...    releaseDate=2025-07-01
    Create Session    filmes    ${BASE_URL}
    ${response}=    POST On Session    filmes    /movies    headers=${headers}    json=${dados_filme}    expected_status=ANY

    Status Should Be    201    ${response}
    Dictionary Should Contain Key    ${response.json()}    data
    Should Be Equal As Strings    ${response.json()['data']['title']}    Revolutions

    Log    Filme criado com sucesso: ${response.json()['data']['title']}
    Set Test Variable    ${ID_FILME_CRIADO}    ${response.json()['data']['_id']}

Listar todos os filmes
    [Documentation]    Envia requisição GET /movies sem autenticação e valida se a lista de filmes é retornada com sucesso.

    Create Session    filmes    ${BASE_URL}
    ${response}=    GET On Session    filmes    /movies    expected_status=ANY

    Status Should Be    200    ${response}
    Dictionary Should Contain Key    ${response.json()}    data
    Should Be True    ${response.json()['count']} >= 0

    Log    🎥 Total de filmes retornados: ${response.json()['count']}

Criar um novo filme como usuário comum
    [Documentation]    Tenta criar um filme com um usuário comum e valida se a resposta é 403 Forbidden.

    # Criar e autenticar usuário comum
    ${timestamp}=    Get Time    epoch
    ${email}=    Set Variable    user${timestamp}@teste.com
    ${senha}=    Set Variable    123456

    Create Session    user    ${BASE_URL}
    ${body}=    Create Dictionary
    ...    name=Usuário Comum
    ...    email=${email}
    ...    password=${senha}
    ${cadastro}=    POST On Session    user    /auth/register    json=${body}
    Should Be Equal As Integers    ${cadastro.status_code}    201

    ${login_data}=    Create Dictionary    email=${email}    password=${senha}
    ${login}=    POST On Session    user    /auth/login    json=${login_data}
    Should Be Equal As Integers    ${login.status_code}    200
    ${user_token}=    Set Variable    Bearer ${login.json()['data']['token']}
    ${user_id}=    Set Variable    ${login.json()['data']['_id']}

    # Tentar criar filme com token do usuário comum
    ${headers}=    Create Dictionary    Authorization=${user_token}    Content-Type=application/json
    ${dados_filme}=    Create Dictionary
    ...    title=Filme Inválido
    ...    synopsis=Tentativa de criação por usuário comum.
    ...    director=Sem Autorização
    ...    genres=["Drama"]
    ...    duration=100
    ...    classification=12
    ...    poster=sem_autorizacao.jpg
    ...    releaseDate=2025-07-01

    ${response}=    POST On Session    user    /movies    headers=${headers}    json=${dados_filme}    expected_status=ANY
    Status Should Be    403    ${response}
    Log    Usuário comum não tem permissão para criar filmes (403 esperado)

    # Excluir usuário usando token de admin
    ${admin_headers}=    Create Dictionary    Authorization=${ADMIN_TOKEN}
    Create Session    admin_delete    ${BASE_URL}
    ${delete_response}=    DELETE On Session    admin_delete    /users/${user_id}    headers=${admin_headers}
    Status Should Be    200    ${delete_response}
    Log    Usuário comum deletado com sucesso após o teste
