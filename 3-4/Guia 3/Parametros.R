#Ej3
library("rio")
getwd()
setwd("C:/Users/user/Desktop/Datos"  )
data <- import("ENS.xlsx")
str(data)
install.packages("fitdistrplus")
library("fitdistrplus")



#R: (1) λˆ = 5.2473349, ˆζ = 0.2217887, (2) µˆ = 4.72236, σˆ = 0.1757316, (3) µˆ = 75.8890199, σˆ = 6.4495854,
#(4) ˆk = 20.8023593, νˆ = 0.1068317, (5) ˆk = 31.8377709, νˆ = 0.2479596, (6) βˆ = 3.6430157, ηˆ = 52.2573649

#1. Para la variable Colesterol (COLES), 
#ajustar por gráfico de probabilidad una distribución LogNormal(λ, ζ).


x <- sort(data$COLES);
n <- length(x)
m <- 1:n; p <- m/(n+1)

modelo <- lm(log(x)~qnorm(p))    
modelo$coefficients


#2. Ajustar una distribución Log-Logística(µ, σ) al nivel de colesterol de baja densidad (LDL) por medio de
#gráfico de probabilidad.

x <- sort(data$LDL);
n <- length(x)
m <- 1:n; p <- m/(n+1)

modelo <- lm(log(x) ~ qlogis(p))    
modelo$coefficients

#3. Ajustar una distribución Logística(µ, σ) a la presión arterial diastólica (PAD) por método de máxima
#verosimilitud.

EM <- fitdist(data = data$PAD,distr = "logis",method = "mle")
EM$estimate; muEM <- EM$estimate[1]; sigmaEM <- EM$estimate[1]


#4. Para la variable Colesterol (COLES), ajustar por máxima verosimilitud una distribución Gamma(k, ν).

EM <- fitdist(data = data$COLES,distr = "gamma",method = "mle")
EM$estimate; muEM <- EM$estimate[1]; sigmaEM <- EM$estimate[1]


#5. Estimar los parámetros de una distribución Gamma(k, ν) para ajustar a la presión arterial sistólica
#(PAS) por medio de método de momentos.

EM <- fitdist(data = data$PAS,distr = "gamma",method = "mme")
EM$estimate; muEM <- EM$estimate[1]; sigmaEM <- EM$estimate[1]

#6 Ajustar una distribución Weibull(β, η) por máxima verosimilitud al nivel de colesterol de alta densidad
#(HDL).

EM <- fitdist(data = data$HDL,distr = "weibull",method = "mle")
EM$estimate; muEM <- EM$estimate[1]; sigmaEM <- EM$estimate[1]





#--------------------------------------------------------------------------------------
# (1) νˆ = 0.0129063, (2) νˆ = 1.615517, γˆ = 2.5534731.

data2 <- import("Sismos2021.xlsx")

# 1. Ajuste un modelo Exponencial(ν) al tiempo entre sismos (Tiempo) por medio de gráfico de probabilidad.

x <- sort(data2$Tiempo); 
n <- length(x)
m <- 1:n; p <- m/(n+1)

re <- lm(x ~ qexp(p) + 0)
v <- 1/re$coefficients[1] ; v



# 2. Ajuste una distribución Exponencial-Trasladada(ν, γ) a la magnitud de los sismos (Magnitud) por medio
# de gráfico de probabilidad

x <- sort(data2$Magnitud); 
n <- length(x)
m <- 1:n; p <- m/(n+1)

re <- lm(x ~ qexp(p))

v <- 1/re$coefficients[2] 

r <- c(re$coefficients[1],v) ;r   





#--------------------------------------------------------------------------------------

data3 <- import("Abalon.xlsx")
#(1) βˆ = 5.5680812, ηˆ = 14.367347, (2) βˆ = 4.6389635, ηˆ = 11.2924305, (3) λˆ = 9.95

#1. Ajustar un modelo Weibull(β, η) a la variable largo, estimando sus parámetros por máxima verosimilitud.

a <- fitdist(data = data3$largo,distr = "weibull",method = "mle")
a[1]

#2. Ajustar una distribución Weibull(β, η) a la variable diametro por medio de gráfico de probabilidad
#(qq).

x <- sort(data3$diametro); 
n <- length(x)
m <- 1:n; p <- m/(n+1)

resultados <- lm(log(x) ~ log(-log(1-p)))
beta <- 1/resultados$coef[2]
eta <- exp(resultados$coef[1])
c(beta,eta)

#3. A la variable número de anillos, ajustar una distribución Poisson(λ) por medio del método de
#momentos.

fitdist(data = data3$anillos,distr = "pois",method = "mme")

