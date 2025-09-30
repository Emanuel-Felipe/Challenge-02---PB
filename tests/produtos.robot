*** Settings ***
Resource    ../resources/resources.robot
Suite Setup    Fazer Login E Salvar Token

*** Test Cases ***
Cadastrar Produto Valido
    ${headers}=    Create Dictionary    Authorization=${TOKEN}
    ${body}=    Create Dictionary
    ...    nome=Produto Valido
    ...    preco=100
    ...    descricao=Produto Teste
    ...    quantidade=10
    ${response}=    POST On Session    serve    /produtos    json=${body}    headers=${headers}
    Should Be Equal As Integers    ${response.status_code}    201

Cadastrar Produto Sem Autenticacao
    Create Session    serve    ${BASE_URL}
    ${body}=    Create Dictionary
    ...    nome=Produto Sem Token
    ...    preco=50
    ...    descricao=Sem Token
    ...    quantidade=2
    ${response}=    POST On Session    serve    /produtos    json=${body}    expected_status=ANY
    Should Be Equal As Integers    ${response.status_code}    401

Excluir Produto Valido
    ${id}=    Criar Produto De Teste    Produto Excluir    99    Excluir Produto    1
    ${headers}=    Create Dictionary    Authorization=${TOKEN}
    ${response}=    DELETE On Session    serve    /produtos/${id}    headers=${headers}
    Should Be Equal As Integers    ${response.status_code}    200
