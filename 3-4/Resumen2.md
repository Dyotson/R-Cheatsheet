# Resumen 2

## Recordatorio

### Modelo y Comando (\_ es para los diferentes metodos)

- Binomial \_binom(q, size=n, prob=n)
- Geometrica \_geom(q, x=x-1, prob=p)
- Binomial Negativa \_nbinom(q, x=x-r, size=r, prob=p)
- Poission \_pois(q, lambda=a)
- Uniforme \_unif(q, min=a, max=b)
- Normal \_norm(q, mean=u, sd=o)
- Exponencial \_exp(q, rate=v)
- Gamma \_gamma(q, shape=k, rate=v)
- Chi Cuadrado \_chisq(q, df=n)
- t-Student \_t(q, df=n)
- Fisher \_f(q, df1=n1, df2=n2)
- Log-Normal \_lnorm(q, meanlog=a, sdlog=c)
- Hipergeométrica: \_hyper(q, m=m, n=N − m, k=n)
- Weibull: weibull(q,shape=β,scale=η)
- Logistica: \_logis(q, location=µ, scale=σ)

### Metodos (Ej: dlnorm())

- dDISTR(x) entrega P(X=x) o fx(x)
- pDISTR(q) entrega P(X <= q)
- qDISTR(p) entrega el valor de x tal que P(X <= x) = p
- rDISTR(n) Genera una muestra proveniente de un modelo

## Conjuntas

### Ejemplo 1

Para un modelo donde **n** es igual la cantidad de intentos/pruebas y **p** es la probablidad de exito, y deseas obtener que ocurra en el suceso **b**, seria (Por ejemplo, con modelo binomial y buscar entre b1 y b2):

    pbinom(q=b ,size=n ,prob=p)

Un ejemplo para el uso de pbinom, seria si quisieramos obtener la probabilidad de que un suceso ocurra en los sucesos **8 ≤ Y < 16**, que seria igual a:

    pbinom(q=15 ,size=22 ,prob=0.6 ) - pbinom(q=8 ,size=22 ,prob=0.6)

### Ejemplo 2

Para funciones conjuntas **compuestas**, por ejemplo, X ∼ Poisson(7) , Y |X = x ∼ Binomial(x, 0.3) (Osea, donde el valor de Y depende de un X)

    p <- 0.3
    lambda <- 7

Y te piden P(X = 7, Y = 4), la logica seria la siguiente:
p(Y = 4|X = 7) = p(X = 7,Y = 4) / p(X = 7) >>> p(X = 7,Y = 4)= p(X = 7) \* p(Y = 4|X = 7).
Finalmente, el calculo seria:

    Conjunta <- dpois(x=7,lambda = lambda) *  dbinom(x =4 ,size =7 , prob =p )

### Ejemplo 3

Para cuando tenemos un X e Y dados, como por ejemplo P(Y ≤ 4|X = 9), usamos:

    pbinom(q = 4 ,size =9 ,prob = p) # p es la misma que la inicial en el ejemplo 2

### Ejemplo 4

Cuando necesitamos cuando el valor será igual a ciertos valores designados, como por ejemplo, P(X = 10|Y = 7), usamos:

La logica seria la siguiente:
p(X = 10|Y = 7) = p(X = 10 , Y = 7) / p(Y = 7)
Sabemos que PY es Poisson(p*lambda) = Poisson(0.3 * 7), hay que sacar la conjunta

Entonces, el codigo seria:

    Conjunta3 <- dpois(x=10,lambda = lambda) *  dbinom(x =7 ,size =10 , prob =p ) ;
    Condicional2 <- Conjunta3/ dpois(x = 7,lambda = p*lambda) ;Condicional2
