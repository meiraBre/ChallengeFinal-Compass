*** Settings ***
Documentation     Suite de testes da API Cinema Challenge
Resource           ./resources/variables/env_variables.robot
Resource           ./resources/keywords/common_keywords.robot
Resource           ./resources/keywords/auth_keywords.resource
Resource           ./resources/keywords/movie_keywords.resource
Resource           ./resources/keywords/reservation_keywords.resource
Resource           ./resources/keywords/session_keywords.resource
Resource           ./resources/keywords/teardowns_keywords.robot
Resource           ./resources/keywords/theater_keywords.resource
Resource           ./resources/keywords/users_admin_keywords.resource
Library           RequestsLibrary

Suite Setup       Setup - Criar Usuário Admin
Suite Teardown    Teardown - Deletar Usuário Admin

*** Test Cases ***
Cenário 01: Cadastro de usuário válido
    [Teardown]    Deletar Usuario Criado
    Cadastrar Usuário Com Dados Válidos
    Verifica Status De Resposta    201

Cenário 02: Buscar perfil do usuário autenticado
    [Teardown]    Deletar Usuario Criado
    Criar E Autenticar Usuario Comum
    Buscar Perfil Do Usuário Autenticado
    Status Should Be    200    ${PROFILE_RESPONSE}

Cenário 03: Acessar /auth/me sem token
    [Tags]    security    smoke
    Acessar Perfil Sem Token

Cenário 04: Token expirado ou inválido
    [Tags]    security    smoke
    Acessar Perfil Com Token Invalido

Cenário 05: Listar todos os usuários
    [Tags]    admin    smoke
    Listar Usuarios Como Admin

Cenário 06: Criar novo filme - admin
    [Documentation]    Testa se um admin consegue criar um novo filme com sucesso.
    [Tags]    admin    filmes    post    integracao
    Criar um novo filme como admin

Cenário 07: Listar todos os filmes
    [Documentation]    Testa se a API retorna com sucesso a lista de filmes, sem necessidade de autenticação.
    [Tags]    filmes    get    smoke    publico
    Listar todos os filmes

Cenário 08: Usuário comum tenta criar filme
    [Documentation]    Testa se um usuário comum consegue criar um novo filme com sucesso.
    [Tags]    filmes    post    integracao
    Criar um novo filme como usuário comum

Cenário 09: Criar nova sessão - admin
    [Documentation]    Testa se um admin consegue criar uma nova sessão com sucesso, usando IDs válidos de filme e teatro.
    [Tags]    admin    sessão    post    integracao

    [Teardown]    Deletar sessão, filme e teatro criados

    Criar Filme Para Sessao
    Criar Teatro Para Sessao
    Criar sessao com sucesso

Cenário 10: Criar sessão com IDs inválidos
    [Documentation]    Testa se a API retorna erro ao tentar criar uma sessão com movie e theater inexistentes.
    [Tags]    admin    sessão    post    ids_invalidos    integracao

    Criar sessão com ID Invalido

Cenário 11: Listar todos os teatros
    [Documentation]    Testa se a API retorna a lista de todos os teatros com sucesso.
    [Tags]    teatros    get    integracao

    Listar todos os teatros

Cenário 12: Usuário comum tenta atualizar teatro
    [Documentation]    Testa se um usuário comum é impedido de atualizar um teatro (esperado: 403 Forbidden).
    [Tags]    teatros    put    forbidden    usuario_comum
    
    [Teardown]    Deletar Usuario Criado
    Criar E Autenticar Usuario Comum
    Tentar Atualizar Teatro Como Usuario Comum

Cenário 13: Buscar reservas do próprio usuário
    [Tags]    reserva    get    sucesso
    [Teardown]    Deletar Usuario Criado

    Criar E Autenticar Usuario Comum
    Enviar Requisicao De Busca De Reservas
    Validar Resposta 200 Com Lista De Reservas

Cenário 14: Usuário comum tenta deletar reserva
    [Tags]    reserva    seguranca    forbidden
    [Teardown]    Deletar Usuario Criado
    
    Criar E Autenticar Usuario Comum
    Tentar Deletar Reserva Comum Com ID Fixo
    Validar Falha Deletar Reserva Sem Permissão

Cenário 15: Criar reserva sem assentos
    [Tags]    reserva    validacao    negativo
    [Teardown]    Deletar Usuario Criado
    
    Criar E Autenticar Usuario Comum
    Tentar Criar Reserva Sem Assentos
    Validar Erro Campo Obrigatório Assentos


