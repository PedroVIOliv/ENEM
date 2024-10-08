#--------------------------------------------------------
#  INEP/Daeb-Diretoria de Avalia��o da Educa��o B�sica 
#  Coordena��o-Geral de Instrumentos e Medidas (CGIM)			
#--------------------------------------------------------

#--------------------------------------------------------
#  PROGRAMA:                                                                                                      
#           INPUT_R_MICRODADOS_ENEM_2019
#--------------------------------------------------------
#  DESCRI��O:
#           PROGRAMA PARA LEITURA DA BASE DE DADOS
#           MICRODADOS_ENEM_2019
#--------------------------------------------------------

#------------------------------------------------------------------------
# Obs:                                                                                                                    
#     Para abrir os microdados � necess�rio salvar este programa e o arquivo                    
#     MICRODADOS_ENEM_2019.csv no mesmo diret�rio.	                  
#------------------------------------------------------------------------

#------------------------------------------------------------------------
#                   ATEN��O              
#------------------------------------------------------------------------
# Este programa abre a base de dados com os r�tulos das vari�veis de	                    
# acordo com o dicion�rio de dados que comp�em os microdados. 		  
#------------------------------------------------------------------------

#--------------------
# Intala��o do pacote Data.Table
# Se n�o estiver instalado
#--------------------
if(!require(data.table)){install.packages('data.table')}

#--------------------
# Caso deseje trocar o local do arquivo, 
# edit a fun��o setwd() a seguir informando o local do arquivo.
# Ex. Windows setwd("C:/temp")
#     Linux   setwd("/home")
#--------------------
setwd("C:/")  

#---------------
# Aloca��o de mem�ria
#---------------
memory.limit(24576)

#------------------
# Carga dos microdados

ENEM_2019 <- data.table::fread(input='microdados_ENEM_2019.csv',
                               integer64='character',
                               skip=0,  #Ler do inicio
                               nrow=-1, #Ler todos os registros
                               na.strings = "", 
                               showProgress = TRUE)

#---------------------------
# A script a seguir formata os r�tulos das respostas
# Para formatar um item retire o caracter de coment�rio (#) no in�cio na linha desejada 
#---------------------------

#ENEM_2019$TP_FAIXA_ETARIA <- factor(ENEM_2019$TP_FAIXA_ETARIA, 
#                                    levels = c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20), 
#                                    labels = c('Menor de 17 anos','17 anos','18 anos','19 anos','20 anos','21 anos','22 anos',
#                                               '23 anos','24 anos','25 anos','Entre 26 e 30 anos','Entre 31 e 35 anos','Entre 36 e 40 anos',
#                                               'Entre 41 e 45 anos','Entre 46 e 50 anos','Entre 51 e 55 anos','Entre 56 e 60 anos','Entre 61 e 65 anos',
#                                               'Entre 66 e 70 anos','Maior de 70 anos'))

#ENEM_2019$IN_TREINEIRO <- factor(ENEM_2019$IN_TREINEIRO, levels = c(1,0),  labels=c('Sim','N�o'))

#ENEM_2019$TP_DEPENDENCIA_ADM_ESC <- factor(ENEM_2019$TP_DEPENDENCIA_ADM_ESC, levels = c(1,2,3,4),
#                                           labels=c('Federal',
#                                                    'Estadual',
#                                                    'Municipal',
#                                                    'Privada'))

#ENEM_2019$TP_LOCALIZACAO_ESC <- factor(ENEM_2019$TP_LOCALIZACAO_ESC, levels = c(1,2), labels=c('Urbana','Rural'))

#ENEM_2019$TP_SIT_FUNC_ESC <- factor(ENEM_2019$TP_SIT_FUNC_ESC, levels = c(1,2,3,4),
#                                    labels=c('Em atividade',
#                                             'Paralisada',
#                                             'Extinta',
#                                             'Escola extinta em anos anteriores'))

#ENEM_2019$TP_SEXO <- factor(ENEM_2019$TP_SEXO, levels = c('M','F'), labels=c('Maculino','Feminino'))

