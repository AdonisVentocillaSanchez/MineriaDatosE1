#####################
#DATA FRAME
#####################
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
##NO HAY COERSIÓN DE DATOS

########################
#Exploración de datos
########################

## Gráfica de datos NumeroEmbarazos
hist(laboratorio$NumeroEmbarazos)
boxplot(laboratorio$NumeroEmbarazos)

## Gráfica de datos 
hist(laboratorio$Concentrac.blucosa.plama)
boxplot(laboratorio$Concentrac.blucosa.plama)

## Gráfica de datos 
hist(laboratorio$Presión.arterial.diastólica)
bloxplot(laboratorio$Presión.arterial.diastólica)

## Gráfica de datos 
hist(laboratorio$Tríceps.espesor.del.pliegue.cutáneo)
boxplot(laboratorio$Tríceps.espesor.del.pliegue.cutáneo)

## Gráfica de datos 
hist(laboratorio$X2.horas.suero.insulina)
boxplot(laboratorio$X2.horas.suero.insulina)

## Gráfica de datos 
hist(laboratorio$Índice.de.masa.corporal)
boxplot(laboratorio$Índice.de.masa.corporal)

## Gráfica de datos 
hist(laboratorio$Función.pedigrí.de.la.diabetes)
boxplot(laboratorio$Función.pedigrí.de.la.diabetes)

## Gráfica de datos 
hist(laboratorio$edad)
boxplot(laboratorio$edad)

## Gráfica de datos 
plot(laboratorio$resultado)

###########
#Instalación de libreria para gráficas
###########
install.packages("ggplot2")
library(ggplot2)

ggplot(data = laboratorio)+
  geom_histogram(mapping = aes(x= edad))

###########
#Instalacion de librería para ver datos perdidos
###########

install.packages("VIM")
library(VIM)

#Viendo datos nulos
nulos=aggr(laboratorio)
nulos
summary(nulos)

#Ver datos nulos por cada variable
mean(is.na(laboratorio$Presión.arterial.diastólica)) * 100
mean(is.na(laboratorio$Tríceps.espesor.del.pliegue.cutáneo)) * 100
mean(is.na(laboratorio$X2.horas.suero.insulina)) * 100

#####################
#calidad de datos
#####################

#En la variable Presión.arterial.diastólica tenemos 84 NA's(nulos o missing) y representa un 10.94% del total de registros
#En la variable Tríceps.espesor.del.pliegue.cutáneo tenemos 66 NA's(nulos o missing) y representa un 8.59% del total de registros
#En la variable X2.horas.suero.insulina tenemos 70 NA's(nulos o missing) y representa un 9.11% del total de registros

###################
# 3. PREPARACIÓN DE LA DATA
###################

#Seleccionar la data
##Del conjunto de datos solo no necesitamos el N por ser unico de cada registro

labnew = laboratorio[,2:10]
head(labnew)

#Limpiar la data
##Utilizaremos el método de imputación de KNN vecinos más cercanos

##Instalación de librería para imputar los datos
install.packages("DMwR")
library(DMwR)

labnew2 = knnImputation(labnew)
dim(labnew2)
summary(labnew2)
##--Comparación con la data original
summary(labnew)

X2.horas.suero.insulina_disc=nclass.Sturges(labnew2$X2.horas.suero.insulina)
summary(X2.horas.suero.insulina_disc)

X2.horas.suero.insulina = discretize(labnew2$X2.horas.suero.insulina, method = "interval", categories = 7)
summary(X2.horas.suero.insulina)

#construir data
##Tomar 2 o mas variable para crear nuevas variables

#########
#Instalación de libreria para discretizar
#########
install.packages("arules")
library(arules)

Embarazo_disc = discretize(labnew2$NumeroEmbarazos, method = "interval", categories = 4)
summary(Embarazo_disc)

Embarazo_disc1 = discretize(labnew2$NumeroEmbarazos, method = "interval", categories = 8)
summary(Embarazo_disc1)

Concentrac.blucosa.plama_discretizada = discretize(labnew2$Concentrac.blucosa.plama, method = "interval", categories = 4)
summary(Concentrac.blucosa.plama_discretizada)
#Integración data





#Formato de data



