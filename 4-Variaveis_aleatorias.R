## ----setup, include = FALSE----------------------------------------------------------
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


## ----Fig17, echo = FALSE, out.width = '50%', fig.align = 'center', fig.cap = 'Figura 17 - Variáveis Aleatórias'----
knitr::include_graphics('Imagens/variaveis-aleatorias.png')


## ----lideranca, echo = FALSE, out.width = '50%', fig.align = 'center', fig.cap = 'Figura 18 - Notas'----
knitr::include_graphics('Imagens/lideranca.png')


## ----le_lider, warning=FALSE, message=FALSE------------------------------------------
if (!require(readxl)) {
  install.packages('readxl')
  library(readxl)
}

lider <- readxl::read_excel(here::here("Dados", "lider.xlsx"))
lider


## ----Fig19, echo = FALSE, out.width = '30%', fig.align = 'center', fig.cap = 'Figura 19 - Operadores Lógicos'----
knitr::include_graphics('Imagens/Operadores_logicos.png')


## ----lider1--------------------------------------------------------------------------
lider$idade[lider$idade == 99] <- NA


## ----lider2--------------------------------------------------------------------------
is.na(lider)


## ----lider3--------------------------------------------------------------------------
(lider <- na.omit(lider)) # os parênteses exibem a variável 


## ----colaboradores1, warning=FALSE, message=FALSE------------------------------------
df <- read.csv(here::here("Dados", "colaboradores.csv"), header = TRUE, sep = ";")

class(df)

head(df)

# outros recursos de apresentação de dados do R
library(magrittr)

df %>%
  kableExtra::kable() %>%
  kableExtra::kable_styling(bootstrap_options = c("striped", "hover", "condensed"))
     
#alterando nomes das colunas

library(gdata)

str(df)

df <- gdata::rename.vars(df, 
                        from = c("estado_civil", "grau_instrucao","n_filhos",
                                 "reg_procedencia", "idade_anos","idade_meses"), 
                        to = c("civil", "instrucao",  "filhos", "regiao", "ano", "mes"))

head(df)


# variáveis categóricas (factors) e numéricas
str(df)

summary(df)

#usando factor()

df$civil <- factor(df$civil)
df$instrucao <- factor(df$instrucao)
df$regiao <- factor(df$regiao)


## ----colab_civil---------------------------------------------------------------------

tb.civil <- table(df$civil)
tb.civil

summary(df$civil)

prop.civil <- 100 * prop.table(tb.civil)

round(prop.civil, digits = 2)


## ----colab_instrucao-----------------------------------------------------------------
tb.instrucao <- table(df$instrucao)
tb.instrucao

#verificando os percentuais
prop.instrucao <- 100 * prop.table(tb.instrucao)
round(prop.instrucao, 2)


## ----colab_regiao--------------------------------------------------------------------
tb.regiao <- table(df$regiao)
tb.regiao

#verificando os percentuais
prop.regiao <- 100 * prop.table(tb.regiao)
round(prop.regiao, 2)



## ----colab_varios--------------------------------------------------------------------
# criando uma tabela de frequencia conjuntas
(tb.conj <- table(df$civil, df$instrucao, df$regiao))
(minha_ftable <- ftable(tb.conj))

# df_ftable <- as.data.frame(minha_ftable)
# 
# df_ftable <- gdata::rename.vars(df_ftable, 
#                                 from = c("Var1", "Var2","Var3"), 
#                                 to = c("civil", "instrucao",  "regiao"))
# 
# print(df_ftable)


## ----plot_colab, out.width = '90%', fig.align = 'center'-----------------------------
# Criando graficos

par(mfrow = c(2, 3)) # 2 linhas e 3 colunas

barplot(tb.civil, col = c("red","green"), 
        main = "Estado Civil",
        xlab = "Status", 
        ylab = "frequência")

barplot(tb.instrucao, 
        col = c("red", "green", "blue"), 
        main = "Escolaridade",
        xlab = "Escolaridade", 
        ylab = "frequência")

