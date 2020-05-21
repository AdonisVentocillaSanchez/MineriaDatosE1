#####################
#DATA FRAME
###################
#ENTENDIMIENTO DE LA DATA
laboratorio=read.csv("https://gist.githubusercontent.com/AdonisVentocillaSanchez/6152195f6a6ea4a00ff6f8c11eb0c699/raw/c2084034753b1be7398fd5ef33762f381326c88f/diabetes_m.csv", sep=";")
head(laboratorio)
#N:
#NumeroEmbarazos
#Concentrac.blucosa.plama
#Presión.arterial.diastólica
#Tríceps.espesor.del.pliegue.cutáneo
#X2.horas.suero.insulina
#Índice.de.masa.corporal
#Función.pedigrí.de.la.diabetes
#edad
#resultado

###########
#Descripción de la data
str(laboratorio)
# Se cuenta con un conjunto de datos de  768 observaciones y 10 variables
#La variable "N" es un identificador
summary(laboratorio)
#La variable "NumeroEmbarazos" muestra datos elevados con respecto a la cantidad de veces embarazada

#Coersion
laboratorio$edad=as.integer(laboratorio$edad)

########################
#Exploración de datos
hist(laboratorio$edad)


