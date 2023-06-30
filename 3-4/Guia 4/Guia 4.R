# Guia 4
getwd()
setwd("C:/Users/user/Desktop/Datos")  
library(rio)
data <- import("ENS.xlsx")
library(TeachingDemos)

#-----------------------------------------------------------------------------------
#1 ¿Se puede afirmar a partir de la muestra que el nivel medio de colesterol (COLES) supera los 195 mg/hL?
# Asuma que el nivel de colesterol tiene distribución aproximadamente normal. Utilizar α = 5%.

#dice u>195 t sin sigma conocido
alpha <- 0.05
t <- t.test(data$COLES, mu=195, alternative="greater") ;t
c(t$statistic,t$p.value)
t$p.value>alpha #como valor-p es mayor a alpha, se descarta Ha
#Responder NO (no se puede afirmar que sea >195)

#True = se descarta Ha (No) , False = se descarta Ho (Si)  (aunque OJO con la pregunta )
#OJO: Regla no aplicable al test de kolmogorov-Smirnov

#-----------------------------------------------------------------------------------
#2 ¿Existe evidencia estadística para mostrar que las personas de esta población tienen un nivel medio de
#presión arterial diastólica (PAD) distinto de 75 mg/hL? Asuma que la variable señalada tiene distribución
#aproximadamente normal. Utilizar α = 5%.

#dice u!= 75 , sin sigma   
alpha <- 0.05
t<- t.test(data$PAD, mu=75, alternative="two.sided") ; t
c(t$statistic,t$p.value)
t$p.value>alpha   #como valor p es menor a alpha, se descarta Ho
#Responder SI (si existe evidencia que sea !=75

#-----------------------------------------------------------------------------------
#3 Se postula que la desviación estándar del nivel de colesterol de alta densidad (HDL) es menor a 13 mg/hL.
#¿Se puede respaldar dicha información con los datos entregados? Asuma que la variable señalada tiene
#distribución aproximadamente normal. Utilizar α = 5%.

# dice sd<13
alpha <- 0.05
t <- sigma.test(data$HDL, sigma=13, alternative="less") ;t
c(t$statistic,t$p.value)
t$p.value>alpha  # como valor p es menor a alpha, se descarta Ho
#Responder SI (si se respalda dicha información)


#-----------------------------------------------------------------------------------
#4 Considere el grupo de mujeres (SEXO = 2) y el grupo de hombres (SEXO = 1) por separado. ¿Se puede
#afirmar que los niveles de colesterol de alta densidad (HDL) tienen varianzas diferentes entre mujeres
#y hombres? Asuma que el nivel de colesterol tiene distribución aproximadamente normal. Utilizar
#α = 5%.

#comparación de varianzas , hombres!=mujeres
alpha <- 0.05
#filtrar
hombres <- data[data$SEXO==1,]
mujeres <- data[data$SEXO==2,]

t <- var.test(hombres$HDL , mujeres$HDL, alternative="two.sided", ratio=1) ; t
c(t$statistic,t$p.value)
t$p.value>alpha   # valor p es mayor a alpha y por tanto se descarta Ha
#Responder NO. (no se puede afirmar que tengan varianzas distintas)


#-----------------------------------------------------------------------------------
#5 Teniendo en cuenta la conclusión en (4), ¿existe evidencia estadística que demuestre que el nivel medio
# de HDL es mayor en mujeres que en hombres? Asuma que el nivel de colesterol tiene distribución
# aproximadamente normal. Utilizar α = 5%.

#en 4 concluimos que las varianzas son iguales
#u_mujeres > u_hombres
alpha <- 0.05

#-Dos formas alternativas, cambiar signo del estadistico si es negativo
t <-t.test(hombres$HDL, mujeres$HDL, var.equal = TRUE, alternative = "less", mu=0);t      #u1 < u2
c(t$statistic,t$p.value)
t <-t.test(mujeres$HDL, hombres$HDL, var.equal = TRUE, alternative = "greater", mu=0) ;t  #u1 > u2
c(t$statistic,t$p.value) 

