import zipfile
import requests_file
from os import name
from typing import List
from os import walk
from datetime import date

  
# Returns the current local date
ResultDt = date.today().strftime('%Y%m%d')
print(ResultDt)     

CaminhoFile = 'C:\\Users\\luisg\\Downloads\\STD_Diaria_'+str(ResultDt)+'.zip'
CaminhoDest = 'C:\\Users\\luisg\OneDrive\\Documentos\\Python\\Robot_Treino03\\STD\\Transfer'

print(CaminhoFile)
print(CaminhoDest)

#fantasy_zip = zipfile.ZipFile(CaminhoFile)
#fantasy_zip.extractall(CaminhoDest)
# 
#fantasy_zip.close()

files = []
path = CaminhoDest
for (dirpath, dirnames, filenames) in walk(path):
  files.extend(filenames)
  break
#print(files)

for lista in files:
    if files[lista] == 'TRA0364280':
        print('encontrado')