*** Settings ***
Documentation    Desafio Rpa
Library          SeleniumLibrary


*** Variables ***
${NAVEGADOR}                        Chrome
${LINK}                             https://std.gestorjuridico.com.br/Paginas/Principal/_FSet_Abertura.asp
${INPUT_NAME}                       id:txtcd_Logon
${INPUT_SENHA}                      id:txtcd_Pwd
${ELEMENT_KEYBOARD}                 id:keyboardInputMaster
${BUTTON_LOGIN}                     id:btOK
${BUTTON_SEL_UNIDADE}               id:btOk
${SELECIONAR_MODO}                  xpath://*[@id="cmbUnidade"]/option[3]
${SEL_JURIDICO}                     css:a[rel="PJ"]
${MENU_FRAME}                       id:FraMenu
${EXEC_JAVA}                        MudaClasseMenuLateral('PPC');Mnu_Click_Handler('PPC');
...                                 parent.document.getElementById('__submenu').style.display='none';
...                                 parent.document.getElementById('__submenu').innerHTML = '';
...                                 document.getElementById('__setinha').src = 'imagens/icone-select.png'
${SEL_COD_CAUSA}                    id:cmbBusca
${INPUT_COD_CAUSA}                  id:txtPesquisa
${BUTTON_SEL_PESQUISAR_CAUSA}       id:btnPesquisar


*** Tasks ***
Tarefa 1:
    [Documentation]        site
    ENTRAR NO SITE
    PROCESSAMENTO DO SISTEMA SELECIONAR UNIDIADE
    PROCESSAMENTO DO SISTEMA BUSCAR CASO PADRAO
    ACESSANDO CASO PADRAO
    #ACESSANDO PASTA CASO


*** Keywords ***
ENTRAR NO SITE
    [Documentation]    LOGANDO SITE
    Open Browser      ${LINK}    ${NAVEGADOR}
    Input Text        ${INPUT_NAME}     std
    Wait Until Element Is Enabled    ${INPUT_SENHA}
    Input Text        ${INPUT_SENHA}    @@1234asdf@@
    Wait Until Element Is Visible        ${ELEMENT_KEYBOARD}
    Click Button      ${BUTTON_LOGIN}

PROCESSAMENTO DO SISTEMA SELECIONAR UNIDIADE
    [Documentation]    PROCESSAMENTO DO SISTEMA
    Wait Until Element Is Visible    ${SELECIONAR_MODO}
    Click Element                    ${SELECIONAR_MODO}<
    Wait Until Element Is Enabled    ${BUTTON_SEL_UNIDADE}
    Click Button                     ${BUTTON_SEL_UNIDADE}
    Select Frame                     ${MENU_FRAME}
    Click Element                    ${SEL_JURIDICO}
    Execute Javascript               ${EXEC_JAVA}
    Unselect Frame

PROCESSAMENTO DO SISTEMA BUSCAR CASO PADRAO
    [Documentation]    PROCESSAMENTO DOS FRAME
    Select Frame   					 id:FraDetalhe
    Select Frame    			  	 name:fraConsulta
    Select Frame   			 		 name:fraPesquisa
    Select From List By Value        ${SEL_COD_CAUSA}      C
    Input Text                       ${INPUT_COD_CAUSA}    CIV0000556
    Wait Until Element Is Visible    ${BUTTON_SEL_PESQUISAR_CAUSA}
    Click Element                    ${BUTTON_SEL_PESQUISAR_CAUSA}
    Unselect Frame

ACESSANDO CASO PADRAO
    [Documentation]    ACESSANDO CASO PADRAO testes tests
    Select Frame   					 id:FraDetalhe
    Select Frame    			  	 name:fraConsulta
    Select Frame                     name:fraResultado
    Click Element                    id:linha_1
    Select Frame    			  	 name:Frame_Novo_Processo
    Click Element                    id:btnDocumento
    Unselect Frame
