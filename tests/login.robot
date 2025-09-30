*** Settings ***
Resource    ../resources/resources.robot

*** Test Cases ***
Login Valido
    Fazer Login E Salvar Token

Login Invalido
    Create Session    serve    ${BASE_URL}
    ${body}=    Create Dictionary    email=${EMAIL}    password=senhaErrada
    ${response}=    POST On Session    serve    /login    json=${body}    expected_status=ANY
    Should Be Equal As Integers    ${response.status_code}    401
