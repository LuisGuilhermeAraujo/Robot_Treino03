import  pandas as pd
import  xlrd

df = pd.read_excel("C:\\Users\\luisg\Downloads\\5_CIVEL_EXTRACAO_DADOS_VF002_20210827.xlsx",sheet_name="Table",)
print(df)