t$p.value>alpha  #como valorp es menor a alpha, se descarta Ho
 
#responder SI (si hay evidencia que u_mujeres > u_hombres)
#!!!!!!!!!!!! valor p no coincide acá con el solucionario dado !!!!!!!!!!!!!!

#------------------------------------------------------------------------------------
#6¿Se puede afirmar a partir de la muestra que la mayoría de la población no fuma? (variable FUMADOR)
#Utilizar α = 5%.

#suponemos que proporcion de mayoria es >50% , volvemos a usar data
alpha <- 0.05

no_fumadores <- data[data$FUMADOR==0,]
# x = exitos (no fumadores)  n= totales   p= 0.5 supuesto de "mayoria"
t <- prop.test(x=nrow(no_fumadores), n=nrow(data), p=0.5, alternative="greater", correct=F)
c(t$statistic,t$p.value)

#pero el profe uso correct = T, que supuestamente no ibamos a usar
t_respuesta <- prop.test(x=nrow(no_fumadores), n=nrow(data), p=0.5, alternative="greater", correct=T)
c(t_respuesta$statistic,t_respuesta$p.value)

t$p.value>alpha    #como valor de p es menor a alpha, se descarta Ho

#responder SI (se puede afirmar que la mayoria de la población no fuma)


#------------------------------------------------------------------------------------
#7 ¿Se afirma que más de un 10% de la población tiene diabetes. ¿Puede respladar esta hipótesis con los
#   datos? Utilizar α = 5% y variable DIABETES.

#           p>0.1 con diabetes
alpha <- 0.05
diabetes <- data[data$DIABETES==1,]
# x = exitos diabetes  n= totales   p= 0.5 supuesto de "mayoria"
t <- prop.test(x=nrow(diabetes), n=nrow(data), p=0.1, alternative="greater", correct=T) ;t
c(t$statistic,t$p.value)
t$p.value>alpha        #como valor p es mayor a alpha, se descarta Ha

#Responder NO (no se puede respaldar que más del 10% de la población tenga diabetes)


#------------------------------------------------------------------------------------
#8 Realizar un test de bondad de ajuste Log-Normal al nivel de colesterol (COLES). ¿Se puede asumir
#una distribución Log-Normal? Utilizar significancia de 5%. Ayuda: estimar parámetros por máxima
#verosimilitud, luego realizar test Kolmogorov-Smirnov (K-S)

#estimar datos primero
library(fitdistrplus)
EMV <- fitdist(data =data$COLES ,distr ="lnorm" ,method ="mle" )

alpha=0.05

#OJO : Ho es que sea log normal y Ha es que no lo sea (al reves)

t <- ks.test(x = data$COLES, y = "plnorm", mean =EMV$estimate[1] , sd = EMV$estimate[2]); t
c(t$statistic,t$p.value)

t$p.value>alpha  # como valor p mayor a alpha, se descarta Ha y se puede asumir como log-normal
#responder SI (si se puede asumir una distr. log normal para los datos, Ho)


#------------------------------------------------------------------------------------
#9 Realizar un test de bondad de ajuste Gamma al nivel de colesterol de baja densidad (LDL). ¿Se puede
#asumir una distribución Gamma? Utilizar significancia de 5%. Ayuda: estimar parámetros por máxima
# verosimilitud, luego realizar test Kolmogorov-Smirnov (K-S)


library(fitdistrplus)
EMV <- fitdist(data =data$LDL ,distr ="gamma" ,method ="mle" )

alpha=0.05

t <- ks.test(x = data$LDL, y = "pgamma", shape =EMV$estimate[1] , rate =EMV$estimate[2]); t
c(t$statistic,t$p.value)

t$p.value>alpha   #como valor p > alpha, se descarta Ha
#Responder SI (se puede asumir distribucion gamma)


