*** Settings ***
Library    RequestsLibrary
Library    Collections
Library    String

*** Variables ***
${BASE_URL}    http://localhost:3000
${EMAIL}       usuario@teste.com
${PASSWORD}    123456

*** Keywords ***
Cadastrar Usuario Admin
    Create Session    serve    ${BASE_URL}
    ${body}=    Create Dictionary
    ...    nome=Admin Teste
    ...    email=${EMAIL}
    ...    password=${PASSWORD}
    ...    administrador=true
    ${response}=    POST On Session    serve    /usuarios    json=${body}    expected_status=ANY
    # Aceita tanto 201 (criado) quanto 400 (já existe)

Fazer Login E Salvar Token
    Cadastrar Usuario Admin
    Create Session    serve    ${BASE_URL}
    ${body}=    Create Dictionary    email=${EMAIL}    password=${PASSWORD}
    ${response}=    POST On Session    serve    /login    json=${body}
    Should Be Equal As Integers    ${response.status_code}    200
    ${token}=    Get From Dictionary    ${response.json()}    authorization
    Set Suite Variable    ${TOKEN}    ${token}

Criar Produto De Teste
    [Arguments]    ${nome}=Produto Teste    ${preco}=100    ${descricao}=Descricao Teste    ${quantidade}=1
    ${headers}=    Create Dictionary    Authorization=${TOKEN}
    ${body}=    Create Dictionary    nome=${nome}    preco=${preco}    descricao=${descricao}    quantidade=${quantidade}
    ${response}=    POST On Session    serve    /produtos    json=${body}    headers=${headers}
    Should Be Equal As Integers    ${response.status_code}    201
    ${id}=    Get From Dictionary    ${response.json()}    _id
    RETURN    ${id}

Criar Usuario Aleatorio
    ${random}=    Generate Random String    8    [LETTERS][NUMBERS]
    ${body}=    Create Dictionary
    ...    nome=Usuario ${random}
    ...    email=${random}@teste.com
    ...    password=senha123
    ...    administrador=false
    Create Session    serve    ${BASE_URL}
    ${response}=    POST On Session    serve    /usuarios    json=${body}
    Should Be Equal As Integers    ${response.status_code}    201
    ${id}=    Get From Dictionary    ${response.json()}    _id
    RETURN    ${id}
