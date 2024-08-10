import numpy as np
import pandas as pd
import chardet
provas = [517,516,515,518,503,504,505,506,511,512,513,514,507,508,509,510]
filename = r'2019/DADOS/ITENS_PROVA_2019.csv'
tabela = pd.read_csv(filename,encoding='ISO-8859-1',sep=';')
tabelafiltrada = tabela[tabela["CO_PROVA"].isin(provas)]
tabelaAzul = tabelafiltrada[tabelafiltrada["TX_COR"]=="Azul"]
tabelaAmarela = tabelafiltrada[tabelafiltrada["TX_COR"]=="Amarela"]
tabelaRosa = tabelafiltrada[tabelafiltrada["TX_COR"]=="Rosa"]
tabelaCinza = tabelafiltrada[tabelafiltrada["TX_COR"]=="Cinza"]
tabelaBranca = tabelafiltrada[tabelafiltrada["TX_COR"]=="Branca"]
tabelaAzul=tabelaAzul.sort_values('NU_PARAM_B',ascending=False)
tabelaAmarela=tabelaAmarela.sort_values('NU_PARAM_B',ascending=False)
tabelaRosa=tabelaRosa.sort_values('NU_PARAM_B',ascending=False)
tabelaCinza=tabelaCinza.sort_values('NU_PARAM_B',ascending=False)
tabelaBranca=tabelaBranca.sort_values('NU_PARAM_B',ascending=False)
for i in range(45,181,45):
    azul = tabelaAzul[tabelaAzul['CO_POSICAO']<=i]
    azul = azul[azul['CO_POSICAO']>(i-45)]
    azul.to_csv(f'azul_{i-44}_{i}.csv',sep=';',float_format='%.5f')
    amarela = tabelaAmarela[tabelaAmarela['CO_POSICAO'] <= i]
    amarela = amarela[amarela['CO_POSICAO'] > (i - 45)]
    amarela.to_csv(f'amarela_{i - 44}_{i}.csv', sep=';', float_format='%.5f')
    rosa = tabelaRosa[tabelaRosa['CO_POSICAO'] <= i]
    rosa = rosa[rosa['CO_POSICAO'] > (i - 45)]
    rosa.to_csv(f'rosa_{i - 44}_{i}.csv', sep=';', float_format='%.5f')
    cinza = tabelaCinza[tabelaCinza['CO_POSICAO'] <= i]
    cinza = cinza[cinza['CO_POSICAO'] > (i - 45)]
    cinza.to_csv(f'cinza_{i - 44}_{i}.csv', sep=';', float_format='%.5f')
    branca = tabelaBranca[tabelaBranca['CO_POSICAO'] <= i]
    branca = branca[branca['CO_POSICAO'] > (i - 45)]
    branca.to_csv(f'branca_{i - 44}_{i}.csv', sep=';', float_format='%.5f')

tabelaAzul.to_csv('azul.csv',sep=';',float_format='%.5f')
tabelaAmarela.to_csv('amarela.csv',sep=';',float_format='%.5f')
tabelaRosa.to_csv("rosa.csv",sep=';',float_format='%.5f')
tabelaCinza.to_csv('cinza.csv',sep=';',decimal='.',float_format='%.5f')
tabelaBranca.to_csv('branca.csv',sep=';',decimal='.',float_format='%.5f')
print(tabelaCinza.loc[1653,'NU_PARAM_B'])