*** Settings ***
Documentation     Conexão banco
Library        String
Library        DateTime
Library        OperatingSystem
Library        SeleniumLibrary
Library        LerDados.py


*** Variables ***
&{DB_CONNECT}    server='192.168'
...              database=''
...              username='dev'
...              password= ''


*** Tasks ***
Conexão com Banco de dados:
    [Documentation]        logando no banco de dados
    LOGANDO NO BANCO DE DADOS


*** Keywords ***
LOGANDO NO BANCO DE DADOS
    [Documentation]        DADOS CONEXÃO
    Return From Keyword
