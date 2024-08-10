import numpy as np
import pandas as pd
import math
import chardet
prova = {}
cod = ["CN","CH","LC","MT"]
filename = r'2019/DADOS/MICRODADOS_ENEM_2019.csv'
progresso = 0
tabela = pd.read_csv(filename,encoding='ISO-8859-1',sep=';')
print('Done!')
numrows = len(tabela.index)
porcentagemanterior = 0
notaMinima = {'LC':0,'CH':0,'CN':0,'MT':0}
for i,row in tabela.iterrows():
    progresso +=1
    porcentagem = progresso/numrows
    if(porcentagem >porcentagemanterior+0.01):
        print(f'Progresso:{porcentagem}')
        porcentagemanterior = porcentagem
    for j in cod:
        if j ==  'LC':
            #pula caso seja espanhol
            if row['TP_LINGUA'] == 1:
                continue
            #pula caso seja espanhol
        if row[f'TP_PRESENCA_{j}'] !=1:
            continue
        if math.isnan(row[f"CO_PROVA_{j}"]):
            continue
        if row[f'NU_NOTA_{j}']<notaMinima[j]:
            continue
        if row[f"CO_PROVA_{j}"] not in prova:
            prova[row[f"CO_PROVA_{j}"]] = [0]*46 #0 é o numero de aplicantes, 1 a 45 é acertos em cada questao
        prova[row[f"CO_PROVA_{j}"]][0]+=1
        if j ==  'LC':
            #Transforma ingles e espanhol em uma só/start
            help = 0
            for k in range(len(row[f"TX_RESPOSTAS_{j}"])):
                k-=help
                if row[f"TX_RESPOSTAS_{j}"][k] == '9':
                    row[f"TX_RESPOSTAS_{j}"] = row[f"TX_RESPOSTAS_{j}"][:k]+row[f"TX_RESPOSTAS_{j}"][k+1:]
                    row[f"TX_GABARITO_{j}"] = row[f"TX_GABARITO_{j}"][:k] + row[f"TX_GABARITO_{j}"][k + 1:]
                    help+=1
            #Transforma ingles e espanhol em uma só/end
        for k in range(len(row[f"TX_RESPOSTAS_{j}"])):
            if row[f"TX_RESPOSTAS_{j}"][k] == row[f"TX_GABARITO_{j}"][k]:
                if k>45:
                    pass
                prova[row[f"CO_PROVA_{j}"]][k+1]+=1
provaframe = pd.DataFrame.from_dict(prova)
provaframe=provaframe.T
provaframe.to_csv('provasSemEliminados.csv',sep=';',decimal='.',float_format='%.5f')
i=1