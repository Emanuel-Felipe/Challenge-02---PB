*** Settings ***
Resource    ../resources/resources.robot
Suite Setup    Fazer Login E Salvar Token

*** Test Cases ***
Criar Carrinho Valido
    ${id_produto}=    Criar Produto De Teste    Produto Carrinho    120    Produto para Carrinho    2
    ${headers}=    Create Dictionary    Authorization=${TOKEN}
    ${produto}=    Create Dictionary    idProduto=${id_produto}    quantidade=1
    ${produtos}=    Create List    ${produto}
    ${body}=    Create Dictionary    produtos=${produtos}
    ${response}=    POST On Session    serve    /carrinhos    json=${body}    headers=${headers}
    Should Be Equal As Integers    ${response.status_code}    201

Concluir Compra
    ${headers}=    Create Dictionary    Authorization=${TOKEN}
    ${response}=    DELETE On Session    serve    /carrinhos/concluir-compra    headers=${headers}
    Should Be Equal As Integers    ${response.status_code}    200