#ENEM_2019$TP_ESTADO_CIVIL <- factor(ENEM_2019$TP_ESTADO_CIVIL, levels = c(0,1,2,3,4),
#                                    labels=c('N�o informado',
#                                             'Solteiro(a)',
#                                             'Casado(a)/Mora com um(a) companheiro(a)',
#                                             'Divorciado(a)/Desquitado(a)/Separado(a)',
#                                             'Vi�vo(a)'))

#ENEM_2019$TP_COR_RACA <- factor(ENEM_2019$TP_COR_RACA, levels = c(0,1,2,3,4,5,6),
#                                labels=c('N�o declarado',
#                                         'Branca','Preta',
#                                         'Parda','Amarela',
#                                         'Ind�gena',
#                                         'N�o disp�e da informa��o'))

#ENEM_2019$TP_NACIONALIDADE <- factor(ENEM_2019$TP_NACIONALIDADE, levels = c(0,1,2,3,4),
#                                     labels=c('N�o informado',
#                                              'Brasileiro(a)',
#                                              'Brasileiro(a) Naturalizado(a)',
#                                              'Estrangeiro(a)',
#                                              'Brasileiro(a) Nato(a), nascido(a) no exterior'))

#ENEM_2019$TP_ST_CONCLUSAO <- factor(ENEM_2019$TP_ST_CONCLUSAO, levels = c(1,2,3,4), 
#                                    labels=c('J� conclu� o Ensino M�dio',
#                                             'Estou cursando e concluirei o Ensino M�dio em 2019',
#                                             'Estou cursando e concluirei o Ensino M�dio ap�s 2019',
#                                             'N�o conclu� e n�o estou cursando o Ensino M�dio'))

#ENEM_2019$TP_ANO_CONCLUIU <- factor(ENEM_2019$TP_ANO_CONCLUIU, levels = c(0,1,2,3,4,5,6,7,8,9,10,11,12,13),
#                                    labels=c('N�o informado','2018','2017','2016',
#                                             '2015','2014','2013',
#                                             '2012','2011','2010',
#                                             '2009','2008','2007',
#                                             'Anterior a 2007'))

#ENEM_2019$TP_ESCOLA <- factor(ENEM_2019$TP_ESCOLA, levels = c(1,2,3,4),
#                              labels=c('N�o respondeu',
#                                       'P�blica',
#                                       'Privada',
#                                       'Exterior'))

#ENEM_2019$TP_ENSINO <- factor(ENEM_2019$TP_ENSINO, levels = c(1,2,3),
#                              labels=c('Ensino Regular',
#                                       'Educa��o Especial - Modalidade Substitutiva',
#                                       'Educa��o de Jovens e Adultos'))

#ENEM_2019$TP_PRESENCA_CN <- factor(ENEM_2019$TP_PRESENCA_CN, levels = c(0,1,2),
#                                    labels=c('Faltou � prova',
#                                            'Presente na prova',
#                                            'Eliminado na prova'))

#ENEM_2019$TP_PRESENCA_CH <- factor(ENEM_2019$TP_PRESENCA_CH, levels = c(0,1,2),
#                                   labels=c('Faltou � prova',
#                                            'Presente na prova',
#                                            'Eliminado na prova'))

#ENEM_2019$TP_PRESENCA_LC <- factor(ENEM_2019$TP_PRESENCA_LC, levels = c(0,1,2),
#                                   labels=c('Faltou � prova',
#                                            'Presente na prova',
#                                            'Eliminado na prova'))

#ENEM_2019$TP_PRESENCA_MT <- factor(ENEM_2019$TP_PRESENCA_MT, levels = c(0,1,2),
#                                   labels=c('Faltou � prova',
#                                            'Presente na prova',
#                                            'Eliminado na prova'))

