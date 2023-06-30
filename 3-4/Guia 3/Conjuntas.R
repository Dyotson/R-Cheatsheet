#OJO DISCRETOS (control 1)
#Binomial(n = 22, p = 0.6)
#P (8 ≤ Y < 16) es
pbinom(q =15 ,size =22 ,prob =0.6 ) - pbinom(q =7 ,size =22 ,prob =0.6 )

# Ej 1
# X ∼ Poisson(7) , Y |X = x ∼ Binomial(x, 0.3)

p <- 0.3   #fijos
lambda <- 7

#--
# (a) P(X = 7, Y = 4)         0.0144891
# p(Y = 4|X = 7) = p(X = 7,Y = 4) / p(X = 7) 
# >>> p(X = 7,Y = 4)=  p(X = 7) * p(Y = 4|X = 7)

# TEORIA:
# p(X | Y) = P(X, Y) / P(X)

Conjunta <- dpois(x=7,lambda = lambda) *  dbinom(x =4 ,size =7 , prob =p ) ; Conjunta

#--
#(b) P(Y ≤ 4|X = 9)           0.9712045
#metodo directo, es Y|X dado

# [1, 2, 3, 4, 5, 6, 7, 8, 9] => [1, 2, 3, 4]

pbinom(q = 4 ,size =9 ,prob = p)

#profe seguramente usó: (hizo P(Y ≤ 4|X = 7)) y por eso no coinciden respuestas
pbinom(q = 4 ,size =7 ,prob = p)


#(c) P(X = 10|Y = 7)          0.1460138
#p(X = 10|Y = 7) = p(X = 10 , Y = 7) / p(Y = 7)
#
#Sabemos que PY es Poisson(p*lambda)=Poisson(0.3 * 7), hay que sacar la conjunta

# [1, 2, 3, 4, 5, 6, 7, 8, 9] = []

Conjunta3 <- dpois(x=10,lambda = lambda) *  dbinom(x =7 ,size =10 , prob =p ) ; 
Condicional2 <- Conjunta3/ dpois(x = 7,lambda = p*lambda) ;Condicional2



#(d) P(X ≤ 10|Y = 7)       R: 0.2793449
#esta esta al reves, no es directa
# P(X ≤ 10|Y = 7)= p(X ≤ 10,Y = 7) / p(Y = 7)       sabemos P(Y)
#
# De: P(Y = 7|X ≤ 10)= p(X ≤ 10,Y = 7) / P(X ≤ 10) >>> 
# p(X ≤ 10,Y = 7)= P(X ≤ 10)* P(Y = 7|X ≤ 10)    usamos esto
p <- 0.3   #fijo
lambda <- 7 #fijo

x <- 0:10    # por X <=10, P(X = 0)* P(Y = 7|X = 0) + P(X = 1)* P(Y = 7|X = 1)+...
Conjunta4 <- sum(   dpois(x, lambda) * dbinom(7, x, p) ) 

#P(X ≤ 10|Y = 7)= p(X ≤ 10,Y = 7) / p(Y = 7) 
Condicional1 <- Conjunta4/dpois(x=7,lambda = lambda*p) 
Condicional1 


#------------------------------------------------------------------------------
# X ∼ Binomial(12, 0.7) , Y |X = x ∼ Binomial(x, 0.3)
# Y ∼ Binomial(12, 0.7*0.3)
#fijos
px <- 0.7
pyx <- 0.3
#--
#(a) P(Y ≥ 5)  0.0244761
1-pbinom(q = 5,size = 12,prob =px*pyx )
pbinom(q = 5,size = 12,prob =px*pyx ,lower.tail = F)  #False es hacer 1-P

#--
#(b) P(3 ≤ Y ≤ 7|X = 6)   0.25569
#metodo directo, sin transformaciones
#size=6 y q=6,2 (discreto ojo)

pbinom(q=7, size=6, prob=0.3) - pbinom(q=2, size=6, prob=0.3)
# 7 - 2 porque queremos que el 3 este incluido

#--
#(c) P(X = 6|Y = 3)   0.0601106
# P(X = 6|Y = 3) = P(X = 6,Y = 3) / P(Y = 3)

#P(X = 6,Y = 3) = P(Y = 3|X = 6) * P(X = 6)

Conjunta <- dbinom(x =3 ,size =6 ,prob =pyx ) * dbinom(x =6 ,size =12 ,prob =px )
Condicional <- Conjunta/ dbinom(x =3 ,size =12 ,prob = px*pyx) ;Condicional
#0.0601106


#-------------------------------------------------------------------------------

#(X, Y ) ∼ NormalBivariada(µX, µY , σX, σY , ρ)  Facil, Copiar y pegar
muX <- 2
muY<- 2
sX<-1
sY<-2
rho<-0.3

library(mvtnorm)
mu <- c(muX, muY)
sigma <- matrix(c(sX**2, rep(rho*sX*sY,2), sY**2),2,2)
mu ; sigma
#(a) P(1 < X < 2; 1 < Y < 3) 0.1347078 

pmvnorm(lower = c(1,1), upper = c(2,3),
        mean = mu, sigma = sigma)[1]


#(b) P(X < 2.3)   0.6179114

pmvnorm(lower = c(-Inf,-Inf), upper = c(2.3,Inf),
        mean = mu, sigma = sigma)[1]


#(c) P(X > 1; Y < 2.3)  0.4428822

pmvnorm(lower = c(1,-Inf), upper = c(Inf,2.3),
        mean = mu, sigma = sigma)[1]