barplot(tb.regiao, 
        col = c("grey", "darkblue", "darkred"), 
        main = "Região",
        xlab = "frequência", 
        ylab = "regiao", 
        horiz = T)

hist(df$salario, 
     col = "darkgrey",
     main = "Salário", 
     xlab = "salário", 
     ylab = "frequência")

idade <- df$ano+df$mes / 12

x <- idade
y <- df$salario

plot(x, y, 
     main = "Scatterplot idade vs salário",
     xlab = "idade", 
     ylab = "salário", 
     pch = 19, 
     frame = FALSE)

abline(lm(y ~ x, data = mtcars), col = "red", lwd = 2)


boxplot(df$salario ~ df$instrucao, 
        col = c("red","darkgreen","darkblue"),
        main = "Bloxplot", 
        xlab = "escolaridade",
        ylab = "salário")


par(mfrow = c (1, 1))


## ---- mean---------------------------------------------------------------------------
length(df$filhos)

summary(df$filhos)

mean(df$filhos)
mean(df$filhos, na.rm=TRUE)


## ----mediana-------------------------------------------------------------------------
median(df$salario, na.rm=TRUE)

summary(df$salario)


## ----tapply--------------------------------------------------------------------------
tapply(df$salario,df$civil,summary)
tapply(df$salario,df$civil,mean)


## ----moda----------------------------------------------------------------------------
# cria a função
getModa <- function(v) {
  unique_v <- unique(na.omit(v))
  unique_v[which.max(tabulate(match(v, unique_v)))]
}

# Calcula a moda
print(getModa(df$filhos))

print(getModa(as.character(df$instrucao)))

# outro maneira - informa a moda e o número casos repetidos

getModa2 <- function(v) {
  f <- table(v)
  subset(f, f == max(f))
}

print(getModa2(df$filhos))
print(getModa2(as.character(df$instrucao)))


## ----quantil-------------------------------------------------------------------------
quantile(c(df$salario),0.25)  # Q1

quantile(c(df$salario),0.50)  # Q2 -  a mediana
   
quantile(c(df$salario),0.75)  # Q3

summary(df$salario)


## ----IQ------------------------------------------------------------------------------
quantile(c(df$salario), 0.75) - quantile(c(df$salario), 0.25)

summary(df$salario)

14.060 - 7.553



## ----boxplot, out.width = '65%', fig.align = 'center'--------------------------------
boxplot(df$salario,
        main = "Boxplot - Salário em R$ mil",
        xlab = "Salário",
        ylab = "Valores em R$ mil",
        col = "orange",
        border = "brown",
        horizontal = FALSE
)



## ----boxplot2, out.width = '65%', fig.align = 'center'-------------------------------
boxplot(mpg ~ cyl, data = mtcars, 
   xlab = "Número de cilindros",
   ylab = "Milhas por galão", 
   main = "Consumo",
   notch = TRUE, 
   varwidth = TRUE, 
   col = c("green", "yellow", "purple"),
   names = c("Quatro", "Seis", "Oito")
)


## ----amplitude-----------------------------------------------------------------------
range(df$filhos, na.rm = T)       # apresenta o mínimo e o máximo do vetor

diff(range(df$filhos, na.rm = T)) # calcula a diferença


## ----var1----------------------------------------------------------------------------
var(df$salario)

var(df$filhos)
var(df$filhos, na.rm = TRUE)


## ----dp------------------------------------------------------------------------------
sd(df$filhos, na.rm=TRUE)


## ----cv------------------------------------------------------------------------------
cv.salario <- 100 * sd(df$salario) / mean(df$salario)
cv.salario


## ----skewness_salarios, out.width = '80%', fig.align = 'center'----------------------
e1071::skewness(df$salario, na.rm = TRUE, type = 3)

plot(density(df$salario), 
     main = 'Gráfico da densidade',
     xlab = 'Salários',
     ylab = 'Densidade')



## ----curtose_salarios----------------------------------------------------------------
PerformanceAnalytics::kurtosis(df$salario, method = 'excess')


## ----covar---------------------------------------------------------------------------
cov(df$ano, df$salario)

cor(df$ano, df$salario)

