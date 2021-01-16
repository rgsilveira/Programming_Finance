knitr::opts_chunk$set(
  echo = TRUE, 
  warning = FALSE, 
  message = FALSE, 
#  comment = "#>",
#  collapse = TRUE,
  cache = TRUE)
options(knitr.kable.NA = '')
options("getSymbols.warning4.0" = FALSE)
#Sys.setenv(LANG = "pt")
set.seed(12345)

klippy::klippy(
  position = c("top", "right"),
  color = "auto",
  tooltip_message = "Copia o código",
  tooltip_success = "Copiado!"
)

knitr::include_graphics('Imagens/Figura 1.jpg')

x <- rnorm(10)  # leia-se x recebe rnorm(10) - cria 10 variáveis aleatórias normais(0,1)
x

knitr::include_graphics('Imagens/Tabela1.png')

idade <- c(1,3,5,2,11,9,3,9,12,3)
peso <- c(4.4,5.3,7.2,5.2,8.5,7.3,6.0,10.4,10.2,6.1) 

plot(idade, peso, main = 'Peso x Idade', col = 'red', pch = 19)

## install.packages('forecast', repos='http://cran.us.r-project.org')
## library(forecast)

## # baixa um pacote não disponível no CRAN diretamente do Github
## devtools::install_github("twitter/AnomalyDetection")

Sys.localeconv()

knitr::include_graphics('Imagens/diabetes.png')

a <- c(1, 2, 5, 3, 6, -2, 4)
b <- c("one", "two", "three")
c <- c(TRUE, TRUE, TRUE, FALSE, TRUE, FALSE)

a <-  c("k", "j", "h", "a", "c", "m")
a[3]
a[c(1, 3, 5)]
a[2:6]

y <- matrix(1:20, nrow = 5, ncol = 4)
y

cells    <- c(1, 26, 24, 68)
rnames   <- c("R1", "R2")
cnames   <- c("C1", "C2") 
mymatrix <- matrix(cells, nrow = 2, ncol = 2, byrow = TRUE, dimnames = list(rnames, cnames)) 
mymatrix

mymatrix <- matrix(cells, nrow = 2, ncol = 2, byrow = FALSE, dimnames = list(rnames, cnames))
mymatrix

dim1 <- c("A1", "A2")
dim2 <- c("B1", "B2", "B3")
dim3 <- c("C1", "C2", "C3", "C4")
z <- array(1:24, c(2,3,4), dimnames=list(dim1, dim2, dim3))
z

Paciente <- c(1, 2, 3, 4)
Idade <- c(25, 34, 28, 52)
Diabetes <- c("Tipo1", "Tipo2", "Tipo1", "Tipo1")
Status <- c("Mal", "Melhorando", "Excelente", "Mal")
df <- data.frame(Paciente, Idade, Diabetes, Status)
df

df[1:2]
df[c('Diabetes', 'Status')]
df$Idade
table(df$Diabetes, df$Status)

head(airquality) # mostra as primeiras linha do data frame
x <- airquality$Wind
y <- airquality$Temp
plot(x, y, 
     main = "Airquality", 
     xlab = "Wind", 
     ylab = "Temp F", 
     pch = 19, 
     col = "red")

#install.packages(xlsx)
xlsx::write.xlsx(df, 'meusdados1.xlsx')

# evita termos que repetir o nome do data frame 'mtcars' para designar suas variáveis
attach(mtcars)  

plot(wt, mpg)
title('Regressão de Milhas/galão vs Peso em 1000lbs')
abline(lm(mpg ~ wt))
detach(mtcars)  # o oposto de attach

#install.packages("ggplot2")
library(ggplot2)
p1 <- ggplot(mtcars, aes(x = wt, y = mpg)) +
         geom_point() +
         stat_smooth(method = lm, se = FALSE)  +
         ggtitle('Regressão de Milhas/galão vs Peso em 1000lbs')

p1

#install.packages("ggplot2")
library(ggplot2)
p2 <- ggplot(mtcars, aes(x = wt, y = mpg)) +
         geom_point() +
         stat_smooth(method = lm, se = TRUE, level = 0.99)  +
         ggtitle('Regressão de Milhas/galão vs Peso em 1000lbs')

p2

dose <- c(20,30,40,45,60)
drogaA<- c(16,20,27,40,60)
drogaB <-c(15,18,25,31,40)
df <- data.frame(dose, drogaA, drogaB)

library(kableExtra)
kable_styling(kable(df)) # Mostra a tabela com estilo

plot(dose, drogaA, 
     main = 'Resposta da droga A à dosagem', 
     type = 'b')

opar <- par(no.readonly = TRUE)
par(lty = 2, pch = 17)
plot(dose, drogaA, 
     type = 'b')


par(opar)
plot(dose, drogaA, 
     type = 'b', 
     lty = 3, 
     lwd = 3, 
     pch = 15, 
     cex = 2)

# Linha 
ggplot(data = df, aes(x = drogaA, y = drogaB)) +
  geom_line() +
  geom_point()

# Altere o tipo da linha
ggplot(data = df, aes(x = dose, y = drogaA)) +
  geom_line(linetype = "dashed", color = "blue", size = 1.2) +
  geom_point(color ="red", size = 3)


#install.packages(RColorBrewer)
library(RColorBrewer)
n <- 20
minhasCores <- topo.colors(n)
barplot(rep(1, n), col = minhasCores)

n <- 10
minhasCores <- topo.colors(n)
pie(rep(1, n), labels = minhasCores, col = minhasCores)

meusCinzas <- gray(0:n/n)
pie(rep(1, n), labels = meusCinzas, col = meusCinzas)

opar <- par(no.readonly = TRUE)
par(mfrow = c(1, 2))
plot(dose, drogaA, 
     type = 'b',
     pch = 19, 
     col = 'red')
plot(dose, drogaB, 
     type = 'b', 
     pch = 23, 
     col = 'blue', 
     bg = 'green')
par(opar)

opar <- par(no.readonly = TRUE)
par(mfrow = c(1, 2))
plot(dose, drogaA, 
     type = 'b', 
     pch = 19, 
     lty = 2,
     col = 'red',
     main = 'Droga A', col.main = 'red',
     sub = 'Testes Clínicos', col.sub = 'blue',
     xlab = 'Dose',
     ylab = 'Resposta à droga')

plot(dose, drogaB, 
     type = 'b', 
     pch = 23, 
     lty = 6,
     col = 'blue',
     bg = 'red',
     main = 'Droga B', col.main = 'blue',
     sub = 'Testes Clínicos', col.sub = 'blue',
     xlab = 'Dose',
     ylab = 'Resposta à droga')

par(opar)

ggplot(data = df) +
    geom_line(mapping = aes(y = drogaA, x = dose, color = 'drogaA'), size = 1) +
    geom_line(mapping = aes(y = drogaB, x = dose, color = 'drogaB'), size = 1) +
    xlab('Dose') + ylab('Resposta à droga') +
    ggtitle('Resposta às drogas (hipotética)') +
    scale_color_manual(values = c('drogaA' = 'darkblue', 'drogaB' = 'red')) +
    labs(color = 'Drogas')
