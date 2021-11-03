*** Settings ***

Documentation       Aqui estarão presentes as resoluções de todos os exercícios
...                 É muito importante informarmos o propósito deste documento.

*** Variables ***
#variável do tipo simples
${NOME}     André Lucas Baldaia

#variável do tipo dicionário
&{PESSOA} 
...         nome=André
...         sobrenome=Baldaia
...         idade=17
...         email=andrelucasbaldaia@gmail.com
...         cpf=126.617.579-29
...         genero=Masculino

#Variável do tipo lista
@{FRUTAS} 
...         kiwi        #0
...         pêssego     #1
...         abacaxi     #2
...         melão       #3
...         maçã        #4

***Test Cases ***

Cenario: Imprimindo informações da pessoa 
    Log To Console      \n${PESSOA.nome}
    Log To Console      ${PESSOA.sobrenome}
    Log To Console      ${PESSOA.idade}
    Log To Console      ${PESSOA.email}
    Log To Console      ${PESSOA.cpf}
    Log To Console      ${PESSOA.genero}

#rodar comando no console:  python -m robot tests/exercicios.robot

Cenario: Imprimindo lista de frutaas
    [Tags]              LISTA
    Log To Console     \n${FRUTAS[0]}
    Log To Console      ${FRUTAS[1]}
    Log To Console      ${FRUTAS[2]}
    Log To Console      ${FRUTAS[3]}
    Log To Console      ${FRUTAS[4]}

#rodar comando no console: python -m robot -i LISTA tests/exercicios.robot

Cenario: Somando dois valores
    [Tags]          SOMA
    Somar os numeros "50" e "60"

Cenario: Criando email
    [Tags]      EMAIL
    Criar email  andre  baldaia  17

Cenario: Somar de 0 a 9 
    [Tags]      COUNT
    Contar de 0 a 9 

Cenario: Percorrer lista de frutas
    [Tags]      FRUTA
    Percorrer lista de frutas 

Cenario: Estou no número...
    [Tags]      NUMEROS
    Estou no número...
    
Cenario: Países da America Latina
    [Tags]      PAIS
    Países da América Latina

Cenario: Estou no número
    [Tags]      NUMERO
    Estou no número 

*** Keywords ***

Somar dois numeros
    [Arguments]     ${NUM_A}    ${NUM_B}
    ${SOMA}         Evaluate    ${NUM_A}+${NUM_B}
    [Return]        ${SOMA}
    Log To Console  ${SOMA}

Somar os numeros "${NUM_A}" e "${NUM_B}"
    ${SOMA}     Evaluate    ${NUM_a}+${NUM_B}
    Log To Console  ${SOMA}

Criar email
    [Arguments]     ${NOME}     ${SOBRENOME}    ${IDADE}
    ${EMAIL}    Catenate    ${NOME}_${SOBRENOME}_${IDADE}@robot.com
    [Return]        ${EMAIL}
    Log To Console  ${EMAIL}

#outra forma usando o SEPARATOR
#Criar email
#    [Arguments]     ${NOME}     ${SOBRENOME}    ${IDADE}
#    ${EMAIL}    Catenate    SEPARATOR=_    ${NOME}     ${SOBRENOME}    ${IDADE}@robot.com
#    [Return]        ${EMAIL}
#    Log To Console  ${EMAIL}

Contar de 0 a 9 
    FOR     ${COUNT}    IN RANGE     0   9
        Log To Console      ${COUNT}
    END

Percorrer lista de frutas 
    @{FRUTAS}   Create List     Banana      Maçã        abacaxi     Morango
    FOR     ${FRUTA}        IN      @{FRUTAS}
        Log To Console      ${FRUTA}
    END

Estou no número...
    FOR     ${NUMEROS}    IN RANGE     0   11
        Log To Console      estou no número:${NUMEROS}
    END

Países da América Latina
    @{PAISES}       Create List     \nBrasil      Equador     Bolívia     Argentina       Paraguai
    FOR     ${PAIS}     IN      @{PAISES}
        Log To Console      ${PAIS} 
    END

Estou no número
    FOR     ${NUMEROS}    IN RANGE     0   11
        IF      '${NUMEROS}'=='5' 
            Log To Console      estou no número:${NUMEROS}
        ELSE IF     '${NUMEROS}'=='8'
            Log To Console      estou no número:${NUMEROS}
        ELSE 
            Log To Console      não estou em nenhum número 
        END
    END

    
  
