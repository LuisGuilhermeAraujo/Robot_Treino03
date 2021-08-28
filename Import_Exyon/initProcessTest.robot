*** Settings ***
Documentation        Desafio Rpa
Library        String
Library        SeleniumLibrary


*** Variables ***
${NAVEGADOR}               Chrome
${URL}                     https://std.gestorjuridico.com.br/Paginas/Principal/_FSet_Abertura.asp
${LOGIN}                   id=txtcd_Logon
${SENHA}                   id=txtcd_Pwd
${BTO_OK}                  id=btOK
${DELAY}                   class=last
${SELECT_UNIDADE}          xpath=//*[@id="cmbUnidade"]/option[3]
${ENTRA}                   id=btOk
${CLK_JURIDICO}            css:a[rel="PJ"]
${MENU_FRAME}              id:FraMenu
${SELECT_LIST}             xpath=//*[@id="cmbBusca"]/optgroup[2]/option[1]
${TEXTO}     =             OK
${PAGE_NEXT}               css:frame[src]
${PAGE_2}                  xpath://div[1]/a[@id="pagNext"][contains(text(), '2')][1]


*** Tasks ***
Desafio 3:
    [Documentation]    TEST
    SITE
    JURIDICO


*** Keywords ***
SITE
    [Documentation]     Iniciando Navegador
    Open Browser    ${URL}      ${NAVEGADOR}
    Maximize Browser Window
    Wait Until Element Is Visible    ${LOGIN}
    Input Text    ${LOGIN}    std.sbk
    Input Text    ${SENHA}    1234asdf
    Wait Until Element Is Visible    ${DELAY}    
    Click Button    ${BTO_OK}
    Wait Until Element Is Visible    ${ENTRA}
    Click Element    ${SELECT_UNIDADE}
    Click Button    ${ENTRA}

JURIDICO
    [Documentation]     Iniciando processo Juridico
    #Execute Javascript    MudaClasseMenu('Menu_3', '6');Carrega_Combo('PJ');
    Select Frame    ${MENU_FRAME}
    Click Element    ${CLK_JURIDICO}
    Execute Javascript    MudaClasseMenuLateral('PPC');Mnu_Click_Handler('PPC');parent.document.getElementById('__submenu').style.display='none';parent.document.getElementById('__submenu').innerHTML = '';document.getElementById('__setinha').src = 'imagens/icone-select.png';
    Go To    https://std.gestorjuridico.com.br/popup/pop.asp?url=documento_causa_list_pop.asp&amp;cd_Causa=CIV0000556
    ${str}    Run Keyword And Return Status    handle Alert    timeout=10s
    Log To Console    ${str}
    Select Frame    ${PAGE_NEXT}
    Click Element    ${PAGE_2}
    ${str}    Run Keyword And Return Status    handle Alert    timeout=10s
    Execute Javascript    Baixar('DOC','-5','xlsx')
    #Execute Javascript    changePage('2')
    #Select Frame    ${FRAME_PAGE}
    #Click Element    ${PAGE_NEXT}
    #Execute Javascript    Baixar('DOC','-5','xlsx')
    #Go To    https://std.gestorjuridico.com.br/Paginas/Principal/Associado/_FSet_Main.asp