#ENEM_2019$CO_PROVA_CN <- factor(ENEM_2019$CO_PROVA_CN, levels = c(503,504,505,506,519,523,543,544,545,546),
#                                labels=c('Azul','Amarela','Cinza',
#                                         'Rosa','Laranja - Adaptada Ledor',
#                                         'Verde - Videoprova - Libras)',
#                                         'Amarela (Reaplica��o)',
#                                         'Cinza (Reaplica��o)',
#                                         'Azul (Reaplica��o)',
#                                         'Rosa (Reaplica��o)'))

#ENEM_2019$CO_PROVA_CH <- factor(ENEM_2019$CO_PROVA_CH, levels = c(507,508,509,510,520,524,547,548,549,550,564),
#                                labels=c('Azul','Amarela','Branca',
#                                        'Rosa','Laranja - Adaptada Ledor',
#                                        'Verde - Videoprova - Libras)',
#                                        'Azul (Replica��o)',
#                                        'Amarela (Reaplica��o)',
#                                        'Branca (Reaplica��o)',
#                                        'Rosa (Reaplica��o)',
#                                        'Laranja - Adaptada Ledor (Reaplica��o)'))

#ENEM_2019$CO_PROVA_LC <- factor(ENEM_2019$CO_PROVA_LC, levels = c(511,512,513,514,521,525,551,552,553,554,565),
#                                labels=c('Azul','Amarela','Rosa','Branca',
#                                         'Laranja - Adaptada Ledor',
#                                         'Verde - Videoprova - Libras)',
#                                         'Azul (Replica��o)',
#                                         'Amarela (Reaplica��o)',
#                                         'Branca (Reaplica��o)',
#                                         'Rosa (Reaplica��o)',
#                                         'Laranja - Adaptada Ledor (Reaplica��o)'))

#ENEM_2019$CO_PROVA_MT <- factor(ENEM_2019$CO_PROVA_MT, levels = c(515,516,517,518,522,526,555,556,557,558),
#                                 labels=c('Azul','Amarela','Rosa',
#                                          'Cinza',
#                                          'Laranja - Adaptada Ledor',
#                                          'Verde - Videoprova - Libras)',
#                                          'Amarela (Reaplica��o)',
#                                          'Cinza (Reaplica��o)',
#                                          'Azul (Reaplica��o)',
#                                          'Rosa (Reaplica��o)'))

#ENEM_2019$ TP_LINGUA <- factor(ENEM_2019$ TP_LINGUA, levels = c(0,1),
#                                labels=c('Ingl�s','Espanhol'))

#ENEM_2019$TP_STATUS_REDACAO <- factor(ENEM_2019$TP_STATUS_REDACAO, levels = c(1,2,3,4,5,6,7,8,9),
#                                      labels=c('Sem problemas',
#                                               'Anulada','C�pia Texto Motivador',
#                                               'Em Branco','Fere Direitos Humanos',
#                                               'Fuga ao tema',
#                                               'N�o atendimento ao tipo',
#                                               'Texto insuficiente',
#                                               'Parte desconectada'))

#ENEM_2019$Q001 <- factor(ENEM_2019$Q001, levels = c('A','B','C','D','E','F','G','H'),
#                         labels=c('Nunca estudou',
#                                  'N�o completou a 4� s�rie/5� ano do ensino fundamental',
#                                  'Completou a 4� s�rie/5� ano, mas n�o completou a 8� s�rie/9� ano do ensino fundamental',
#                                  'Completou a 8� s�rie/9� ano do ensino fundamental, mas n�o completou o Ensino M�dio',
#                                  'Completou o Ensino M�dio, mas n�o completou a Faculdade',
#                                  'Completou a Faculdade, mas n�o completou a P�s-gradua��o',
#                                  'Completou a P�s-gradua��o','N�o sei'))

#ENEM_2019$Q002 <- factor(ENEM_2019$Q002, levels = c('A','B','C','D','E','F','G','H'),
#                         labels=c('Nunca estudou',
#                                  'N�o completou a 4� s�rie/5� ano do ensino fundamental',
#                                  'Completou a 4� s�rie/5� ano, mas n�o completou a 8� s�rie/9� ano do ensino fundamental',
#                                  'Completou a 8� s�rie/9� ano do ensino fundamental, mas n�o completou o Ensino M�dio',
#                                  'Completou o Ensino M�dio, mas n�o completou a Faculdade',
#                                  'Completou a Faculdade, mas n�o completou a P�s-gradua��o',
#                                  'Completou a P�s-gradua��o','N�o sei'))

