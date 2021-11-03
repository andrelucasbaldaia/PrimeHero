*** Settings ***
Documentation       Aqui estará presente o exercício de teste Web exemplificado pelo professor

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

#Caso de teste 01
Acessar a página home do site Automation Practice
    Go To                               ${URL}
    Title Should Be                     My Store
    Wait Until Element Is Visible       id=block_top_menu

Digitar o nome do produto "${PRODUTO}" no campo de pesquisa
    Input Text      id=search_query_top     ${PRODUTO}

Clicar no botão pesquisar
    Click Element       xpath=//*[@name='submit_search' and @type='submit']

Conferir se o produto "${PRODUTO}" foi listado no site
    Wait Until Element Is Visible       id=center_column
    Title Should Be                     Search - My Store
    Page Should Contain Image           xpath=//*[@id='center_column']//*[@src='http://automationpractice.com/img/p/7/7-home_default.jpg']


*** Test Cases ***

Caso de Teste 01: Pesquisar produto existente
    Acessar a página home do site Automation Practice
    Digitar o nome do produto "Blouse" no campo de pesquisa
    Clicar no botão pesquisar
    Conferir se o produto "Blouse" foi listado no site

