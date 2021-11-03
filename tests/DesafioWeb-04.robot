*** Settings ***

Documentation       Aqui estará presente o quarto exercício de teste Web estipulado pelo professor

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

#Caso de teste 04
Acessar a página home do site
    Go To                               ${URL}
    Title Should Be                     My Store
    Wait Until Element Is Visible       id=block_top_menu

Clicar em "Sign in"
    Click Element       //*[@class="login"]

Informar um e-mail válido             
    Title Should Be         Login - My Store 

    Input Text              id=email_create         andrelucasbaldaia@gmail.com       

Clicar em "Create an account"
    Click Button            //*[@id="SubmitCreate"]       

Preencher os dados obrigatórios
    Select Radio Button     //*[@id="id_gender1"]           
    Input Text              id=customer_firstname               André Lucas 
    Input Text              id=customer_lastname                Baldaia
    Input Text              id=passwd                           senha
    Input Text              id=days                             16
    Input Text              id=months                           February
    Input Text              id=years                            2004
    Input Text              id=address1                         Eva Pereira Correia
    Input Text              id=city                             Curitiba
    Input Text              id=id_state                         Florida
    Input Text              id=postcode                         33034
    Input Text              id=id_country                       United States
    Input Text              id=phone                            32989812
    Input Text              id=phone_mobile                     991279729

Submeter cadastro
    Click Button        //*[@id="submitAccount"]

Conferir se o cadastro foi efetuado com sucesso
    Title Should Be     My account - My Store

*** Test Cases ***

Caso de Teste 04: Adicionar Cliente
    Acessar a página home do site
    Clicar em "Sign in"
    Informar um e-mail válido
    Clicar em "Create an account"
    Preencher os dados obrigatórios
    Submeter cadastro
    Conferir se o cadastro foi efetuado com sucesso