#--Parte 2----------------------------------------------------------------------------


data2 <- import("Abalon.xlsx")

#------------------------------------------------------------------------------------
#1. ¿Es posible afirmar que el largo promedio de locos en la costa es menor a 14 cm? Utilizar α = 5%, y
#asumir que la variable señalada tiene distribución aproximadamente normal.

# u < 14
alpha <- 0.05
t <-t.test(data2$largo, mu=14, alternative="less")
c(t$statistic,t$p.value)

t$p.value>alpha     #como valor p menor a alpha, se descarta Ho

#responder Si (si se puede afirmar que u < 14)

#------------------------------------------------------------------------------------
#2. Considere el grupo de locos extraidos en Chiloé (centro == "Chiloé") y en Coquimbo (centro =="Coquimbo")
# por separado ¿Se puede afirmar que los diámetros de los locos observados (diametro)
#tienen varianzas diferentes entre ambos centros? Asuma que el diámetro tiene distribución aproximadamente
#normal. Utilizar α = 5%.
alpha <- 0.05
Chiloe <- data2[data2$centro=="Chiloé",]
Coquimbo <- data2[data2$centro=="Coquimbo",]

# Ha: varianza diametros diferentes : Test para comparación de varianzas

t <- var.test(Chiloe$diametro, Coquimbo$diametro, alternative="two.sided", ratio=1)
c(t$statistic,t$p.value)
t$p.value>alpha    #como valor p mayor a alpha, se descarta Ha

#Responder NO (asumir que son iguales las varianzas)

#------------------------------------------------------------------------------------
#3. Teniendo en cuenta la conclusión en (2), ¿existe evidencia estadística que demuestre que el diámetro
#medio de locos que se extrae en general en Chiloé es distinto a los recolectados en Coquimbo? Asuma
#que en general los diámetros tienen distribución aproximadamente normal. Utilizar α = 5%.

# Comparación medias, Ha: media diametros distintos

alpha <- 0.05
t <-t.test(Chiloe$diametro, Coquimbo$diametro, var.equal = TRUE, alternative = "two.sided", mu=0)
c(t$statistic,t$p.value)
t$p.value>alpha           # valor p mayor, se descarta Ha

#Responder NO (no hay evidencia que sean distintos)


#4. Realizar un test de bondad de ajuste Normal al peso total de locos (pesot). ¿Se puede asumir una
#distribución Normal para el peso total? Utilizar significancia de 5%. Ayuda: estimar parámetros por
#máxima verosimilitud, luego realizar test Kolmogorov-Smirnov (K-S)

#Ho: ajusta normal 
alpha <- 0.05
library(fitdistrplus)
EMV <- fitdist(data2$pesot, distr="norm", method="mle")

t <-ks.test(x=data2$pesot, y="pnorm", mean=EMV$estimate[1], sd=EMV$estimate[2])
c(t$statistic,t$p.value)
t$p.value>alpha        #como p mayor, se descarta ha y ajusta normal entonces

#Responder Si (si se asume que ajuste normal)


#5. Realizar un test de bondad de ajuste Weibull al largo de los locos (largo). ¿Se puede asumir una
#distribución Weibull? Utilizar significancia de 5%. Ayuda: estimar parámetros por máxima verosimilitud,
#luego realizar test Kolmogorov-Smirnov (K-S)

alpha <- 0.05
EMV <- fitdist(data2$largo, distr="weibull", method="mle")

t <-ks.test(x=data2$largo, y="pweibull", shape =EMV$estimate[1], scale =EMV$estimate[2])
c(t$statistic,t$p.value)
t$p.value>alpha  # valor p menor, se descarta Ho 

#Responder No (no se puede asumir ajuste Weibull)




################# Resumen problemas ################################

# Parte 1 : 5  estadistico correcto, pero valor p no
# Parte 2 : 5  stat y valor p correcto, pero la respuesta deberia ser NO y no Si.












