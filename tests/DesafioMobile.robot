*** Settings ***
Documentation       Aqui neste arquivo estarão presentes os cenários e keywords que dizem respeito ao desafio estipulado pelo professor

Library             AppiumLibrary

Test Setup          Abrir aplicativo

Test Teardown       Fechar aplicativo

*** Keywords ***
Abrir aplicativo
    Set Appium Timeout          60
    Open Application            http://localhost:4723/wd/hub
    ...                         automationName=uiautomator2
    ...                         deviceName=emulator-5554
    ...                         platformName=Android
    ...                         autoGrantPermissions=true
    ...                         appPackage=com.google.android.youtube
    ...                         appActivity=com.google.android.youtube.HomeActivity


Fechar aplicativo
    Close Application 

Logar no aplicativo com a conta x
    Click Button            xpath=//android.widget.ImageView[@content-desc="Conta"]
    Click Button            xpath=/hierarchy/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.support.v7.widget.RecyclerView/android.widget.FrameLayout[1]/android.widget.LinearLayout/android.widget.TextView[3]
    Click Element           xpath=//android.widget.LinearLayout[@content-desc="André Lucas Soares Baldaia"]

Entrar no menu “Explorar”
    Click Button           xpath=//android.widget.Button[@content-desc="Explorar"]    


Usar swipe de tela até o 10 item da tela
    Swipe           10


Clicar no vídeo 
    Click Element           xpath=//android.view.ViewGroup[@content-desc="69 Days - [Hardcore Minecraft] - 30 minutos - Ir ao canal - Luke TheNotable - 1,2 mi de visualizações - há 1 dia - assistir o vídeo"]/android.view.ViewGroup/android.view.ViewGroup/android.widget.ImageView[2]

*** Test Cases ***

Caso de Teste 02: Logar no YouTube
    Abrir aplicativo
    Logar no aplicativo com a conta x
    Entrar no menu “Explorar”
    Usar swipe de tela até o 10 item da tela
    Clicar no vídeo 