*** Settings ***

Documentation       Aqui estará presente o terceiro exercício de teste Web estipulado pelo professor

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

#Caso de teste 03
Acessar a página home do site
    Go To                               ${URL}
    Title Should Be                     My Store
    Wait Until Element Is Visible       id=block_top_menu

Passar o mouse por cima da categoria "Women" no menu principal superior de categorias
    Mouse Over          xpath=//a[@title="Women"]

Clicar na sub categoria "Summer Dresses"
    Click Element        xpath=//a[@title="Summer Dresses"]

Conferir se os produtos da sub-categoria "Summer Dresses" foram mostrados na página
    Wait Until Element Is Visible       id=center_column
    Title Should Be                     Summer Dresses - My Store
    Page Should Contain Element         //*[@id='center_column']//*[@class="content_scene_cat_bg"]

*** Test Cases ***

Caso de Teste 03: Listar Produtos
    Acessar a página home do site
    Passar o mouse por cima da categoria "Women" no menu principal superior de categorias
    Clicar na sub categoria "Summer Dresses"
    Conferir se os produtos da sub-categoria "Summer Dresses" foram mostrados na página