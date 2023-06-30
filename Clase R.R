# 1 1:10
sum(1:10)

# 2 (10:73)^4
sum((10:73)^4)

# 3 6*sqrt(3*(3:7))
sum(6*sqrt(3*(3:7)))

# 4 seq(from = 0.1, to = 2.1, by = 0.1) 
sum(log(seq(from = 0.1, to = 2.1, by = 0.1)))

# 5 1:100 =/ 1+2+3+4+5+... | 1:100 = (1, 2, 3, ...)
sum(1/(1:100)) # 1/1 + 1/2 + 1/3

# 6 sin(x) | cos(x) | tan(x) | acos(x) | asin(x) | atan(x)
# Pi = pi
sum(sin((1:20)*pi/5)^2)

# Bases de Datos

# Abalon.xlsx

# Importar BDD
library("readxl")
df <- read_excel(file.choose()) # Si esto tira error, usar install.packages("readxl") en la consola
# df <- read_excel(C:/xd/as/)
# df <- read.csv(file.choose()) # Importa .csv

# 1 sum() -> La suma de todos los elementos que cumplan una condicion
# df$centro == "Caldera" -> Cuales filas cumplen la condicion que su centro sea Caldera 
# df$centro -> Sacar toda la columna

sum(df$centro == "Caldera")

# 2 mean(x) donde x es un vector o columna
mean(df$largo)

# 3 sd(x) donde x es un vector o columna
sd(df$pesot)

# 4 BDD[BDD$centro == "",]
pesot_coquimbo <- df[df$centro == "Coquimbo",]
mean(pesot_coquimbo$pesot)

# 5 df$largo > 10
largo_10 <- df[df$largo > 10,]
mean(largo_10$largo)

# 6 df$centro == "Puerto Montt" | df$centro == "Chiloé"
centros_PT_CH <- df[df$centro == "Puerto Montt" | df$centro == "Chiloé",]
mean(centros_PT_CH$alto)

# 7
sum(df$anillos >= 12)

# 8

# 9 nrow(x) -> Nos da el numero de filas
pesot_200 <- df[df$pesot <= 600 & df$pesot >= 200,]
nrow(pesot_200)*100/nrow(df)

# 10
sum(df$centro == "Chiloé")*100/nrow(df)


# Banda Ancha
library(readxl)
df_banda <- read_excel(file.choose())

# 2 n_distinct(x) -> Saca todos los elementos distintos de una columna (Usar dplyr)
library(dplyr) # Instalar dplyr con install.packages("dplyr")
n_distinct(df_banda$Ciudad)

# 6 max(x) saca el maximo de una columna / min(x) saca el minimo de una columna
df_max <- df_banda[df_banda$Ciudad == "Arauco",]
maximo <- max(df_max$Velocidad)
fila_maximo <- df_max[df_max$Velocidad == maximo,]
fila_maximo$Operador

# 7
df_wom <- df_banda[df_banda$Operador == "W",]
v_maxima <- max(df_wom$Velocidad)
v_fila_maximo <- df_wom[df_wom$Velocidad == v_maxima,]
v_fila_maximo$Ciudad

# 8
df_claro <- df_banda[df_banda$Operador == "C",]
df_wom <- df_banda[df_banda$Operador == "W",]
sum(df_claro$Velocidad > df_wom$Velocidad)