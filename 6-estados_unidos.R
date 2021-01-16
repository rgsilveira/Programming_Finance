## ----setup, include = FALSE-------------------------------------------------------------------------------------------
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


## ----state.x77--------------------------------------------------------------------------------------------------------
data(state.x77)

# use help(state.x77) para conhecer os detalhes dos dados
head(state.x77)


## ----estados----------------------------------------------------------------------------------------------------------

estados <- data.frame(state.x77) 
estados$dens.pop <- estados$Population / estados$Area
media.renda <- mean(estados$Income)
sd.renda <- sd(estados$Income)

# para tornar o dataframe menor
estados <- subset(estados, select = -c(Population, Illiteracy, Murder, HS.Grad, Frost, Area))

# criemos um fator
estados$classe.renda <- factor(ifelse(estados$Income <= (media.renda - sd.renda), 'D',
                                      ifelse(estados$Income > (media.renda + sd.renda), 'A', 'BC')), 
                               levels = c('D', 'BC', 'A'),
                               labels = c('D', 'BC', 'A'),
                               ordered = TRUE)

head(estados)



## ----r.base-----------------------------------------------------------------------------------------------------------
summary(estados)

# agrupando por classe.renda, utilizando a função 'by()'
by(estados, estados$classe.renda, summary)


## ----Hmisc------------------------------------------------------------------------------------------------------------
Hmisc::describe(estados)


## ----pastecs----------------------------------------------------------------------------------------------------------
pastecs::stat.desc(estados)


## ----psych------------------------------------------------------------------------------------------------------------
psych::describe(estados)

# use esta função
psych::describeBy(estados, estados$classe.renda)

# o parâmetro " mat” permite produzir a seguinte matriz 

psych::describeBy(estados, estados$classe.renda, mat = TRUE)


## ----skimr------------------------------------------------------------------------------------------------------------
library(skimr)


## ----skim_with, include = FALSE---------------------------------------------------------------------------------------
skim_with(integer = list(hist = NULL))


## ----skim-------------------------------------------------------------------------------------------------------------
skim(estados)

# Utilizando o "pipe"
library(dplyr)
group_by(estados, classe.renda) %>%
  skim()


## ----summarytools-----------------------------------------------------------------------------------------------------
library(summarytools)
summarytools::descr(estados)

# ou utilize
dfSummary(estados)


## ----cov.estados------------------------------------------------------------------------------------------------------

estados <- estados[, -ncol(estados)]
cov(estados)
cor(estados)

#install.packages("corrgram")
#install.packages("corrplot")
#install.packages("PerformanceAnalytics")

library(corrgram)
corrgram(estados)

library(corrplot)
# o detalhe

corrplot(cor(estados), method = "shade")
#altere o method para "square", "ellipse", "number", "shade", "color", "pie”

#Alternativamente, uma visão mais interessante:
library(PerformanceAnalytics)
chart.Correlation(estados, histogram = TRUE, pch = 19)

# com todos os dados da matriz state.x77 (menos a Area)

chart.Correlation(state.x77[, -8], histogram = TRUE, pch = 19)


