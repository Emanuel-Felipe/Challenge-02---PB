*** Settings ***
Resource    ../resources/resources.robot

*** Test Cases ***
Cadastrar Usuario Valido
    ${id}=    Criar Usuario Aleatorio
    Should Not Be Empty    ${id}

Cadastrar Usuario Duplicado
    ${random}=    Generate Random String    6
    ${body}=    Create Dictionary
    ...    nome=Usuario ${random}
    ...    email=${random}@teste.com
    ...    password=12345
    ...    administrador=true
    Create Session    serve    ${BASE_URL}
    POST On Session    serve    /usuarios    json=${body}
    ${response}=    POST On Session    serve    /usuarios    json=${body}    expected_status=ANY
    Should Be Equal As Integers    ${response.status_code}    400
