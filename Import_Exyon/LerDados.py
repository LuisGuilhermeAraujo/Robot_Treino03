import pandas as pd

df = pd.read_excel("C:\\Users\\luisg\Downloads\\5_CIVEL_EXTRACAO_DADOS_VF002_20210827.xlsx",
                   sheet_name = "Table",
                   skiprows = range(0, 10) # ignora as primeiras 10 linhas do excel
                   )