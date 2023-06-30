#Guía 1
#1
sum(1,2,3,4,5,6,7,8,9,10)
sum(1:10)

#2
sum((10:73)^4)

#3
sum(6*(sqrt(3*(3:7))))

#4
sum(log(seq(from=0.1,to=2.1,by=0.1)))

#5
sum(1/(1:100))

#6
sum(sin((1:20)*pi/5)^2)

#Base de datos
library("readxl")
df<-read_excel(file.choose())

#1
sum(df$centro=="Caldera")

#2
mean(df$largo)

#3
sd(df$pesot)

#4
df_pesot_coquimbo <- df[df$centro=="Coquimbo",]
mean(df_pesot_coquimbo$pesot)

#5
df_largo_10<-df[df$largo>10]
mean(df_largo_10$largo)

#6
df_pm_c<-df[df$centro=="Puerto Montt" | df$centro=="Chiloé",]
mean(df_pm_c$alto)

#7
df_a<-df[df$anillos>=12,]
sum(df$anillos>=12)

#8
df_caldera <- df[df$centro=="Caldera",]
sum(df_caldera$anillos>=12)

#9
dfp<-df[df$pesot<=600&df$pesot>=200,]
nrow(dfp)*100/nrow(df)

#10
dfch<-df[df$centro=="Chiloé",]
nrow(dfch)*100/nrow(df)

#1
library("readxl")
ens<-read_excel(file.choose())
sum(ens$EDAD==21)

#2
mean(ens$COLES)

#3
sd(ens$PESO)

#4
sum(ens$HDL>40)

#5
ens_tgd<-ens[ens$TGD<=200 & ens$TGD>=120,]
nrow(ens_tgd)

#6
ensp<-ens[ens$PESO<60,]
nrow(ensp)*100/nrow(ens)

#7
ensf<-ens[ens$FUMADOR==1,]
nrow(ensf)*100/nrow(ens)

#8
ensh<-ens[ens$SEXO==1,]
mean(ensh$GLUBASAL)

#9
ensv<-ens[ens$REGION==5,]
mean(ensv$PESO)

#10
ensc<-ens[ens$HDL & ens$LDL,]
sum(ensc$HDL<ensc$LDL)*100/nrow(ens)

#Guía2
#1
pnorm(7,mean=5.6,sd=1.4)

#2
pexp(6,rate = 0.4)-pexp(3,rate=0.4)

#3
ppois(8,lambda=7)-ppois(4,lambda=7)

#4
dbinom(6,size=10,prob=0.3)

#5
1-pgeom(10,prob=0.3)

#1
pcr<-read.table(file.choose())
sum(pcr$V2==1)*100/nrow(pcr)

#2
pcred<-read.table(file.choose(),header=TRUE)
max(pcred$EDAD)

#3
extranjeros<-pcred[pcred$EXTRANJERO==1,]
sum(extranjeros$PCR==1)*100/nrow(extranjeros)

#4
sum(pcred$EDAD<=40)*100/nrow(pcred)

#5
pcrede<-pcred[pcred$PCR==1,]
min(pcrede$EDAD)

#6
pcred50<-pcred[pcred$EDAD==59,]
sum(pcred50$PCR==1)

#Ensayo
#3
2+2
2*sqrt(2)
60+10-100

#4
sum(sqrt(8:32)/(1+sqrt(8:32)))

#5
pnorm(7,mean=5.6,sd=1.4)

#6
library("readxl")
ba<-read_excel(file.choose())

mean(ba$Velocidad)

#7
bai<-ba[ba$Ciudad=="Illapel",]
mean(bai$Velocidad)

#8
bao<-ba[ba$Ciudad=="Osorno",]
sd(bao$Velocidad)

#9
baa<-ba[ba$Ciudad=="Arauco",]
vm<-max(baa$Velocidad)
fm<-baa[baa$Velocidad==vm,]
fm$Operador

#10
bac<-ba[ba$Operador=="C",]
baw<-ba[ba$Operador=="W",]
sum(bac$Velocidad>baw$Velocidad)
