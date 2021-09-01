import  re
from os import getenv
import  pymssql
import  pandas as pd
import  xlrd

def FunctionInsertDados(text):

    df = pd.read_excel("C:\\Users\\luisg\Downloads\\5_CIVEL_EXTRACAO_DADOS_VF002_20210827.xlsx",
                        sheet_name="Table",
                        sep = ';', 
                        encoding = 'utf-8', 
                        nrows = 10)
    return df


