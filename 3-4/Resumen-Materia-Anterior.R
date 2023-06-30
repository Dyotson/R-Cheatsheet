# Probabilidades

# Modelo y Comando (_ es para los diferentes metodos)
# Binomial _binom(q, size=n, prob=n)
# Geometrica _geom(q, x=x-1, prob=p)
# Binomial Negativa _nbinom(q, x=x-r, size=r, prob=p)
# Poission _pois(q, lambda=a)
# Uniforme _unif(q, min=a, max=b)
# Normal _norm(q, mean=u, sd=o)
# Exponencial _exp(q, rate=v)
# Gamma _gamma(q, shape=k, rate=v)
# Chi Cuadrado _chisq(q, df=n)
# t-Student _t(q, df=n)
# Fisher _f(q, df1=n1, df2=n2)
# Log-Normal _lnorm(q, meanlog=a, sdlog=c)
# Hipergeométrica: _hyper(q, m=m, n=N − m, k=n)
# Weibull: weibull(q,shape=β,scale=η)
# Logistica: _logis(q, location=µ, scale=σ)



# Metodos (Ej: dlnorm())
# dDISTR(x) entrega P(X=x) o fx(x)
# pDISTR(q) entrega P(X <= q)
# qDISTR(p) entrega el valor de x tal que P(X <= x) = p
# rDISTR(n) Genera una muestra proveniente de un modelo

# 1
pnorm(7, mean=5.6, sd=1.4)

# 2
pexp(6, rate=0.4) - pexp(3, rate=0.4)

# 3
ppois(8, lambda=7) - ppois(4, lambda=7)

# 4
dbinom(6, size=10, prob=0.3)

# 5
1 - pgeom(10, prob = 0.3)


# Bases de Datos
data <- read.table(file.choose(), header = TRUE) # Abrir .txt