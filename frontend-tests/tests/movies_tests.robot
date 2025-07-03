*** Settings ***
Library           Browser
Library           Collections
Resource          ../resources/variables/env_variables.robot
Resource          ../resources/keywords/base.robot
Resource          ../resources/keywords/users_keywords.resource
Resource          ../resources/keywords/movies_keywords.resource
Suite Setup       Abrir Navegador
Suite Teardown    Fechar Navegador

*** Test Case ***
Cenário 03: Fazer uma reserva em uma sessão de um filme como usuário comum
    Ir para a página de filmes em cartaz
    Selecionar o primeiro filme em cartaz
    Selecionar Sessão Do Filme
    Selecionar assento
    Confirmar Pagamento
    Finalizar Compra
    Verificar Reserva Bem Sucedida

Cenário 04: Ver os filmes de cartaz
    Ir Para Página Inicial
    Verificar Lista De Filmes Em Cartaz Está Visível