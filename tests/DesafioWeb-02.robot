*** Settings ***

Documentation       Aqui estará presente o segundo exercício de teste Web estipulado pelo professor

Library             SeleniumLibrary

Test Setup          Abrir Navegador
Test Teardown       Fechar Navegador

*** Variables ***
${URL}          http://automationpractice.com/index.php
${BROWSER}      chrome

*** Keywords ***

Abrir Navegador
    Open Browser                    browser=${BROWSER}
    Maximize Browser Window     

Fechar Navegador
    Capture Page Screenshot
    Close Browser

#Caso de teste 02
Acessar a página home do site Automation Practice
    Go To                               ${URL}
    Title Should Be                     My Store
    Wait Until Element Is Visible       id=block_top_menu

Digitar o nome do produto "${PRODUTO}" no campo de pesquisa
    Input Text      id=search_query_top     ${PRODUTO}

Clicar no botão pesquisar
    Click Element       xpath=//*[@name='submit_search' and @type='submit']

Conferir mensagem "No results were found for your search "itemNãoExistente""
    Wait Until Element Is Visible       id=center_column
    Title Should Be                     Search - My Store
    Page Should Contain Element         xpath=//*[@id='center_column']//p[contains(@class,"alert alert-warning")]

*** Test Cases ***

Caso de Teste 02: Pesquisar produto não existente
    Acessar a página home do site Automation Practice
    Digitar o nome do produto "itemNãoExistente" no campo de pesquisa
    Clicar no botão pesquisar
    Conferir mensagem "No results were found for your search "itemNãoExistente""

