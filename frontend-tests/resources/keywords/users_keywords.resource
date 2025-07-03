*** Keywords ***

Ir Para Página De Cadastro
    Go To    ${BASE_URL}/register

Preencher Formulário De Cadastro
    Fill Text    input#name            Usuário Teste
    Fill Text    input#email           teste_qa@email.com
    Fill Text    input#password        123456
    Fill Text    input#confirmPassword    123456

Enviar Cadastro
    Click    button[type="submit"]

Verificar Mensagem De Sucesso
    Wait For Elements State    text=Conta criada com sucesso!    visible    timeout=5s

Ir Para Página De Login
    Go To    ${BASE_URL}/login

Preencher Formulário De Login
    Fill Text    input#email       teste_qa@email.com
    Fill Text    input#password    123456

Enviar Login
    Click    button[type="submit"]

Verificar Login Bem-Sucedido
    Wait For Elements State    text=Login realizado com sucesso!    visible    timeout=15s