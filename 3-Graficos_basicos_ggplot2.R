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


## ----lib_ggplot2---------------------------------------------------------------------
library(tidyverse)  # inclui ggplot2


## ----mpg1, out.width = '80%', fig.align = 'center'-----------------------------------
data(mpg, package = 'ggplot2')
head(mpg)

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) 



## ----mpg2, out.width = '80%', fig.align = 'center'-----------------------------------
qplot(mpg$displ, mpg$hwy, geom = "point") +
  labs(title = "Dispersão", x = "displacement", y = "highway")

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, color = class))

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, size = class))


ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, alpha = class))

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, shape = class))



## ----facets, out.width = '80%', fig.align = 'center'---------------------------------

df <- mtcars
# Converte cyl para fator (grupo)

df$cyl <- as.factor(df$cyl)

ggplot(df, aes(x = wt, y = mpg)) +
  geom_point(aes(color = cyl, shape = cyl))+
  geom_smooth(aes(color = cyl, fill = cyl), 
              method = "lm", fullrange = TRUE) +
  facet_wrap(~ cyl) +
  scale_color_manual(values = c("#00AFBB", "#E7B800", "#FC4E07"))+
  scale_fill_manual(values = c("#00AFBB", "#E7B800", "#FC4E07")) +
  theme_bw()


## ----layers, out.width = '80%', fig.align = 'center'---------------------------------
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
  geom_point(mapping = aes(color = class), lwd = 4) +
  geom_smooth(data = filter(mpg, class == "suv"), se = TRUE) +
  ggtitle("Suvs")   



## ----boxplot_diamonds, out.width = '80%', fig.align = 'center'-----------------------
diamonds
ggplot(data = diamonds, mapping = aes(x=cut, y=price)) +
  geom_boxplot()

## Simples, elegante e, caso deseje enriquecer o seu trabalho:

ggplot(data=diamonds, mapping = aes(x = cut, y = price)) +
  geom_boxplot(fill = "cornflowerblue",
               color = "black", notch = TRUE)



## ----boxplot_mpg, out.width = '80%', fig.align = 'center'----------------------------
ggplot(data = mpg) +
  geom_boxplot(mapping = aes(
               x = reorder(class, hwy, FUN = median),
               y = hwy)) +
    labs(title ="Boxplot", x = "class")


## ----toothgrowth1, out.width = '80%', fig.align = 'center'---------------------------
tg <- ToothGrowth

head(ToothGrowth)

ggplot(data = tg, aes(x = dose, y = len)) +
  geom_bar(stat = "identity", fill = 'steelblue') +
  labs(title = "Bar Plot - dose de Vitamina C", 
       subtitle = "Dose de Vitamina C e Crescimento dos Dentes")



## ----toothgrowth2, out.width = '80%', fig.align = 'center'---------------------------
ggplot(data = tg, aes(x = dose, y = len)) +
  geom_bar(stat = "identity", fill = 'red') +
  labs(title = "Bar Plot - dose de Vitamina C", 
  subtitle = "Crescimento dos Dentes e dose de Vitamina C") + 
  coord_flip()



## ----toothgrowth3, out.width = '80%', fig.align = 'center'---------------------------
ggplot(data=tg, aes(x=dose, y=len, fill=supp)) +
  geom_bar(stat="identity")


## ----toothgrowth4, out.width = '80%', fig.align = 'center'---------------------------
tg1 <- ggplot(data = tg, aes(x = dose, y = len, fill = supp)) +
         geom_bar(stat = "identity", position = position_dodge())

tg1


## ----toothgrowth5, out.width = '80%', fig.align = 'center'---------------------------
tg2 <- ggplot(ToothGrowth, aes(x = factor(dose), y = len, fill = supp)) + 
          geom_boxplot() +
            ggtitle('Tamanho dos dentes por suplemento e dosagem') +
            xlab('Dosagem (mg)') +
            ylab('Comprimento (mm)') +
            guides(fill = guide_legend(title = 'tipo de suplemento'))

tg2


## ----toothgrowth6, out.width = '80%', fig.align = 'center'---------------------------
ggplot(data = ToothGrowth) +
    geom_boxplot(mapping = aes(x = supp, y = len)) +
    facet_wrap(~ dose, ncol = 3) +
    ggtitle("Tamanho dos dentes por suplemento e dosagem") 


## ----histo1, out.width = '60%', fig.align = 'center'---------------------------------
ggplot(mpg, aes(x = hwy)) + 
    geom_histogram()

ggplot(mpg, aes(x = hwy)) + 
    geom_histogram(binwidth = 5, color = "red", fill = "steelblue")



## ----fmoda---------------------------------------------------------------------------
moda <- function(v) {
  uniqv <- unique(v)
  uniqv[which.max(tabulate(match(v, uniqv)))]
}



## ----centrais, out.width = '80%', fig.align = 'center'-------------------------------
v <- diamonds$price

moda(v)
mean(v)
median(v)

ggplot(diamonds, aes(x = price, y = ..density..))  +

  geom_histogram(binwidth = 10, color = "gray", fill = "white")  +

  geom_vline(xintercept = mean(diamonds$price), color = "green", 
             linetype = "dashed", lwd = 1) +

  geom_vline(xintercept = median(diamonds$price), color = "red", 
             linetype = "dashed", lwd = 1) +

  geom_vline(xintercept = moda(diamonds$price), color = "yellow", 
             linetype = "dashed", lwd = 1) +

  geom_density(color="steelblue", lwd = 1)



## ----centrais2, out.width = '80%', fig.align = 'center'------------------------------
v <- diamonds$depth

moda(v)

median(v)

mean(v)

ggplot(diamonds, aes(x = v, y =..density..)) +
  geom_histogram(binwidth = 1, color = "grey") +
  geom_vline(xintercept = mean(v), color = "darkgreen", 
             linetype = "dashed", lwd = 1) +
  geom_vline(xintercept = median(v), color = "red", 
             linetype = "dashed", lwd = 1)+
  geom_vline(xintercept = moda(v), color = "yellow", 
             linetype = "dashed", lwd = 1) +
  geom_density(color = "steelblue", lwd = 1) +
  labs(title = "Simetria", x = "depth", y= "density")



## ----curtose-------------------------------------------------------------------------
library(e1071)       

kurtosis(diamonds$price)
kurtosis(diamonds$carat)
kurtosis(diamonds$depth)



## ----yahoo, out.width = '80%', fig.align = 'center'----------------------------------
library(quantmod)
library(BatchGetSymbols)

inicio <- as.Date("2016-01-02")
fim <- Sys.Date()

getSymbols("^GSPC", src = "yahoo", from = inicio, to = fim)

GSPC <- na.omit(GSPC)

retorno <- diff(log(Cl(GSPC))) # Cl() obtém o preço de fechamento
retorno <- na.omit(retorno)

ggplot(retorno, aes(x = retorno$GSPC.Close)) +
   geom_histogram(fill = 'steelblue')


