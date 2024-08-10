import numpy as np
import pandas as pd
import math
import chardet
cod_to_cor = {}
prova = {}
cod = ["CN","CH","LC","MT"]
filenamedic = r'2019/DICIONÁRIO/Dicionário_Microdados_Enem_2019.ods'
dic = pd.read_excel(filenamedic)
for i in range(112,154):
    if type(dic.iloc[i,0]) == str:
        prova = dic.iloc[i,0][8:]
    cod_to_cor[dic.iloc[i,2]]=dic.iloc[i,3]+prova
progresso = 0
filename = r'2019/DADOS/MICRODADOS_ENEM_2019.csv'
tabela = pd.read_csv(filename,encoding='ISO-8859-1',sep=';')
print('Done!')
numrows = len(tabela.index)
porcentagemanterior = 0
debug = 0
prova = {}
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
        row[f"CO_PROVA_{j}"] = cod_to_cor[row[f"CO_PROVA_{j}"]]
        if row[f"CO_PROVA_{j}"] not in prova:
            prova[row[f"CO_PROVA_{j}"]] = {} #Dicionario por numero de acertos
        if 'CN' in j:
            soma = 90
        elif 'CH' in j:
            soma = 45
        elif 'MT' in j:
            soma = 135
        elif 'LC' in j:
            soma = 0
        if j ==  'LC':
            help = 0
            for k in range(len(row[f"TX_RESPOSTAS_{j}"])):
                k-=help
                if row[f"TX_RESPOSTAS_{j}"][k] == '9':
                    row[f"TX_RESPOSTAS_{j}"] = row[f"TX_RESPOSTAS_{j}"][:k]+row[f"TX_RESPOSTAS_{j}"][k+1:]
                    row[f"TX_GABARITO_{j}"] = row[f"TX_GABARITO_{j}"][:k] + row[f"TX_GABARITO_{j}"][k + 1:]
                    help+=1
        acertos = 0
        listaAcertadas = []
        for k in range(len(row[f"TX_RESPOSTAS_{j}"])):
            if row[f"TX_RESPOSTAS_{j}"][k] == row[f"TX_GABARITO_{j}"][k]:
                if k>45:
                    pass
                acertos +=1
                listaAcertadas.append(k+soma+1)
        listaAcertadas = ",".join(map(str, listaAcertadas))
        if acertos not in prova[row[f"CO_PROVA_{j}"]]:
            prova[row[f"CO_PROVA_{j}"]][acertos] = [[None,None],[None,None]] #[[MenorNota,Questoes acertadas],[MaiorNota,Questoes acertadas]]
        if prova[row[f"CO_PROVA_{j}"]][acertos][0][0] is None:
            prova[row[f"CO_PROVA_{j}"]][acertos][0][0] = row[f"NU_NOTA_{j}"]
        if prova[row[f"CO_PROVA_{j}"]][acertos][1][0] is None:
            prova[row[f"CO_PROVA_{j}"]][acertos][1][0] = row[f"NU_NOTA_{j}"]

        if prova[row[f"CO_PROVA_{j}"]][acertos][0][0] >= row[f"NU_NOTA_{j}"]:
            prova[row[f"CO_PROVA_{j}"]][acertos][0][0] = row[f"NU_NOTA_{j}"]
            prova[row[f"CO_PROVA_{j}"]][acertos][0][1] = listaAcertadas
        if prova[row[f"CO_PROVA_{j}"]][acertos][1][0] <= row[f"NU_NOTA_{j}"]:
            prova[row[f"CO_PROVA_{j}"]][acertos][1][0] = row[f"NU_NOTA_{j}"]
            prova[row[f"CO_PROVA_{j}"]][acertos][1][1] = listaAcertadas
for key,value in prova.items():
    provaframe = pd.DataFrame(columns=['Menor Nota', 'Maior Nota','Questoes em comum','Excl. Menor Nota', 'Excl. Maior Nota'])
    for key2,value2 in value.items():
        if key2 == 0:
            continue
        maior = list(map(int,value2[1][1].split(",")))
        menor = list(map(int,value2[0][1].split(",")))
        exclusivoMaior = [i for i in maior if i not in menor]
        exclusivoMenor = [i for i in menor if i not in maior]
        comum = [i for i in menor if i in maior]
        exclusivoMaior = ",".join(map(str, exclusivoMaior))
        exclusivoMenor = ",".join(map(str, exclusivoMenor))
        comum = ",".join(map(str, comum))
        provaframe.loc[key2] = [value2[0][0], value2[1][0], comum,exclusivoMenor, exclusivoMaior]
    provaframe = provaframe.sort_index()
    provaframe.to_excel(f'Questoes_Por_Nota_{key}.xlsx')



