from os import getenv
import pymssql

server = getenv("192.168.252.10")
user = getenv("zuri.dev")
password = getenv("P04@sot28+")


conn = pymssql.conconnect(server, user, password, "sbkoficio")
cursor = conn.cursor()
# Insert Dataframe into SQL Server:
for index, row in df.iterrows():
    cursor.execute("INSERT INTO  (DepartmentID,Name,GroupName) values(?,?,?)", row.DepartmentID, row.Name, row.GroupName)
conn.commit()
cursor.close()