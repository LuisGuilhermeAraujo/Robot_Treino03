from LerDados import function_dados
import  pymssql


server = '192.168.252.10'
user = 'zuri.dev'
password = 'P04@sot28+'

df = function_dados()

conn = pymssql.connect(server, user, password, "sbkoficio")
cursor = conn.cursor()
# Insert Dataframe into SQL Server:
for index, row in df.iterrows():
    cursor.execute("INSERT INTO AUX_CAPTURAANTECIPADA (DENOMINACAO,MUNICIPIO,COD_CAUSA) values(%s,%s,%s)", (row.DENOMINAÇÃO,row.MUNICIPIO,row['Cód. Causa']))
    conn.commit()
cursor.close()