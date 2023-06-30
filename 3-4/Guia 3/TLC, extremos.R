#Recordar corrección por continuidad)
#xi normal(n*u, sqrt(var)*sqrt(n))
#prom(xi) normal(u, sqrt(var)/sqrt(n))

#------------
#1. Si X1, . . . , X60 iid∼ Poisson(4),    0.7901297
#Calcular aprox P(prom(X) ≤ 4.2).         Continuidad

n=60
#prom(x)- normal(u, sqrt(var)/sqrt(n))
lambda=4
mu=lambda
sigma=sqrt(lambda)


pnorm(q =4.2 ,mean =mu ,sd =sigma/sqrt(n) )
#hay que hacer ajuste, como es un promedio se añade  o resta 0.5/n
pnorm(q =4.2+0.5/n ,mean =mu ,sd =sigma/sqrt(n) )  


#------------
#2. Si Y1, . . . , Y45 iid∼ Normal(4, 1),     0.9101438
#calcular P(3 < prom(Y) < 4.2).

#prom(x)- normal(u, sqrt(var)/sqrt(n))
n=45
mu=4
sigma=1

pnorm(q =4.2 ,mean =mu ,sd = sigma / sqrt(n))-pnorm(q =3 ,mean =mu ,sd = sigma / sqrt(n))

#------------
#3. Si Z1, . . . , Z40 iid∼ Gamma(2, 2),     0.1855467
#calcular aproximadamente P(prom(Z) > 1.1).

#mean(x)- normal(u, sqrt(var)/sqrt(n))
k <-  2
v <- 2
n <- 40
mu <- k/v                   
sigma <- sqrt(k/(v)^2)   #cuidado con usar la varianza y no sigma !!!!

1-pnorm(q =1.1 ,mean =mu ,sd =sigma/sqrt(n))


#------------
#4. Si W1, . . . , W120 iid∼ Bernoulli(0.2),      0.1047035
#calcular aproximadamente P(prom(W) ≥ 0.25).     Continuidad
n <- 120
p <- 0.2
mu <- p
sigma <- sqrt(p * (1 - p)) / sqrt(n)

#prom(x)- normal(u, sqrt(var)/sqrt(n))

#  P(mean(W) > 0.25 - 0.5/n) ajuste en este caso
#si fuera P(mean(W) ≤ 0.25) = P(mean(W) < 0.25 + 0.5/n)

1-pnorm(q =0.25- 0.5/n  ,mean =mu ,sd =sigma)

#------------                                                            
#5. Si X1, . . . , X5 iid∼ Uniforme(3, 6),       0.5981224
#calcular la probabilidad P(X(5) > 5.5), donde X(5) = max{X1, . . . , X5}.

#max FYn = [Fx(Y)]^n formula
a=3
b=6
n=5
1 - punif(5.5, min = a, max = b)^n



#------------
#6. Si T1, . . . , T10 iid∼ Exponencial(0.5),     0.0101859
#calcular P(T(10) < 2), donde T(10) = max{T1, . . . , T10}.

# max es FYn = [Fx(Y)]^n 
# min es FY1 = 1 − [1 − FX (y)]^n
# donde FX  es reemplazar pdistr() de alguna distribución
# OJO con los minimos: P(Y1 ≤ a) = 1 − [1 − FX (a)]^ n  (no quitar el 1)
# y no solo la formula: [1 − FX (a)]^ n 

v=0.5
n=10

pexp(q = 2,rate = v)^n


#------------
#7. Si S1, . . . , S4 iid∼ Normal(0, 2),         0.0980767
#calcular la probabilidad P(S(1) > −0.3), donde S(1) = min{S1, . . . , S4}.

#FY1(y) = 1 − [1 − FX (y)]**n    formula
u=0
sigma=2
n=4

1-(1-(1-pnorm(q =-0.3 ,mean =u ,sd = sigma))^n)


#------------
#8. Si W1, . . . , W14 iid∼ Beta(3, 4),          0.4928458
#calcular P(W(1) ≤ 0.15), donde W(1) = min{W1, . . . , W14}

#FY1(y) = 1 − [1 − FX (y)]**n
n=14
a=3
b=4

1-(1-pbeta(q =0.15 ,shape1 =a ,shape2 =b ))^n