#ENEM_2019$Q003 <- factor(ENEM_2019$Q003, levels =  c('A','B','C','D','E','F'),
#                         labels=c('Grupo 1 (Verificar a defini��o no dicion�rio de dados)',
#                                  'Grupo 2 (Verificar a defini��o no dicion�rio de dados)',
#                                  'Grupo 3 (Verificar a defini��o no dicion�rio de dados)',
#                                  'Grupo 4 (Verificar a defini��o no dicion�rio de dados)',
#                                  'Grupo 5 (Verificar a defini��o no dicion�rio de dados)',
#                                  'N�o Sei'))

#ENEM_2019$Q004 <- factor(ENEM_2019$Q004, levels =  c('A','B','C','D','E','F'),
#                         labels=c('Grupo 1 (Verificar a defini��o no dicion�rio de dados)',
#                                  'Grupo 2 (Verificar a defini��o no dicion�rio de dados)',
#                                  'Grupo 3 (Verificar a defini��o no dicion�rio de dados)',
#                                  'Grupo 4 (Verificar a defini��o no dicion�rio de dados)',
#                                  'Grupo 5 (Verificar a defini��o no dicion�rio de dados)',
#                                  'N�o Sei'))

#ENEM_2019$Q005 <- factor(ENEM_2019$Q005, levels = c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20), 
#                         labels=c('1','2','3','4','5','6','7','8','9','10',
#                                  '11','12','13','14','15','16','17','18','19','20'))

#ENEM_2019$Q006 <- factor(ENEM_2019$Q006,levels =  c('A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q'),
#                         labels=c('Nenhuma renda.',
#                                  'At� R$ 998,00',
#                                  'De R$ 998,01 at� R$ 1.497,00',
#                                  'De R$ 1.497,01 at� R$ 1.996,00',
#                                  'De R$ 1.996,01 at� R$ 2.495,00',
#                                  'De R$ 2.495,01 at� R$ 2.994,00',
#                                  'De R$ 2.994,01 at� R$ 3.992,00',
#                                  'De R$ 3.992,01 at� R$ 4.990,00',
#                                  'De R$ 4.990,01 at� R$ 5.988,00',
#                                  'De R$ 5.988,01 at� R$ 6.986,00',
#                                  'De R$ 6.986,01 at� R$ 7.984,00',
#                                  'De R$ 7.984,01 at� R$ 8.982,00',
#                                  'De R$ 8.982,01 at� R$ 9.980,00',
#                                  'De R$ 9.980,01 at� R$ 11.976,00',
#                                  'De R$ 11.976,01 at� R$ 14.970,00',
#                                  'De R$ 14.970,01 at� R$ 19.960,00',
#                                  'Mais de R$ 19.960,00'))


#ENEM_2019$Q007 <- factor(ENEM_2019$Q007, levels = c('A','B','C','D'),
#                         labels=c('N�o','Sim, um ou dois dias por semana',
#                                  'Sim, tr�s ou quatro dias por semana',
#                                  'Sim, pelo menos cinco dias por semana'))

#ENEM_2019$Q008 <- factor(ENEM_2019$Q008, levels = c('A','B','C','D','E'),
#                         labels=c('N�o',
#                                  'Sim, um',
#                                  'Sim, dois',
#                                  'Sim, tr�s',
#                                  'Sim, quatro ou mais'))

#ENEM_2019$Q009 <- factor(ENEM_2019$Q009, levels = c('A','B','C','D','E'),
#                         labels=c('N�o',
#                                  'Sim, um',
#                                  'Sim, dois',
#                                  'Sim, tr�s',
#                                  'Sim, quatro ou mais'))


