import numpy as np
import pandas as pd
import math
import chardet
cod_to_cor = {}
filename = r'provasSemEliminados.csv'
progresso = 0
tabela = pd.read_csv(filename,encoding='ISO-8859-1',sep=';')
filename = r'2019/DICIONÁRIO/Dicionário_Microdados_Enem_2019.ods'
dic = pd.read_excel(filename)
print('Done!')
for i in range(112,154):
    if type(dic.iloc[i,0]) == str:
        prova = dic.iloc[i,0][8:]
    cod_to_cor[dic.iloc[i,2]]=dic.iloc[i,3]+prova
colunas = tabela.columns
porprova = pd.DataFrame(index=[0,1,2],columns=tabela.columns)
final = pd.DataFrame(columns=tabela.columns)
porprova.loc[0,:]=porprova.columns
for l,row in tabela.iterrows():
    porprova.loc[0, :] = porprova.columns
    porprova.loc[1] = row
    if 'CN' in cod_to_cor[porprova.iloc[1,0]]:
        soma = 90
    elif 'CH' in cod_to_cor[porprova.iloc[1,0]]:
        soma = 45
    elif 'MT' in cod_to_cor[porprova.iloc[1,0]]:
        soma = 135
    elif 'LC' in cod_to_cor[porprova.iloc[1,0]]:
        soma = 0
    porprova.iloc[0, 2:] = porprova.iloc[0, 2:].astype(int) +soma
    porprova.loc[1]=row
    porprova.iloc[1,0] = cod_to_cor[porprova.iloc[1,0]]
    porprova.iloc[:,2:] = porprova.iloc[:,2:].sort_values(by=[1],axis=1,ascending=True)
    porprova.iloc[2,2:] = porprova.iloc[1,2:]/porprova.iloc[1,1]
    porprova.iloc[2, 2:] = (porprova.iloc[2,2:]).apply('{:.2%}'.format)
    porprova.loc[3, :] = pd.Series(dtype='float64')
    porprova.iloc[0,:2] = np.nan
    final = pd.concat([final, porprova], axis=0)
final.to_excel("maisDificeis.xlsx")

