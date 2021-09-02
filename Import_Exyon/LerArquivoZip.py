import zipfile
from datetime import date
  
  
# Returns the current local date
ResultDt = date.today().strftime('%Y%m%d')
print(ResultDt)     

CaminhoFile = 'C:\\Users\\luisg\\Downloads\\STD_Diaria_'+str(ResultDt)+'.zip'
CaminhoDest = 'C:\\Users\\luisg\OneDrive\\Documentos\\Python\\Robot_Treino03\\'

print(CaminhoFile)
print(CaminhoDest)

fantasy_zip = zipfile.ZipFile(CaminhoFile)
fantasy_zip.extractall(CaminhoDest)
 
fantasy_zip.close()
