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

financ <- read.csv("Dados/constituents-financials_csv.csv") 

# verifica se há na's
apply(is.na(financ), 2, sum) 

str(financ)

names(financ)
head(financ, 2)

2:4

c(2:4)

financ[2:4, ]


unique(financ$Sector)

# primeiro, com o R base
financ[(financ$EBITDA > 2e10) & (financ$Sector == "Information Technology"), 
       c('Symbol', 'Name', 'EBITDA')]

# utilizando dplyr
library(dplyr)
financ %>% 
    filter((EBITDA > 2e10) & (Sector == "Information Technology"))  %>% 
    select(Symbol, Name, EBITDA)

financ %>% 
    subset((Symbol == "ACN" | Symbol == "APTV") & 
           (Sector == "Consumer Discretionary" | Sector == "Industrials"),
           select = c(Name, Sector))

head(financ$Sector, 5)

head(financ['Sector'], 5)  # note a necessidade de utilizar ''

head(financ[['Sector']], 5)

# 1 (a mais)
financ$muito.alta <- financ$Price >= 500 

# 2
financ["muito.alta"] <- financ$Price >= 500

# incomum, mas também funciona, pois as colunas dos data frames podem ser tratadas como listas
financ[["muito.alta"]] <- financ$Price >= 500

# 3 
# Observe o uso da vírgula. Como estamos adicionando uma nova variável, escrevemos a expressão 
# no lado direito da vírgula. Como a variável ainda não existe, R adiciona ao quadro de dados. 


financ[,"muito.alta"] <- financ$Price >= 500

financ <- financ %>% 
    mutate(muito.alta = Price >= 500)


financ %>% 
    arrange(desc(Price)) %>%
    select(Name, Sector, Price, muito.alta) %>% 
    head(8)

head(financ[order(financ$Price, decreasing = TRUE),
            c('Name', 'Sector', 'Price', 'muito.alta')], 8)

financ[, "muito.alta"] <- NULL
names(financ)

financ %>% 
    select(-c(SEC.Filings, Sector)) %>% 
    names()

names(financ)[names(financ) == "Price"] <- "Preco.acao"
names(financ)

financ <- financ %>% 
    rename(Cap.Mercado = Market.Cap)

names(financ)

rm(financ)
financ <- read.csv("constituents-financials_csv.csv")   
names(financ)

library(stringr)

financ <- financ %>% rename_at(vars(contains("Price")), 
                               funs(str_replace(., "Price", "Preco")))
names(financ)


financ <- financ %>% rename_if(is.character, funs(str_replace(., "Name", "Nome")))
names(financ)

financ <- financ %>% rename_all(funs(str_replace(., "Preco", "Price")))
names(financ)

financ %>% 
   group_by(Sector)%>% 
   summarize(EBITDA_medio = mean(EBITDA), LL.acao_medio = mean(Earnings.Share))