#ENEM_2019$Q010 <- factor(ENEM_2019$Q010, levels = c('A','B','C','D','E'),
#                         labels=c('N�o',
#                                  'Sim, um',
#                                  'Sim, dois',
#                                  'Sim, tr�s',
#                                  'Sim, quatro ou mais'))

#ENEM_2019$Q011 <- factor(ENEM_2019$Q011, levels = c('A','B','C','D','E'),
#                         labels=c('N�o',
#                                  'Sim, um',
#                                  'Sim, dois',
#                                  'Sim, tr�s',
#                                  'Sim, quatro ou mais'))

#ENEM_2019$Q012 <- factor(ENEM_2019$Q012, levels = c('A','B','C','D','E'),
#                         labels=c('N�o',
#                                  'Sim, um',
#                                  'Sim, dois',
#                                  'Sim, tr�s',
#                                  'Sim, quatro ou mais'))

#ENEM_2019$Q013 <- factor(ENEM_2019$Q013, levels = c('A','B','C','D','E'),
#                         labels=c('N�o',
#                                  'Sim, um',
#                                  'Sim, dois',
#                                  'Sim, tr�s',
#                                  'Sim, quatro ou mais'))

#ENEM_2019$Q014 <- factor(ENEM_2019$Q014, levels = c('A','B','C','D','E'),
#                         labels=c('N�o',
#                                  'Sim, um',
#                                  'Sim, dois',
#                                  'Sim, tr�s',
#                                  'Sim, quatro ou mais'))

#ENEM_2019$Q015 <- factor(ENEM_2019$Q015, levels = c('A','B','C','D','E'),
#                         labels=c('N�o',
#                                  'Sim, um',
#                                  'Sim, dois',
#                                  'Sim, tr�s',
#                                  'Sim, quatro ou mais'))

#ENEM_2019$Q016 <- factor(ENEM_2019$Q016, levels = c('A','B','C','D','E'),
#                         labels=c('N�o',
#                                  'Sim, um',
#                                  'Sim, dois',
#                                  'Sim, tr�s',
#                                  'Sim, quatro ou mais'))

#ENEM_2019$Q017 <- factor(ENEM_2019$Q017, levels = c('A','B','C','D','E'),
#                         labels=c('N�o',
#                                  'Sim, um',
#                                  'Sim, dois',
#                                  'Sim, tr�s',
#                                  'Sim, quatro ou mais'))

#ENEM_2019$Q018 <- factor(ENEM_2019$Q018, levels = c('A','B'), labels=c('N�o','Sim'))

#ENEM_2019$Q019 <- factor(ENEM_2019$Q019, levels = c('A','B','C','D','E'),
#                         labels=c('N�o',
#                                  'Sim, um',
#                                  'Sim, dois',
#                                  'Sim, tr�s',
#                                  'Sim, quatro ou mais'))

#ENEM_2019$Q020 <- factor(ENEM_2019$Q020, levels = c('A','B'), labels=c('N�o','Sim'))
#ENEM_2019$Q021 <- factor(ENEM_2019$Q021, levels = c('A','B'), labels=c('N�o','Sim'))

#ENEM_2019$Q022 <- factor(ENEM_2019$Q022, levels = c('A','B','C','D','E'),
#                         labels=c('N�o',
#                                  'Sim, um',
#                                  'Sim, dois',
#                                  'Sim, tr�s',
#                                  'Sim, quatro ou mais'))

#ENEM_2019$Q023 <- factor(ENEM_2019$Q023, levels = c('A','B'), labels=c('N�o','Sim'))

#ENEM_2019$Q024 <- factor(ENEM_2019$Q024, levels = c('A','B','C','D','E'),
#                         labels=c('N�o',
#                                  'Sim, um',
#                                  'Sim, dois',
#                                  'Sim, tr�s',
#                                  'Sim, quatro ou mais'))

#ENEM_2019$Q025 <- factor(ENEM_2019$Q025, levels = c('A','B'), labels=c('N�o','Sim'))
