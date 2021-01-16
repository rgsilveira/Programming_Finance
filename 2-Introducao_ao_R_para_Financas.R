knitr::opts_chunk$set(
  echo = TRUE,
  comment = "#>",
  collapse = TRUE
)

klippy::klippy(
  position = c("top", "right"),
  color = "auto",
  tooltip_message = "Copia o código",
  tooltip_success = "Copiado!"
)

# Adição
3 + 5

# Subtração
5 - 3

# Multiplicação
3 * 4

# Divisão
4 / 2

# Exponenciação
2^4

# Módulo
7%%3

economia <- 200

# imprime o valor de economia no console
economia

meu_dinheiro <- 100
seu_dinheiro <- 200

# Adiciona os 'dinheiros' e salva na variável 'nosso_dinheiro'
(nosso_dinheiro <- meu_dinheiro + seu_dinheiro)

# caixa inicial e 5% de retorno em janeiro
caixa_inicial <- 200
ret_jan <- 0.05  # utilize pontos, não vírgulas, para números decimais
indice_jan <- 1 + ret_jan

# qual é o caixa ao final do mês?
(pos_caixa_jan <- caixa_inicial * indice_jan)

# retorno de fevereiro = 4.5%
ret_fev <- 4.5/100
indice_fev <- 1 + ret_fev

# caixa total ao final dos dois meses
caixa_total <- caixa_inicial * indice_jan * indice_fev
caixa_total

# O valor da ação da Apple é !numeric!
apple_stock <- 208.38

# Credit ratings são characters
credit_rating <- "AAA"

# Você gosta do mercado de capitais? TRUE ou FALSE?
resposta <- TRUE
resposta

# Um vetor numérico
AMBEV_stock <- c(14.16, 14.19, 13.824)

# Um vetor de caracteres
financas <- c("ações", "Fundos", "Carteiras")

# Um vetor lógico
logico <- c(TRUE, FALSE, TRUE)

# vetor com 12 meses de retorno e nomes dos meses
ret <- c(5, 2, 3, 7, 8, 3, 5, 9, 1, 4, 6, 3)
meses <- c("Jan", "Fev", "Mar", "Abr", "Mai", "Jun", "Jul", "Ago", "Set", "Out", "Nov", "Dez")

# Adiciona os nomes ao vetor ret
names(ret) <- meses

# veja como ficou
ret


# Gráfico dos pontos
plot(ret, col = 'blue')

# Pesos e retornos
ret_microsoft <- 7/100
ret_sony <- 9/100
peso_microsoft <- .2
peso_sony <- .8

# Retorno da carteira
(ret_carteira <-ret_microsoft * peso_microsoft + ret_sony * peso_sony)

# Pesos, retornos e nomes das companhias
ret_comp <- c(ret_microsoft, ret_sony)
pesos <- c(peso_microsoft, peso_sony)
companhias <- c("Microsoft", "Sony")

# Dê nomes aos dados nos vetores
names(ret_comp) <- companhias
names(pesos) <- companhias

# Multiplique os vetores 
retxpesos <- ret_comp*pesos
retxpesos

# Some para obter o retorno da carteira
(ret_carteira <- sum(retxpesos))


ret 
ret[1:6]

# Somente março e maio
meses1 <- c("Mar", "Mai")

ret[meses1]

# Omitindo o primeiro mês
ret[-1]
## Sony 
 
class("Mai")

meu_vetor <- c(1, 2, 3, 4, 5, 6, 7, 8, 9)

# matrix 3x3 
minha_matriz <- matrix(data = meu_vetor, nrow = 3, ncol = 3)
minha_matriz

# Usando byrow = TRUE
matrix(data = c(2, 3, 4, 5), nrow = 2, ncol = 2, byrow = TRUE)

apple <- c(109.49, 109.90, 109.11, 109.95, 111.03)
ibm <- c(159.82, 160.02, 159.84, 160.35, 164.79)
micr <- c(59.20, 59.25, 60.22, 59.95, 61.37)

# cbind (como colunas) os vetores
cbind_acoes <- cbind(apple, ibm, micr)
cbind_acoes

# rbind (por linhas) os vetores
rbind_acoes <- rbind(apple, ibm, micr)
rbind_acoes

# Define matrix
apple_micr_matrix <- cbind(apple, micr)
apple_micr_matrix

# Gráfico de dispersão de Microsoft vs Apple
plot(apple_micr_matrix, main = 'Microsoft vs Apple', col = "red")

# Correlação entre Apple e IBM
cor(apple, ibm)

# matriz de ações
acoes <- cbind(apple, micr, ibm)
dim(acoes)

# cor() das três ações
cor(acoes)

# Terceira linha
acoes[3,]

# Quarta e quinta linha da coluna ibm
acoes[4:5, "ibm"]

# Todas as linhas das Colunas 'apple' e 'micr'
acoes [, c("apple","micr")]
acoes[]

# Variáveis
companhias <- c("A", "A", "A", "B", "B", "B", "B")
fluxo_caixa <- c(1000, 4000, 550, 1500, 1100, 750, 6000)
ano <- c(1, 3, 4, 1, 2, 4, 5)

# Data frame
caixa <- data.frame(companhias, fluxo_caixa, ano)

caixa

str(caixa)

# `head()` mostra as primeiras quatro linhas (padrão)
head(caixa, 4)

# `tail(, 3)` mostra as últimas três linhas
tail(caixa, 3)

# `str()` e a estrutura de seus dados
str(caixa)

novosNomes <- c("companhia", "fluxo_caixa", "ano")

colnames(caixa) <- novosNomes

colnames(caixa)

# Terceira linha, segunda coluna
caixa[3, 2]

# Quinta linha da coluna 'ano' 
caixa[5, 'ano']

# coluna 'ano'
caixa[, "ano"]

# Seleciona a coluna "fluxo_caixa" e multiplica por 2
caixa[, "fluxo_caixa"] * 2

# Apagar a coluna 'companhia'
caixa$company <- NULL
caixa

# Linhas da companhia B
subset(caixa, companhia == "B")

# Linhas com fluxo de caixa vencendo em 1 ano
subset(caixa, ano == '1')

# cenário trimestral
caixa$trimestre <- caixa$fluxo_caixa * 0.25
caixa

# Cenário bi-anual

caixa$dois_anos <- caixa$ano * 2
caixa$dois_anos <- 2
caixa

# Valor presente de $4000 em 3 anos a 5% a.a.
juros <- 5/100
anos <- 3

fluxo_caixa <- 4000

VP <- fluxo_caixa  * (1 + juros) ^ -anos
VP

caixa$vp <- caixa$fluxo_caixa  * (1 + juros) ^ -caixa$ano
# Present value of all cash flows
#cash$present_value <- present_value_4k

# Print out cash
caixa

# Total present value of cash
(total_pv <- sum(caixa$vp))

# Company B information
(caixa_B <- subset(caixa, companhia == "B"))

# Total present value of cash_B
(total_vp_B <- sum(caixa_B$vp))

# credit_rating - vetor de caracteres
credit_rating <- c("BB", "AAA", "AA", "CCC", "AA", "AAA", "B", "BB")

# Transformando em fator
credit_factor <- factor(credit_rating)

credit_factor

str(credit_rating)
str(credit_factor)

# Identifique n´veis únicos
levels(credit_factor)

# Renomeie os níveis
levels(credit_factor) <- c("2A", "3A", "1B", "2B", "3C")

credit_factor

summary(credit_rating)
summary(credit_factor)

plot(credit_factor)

# Defina rankings AAA.
AAA_rank <- c(31,  48, 100, 53, 85, 73, 62, 74, 42, 38, 97, 61, 48, 86, 44, 9, 43, 18,  62,
              38, 23, 37, 54, 80, 78, 93, 47, 100, 22,  22, 18, 26, 81, 17, 98, 4,  83, 5,
              6,  52, 29, 44, 50, 2,  25, 19, 15, 42, 30, 27)

# Crie 4 "buckets" para AAA_rank usando cut()
AAA_factor <- cut(x = AAA_rank, breaks = c(0, 25, 50, 75, 100))

# Renomeie os níveis 
niveis <- c("baixo", "médio", "alto", "muito alto")

levels(AAA_factor) <- niveis

AAA_factor

plot(AAA_factor)

# Use unique() para encontrar valores únicos
unique(credit_rating)

# Crie fatores ordenados
credit_factor_ordenado <- factor(credit_rating, ordered = TRUE, levels = c("AAA", "AA", "BB", "B", "CCC"))

# Plot credit_factor_ordered
plot(credit_factor_ordenado)

# Remova o nível A da posição 3 sem retirá-lo da variável original.
credit_factor
(novos_niveis <- credit_factor[-3])

plot(novos_niveis)

# Remova o nível A das posições 3 e 7 os retirando da variável original.
novos_niveis_2 <- credit_factor[c(-3,-7), drop = TRUE]
novos_niveis_2

plot(novos_niveis_2)

# Variáveis
credit_rating <- c("AAA", "A", "BB")
donos_titulos <- c("Zé", "Maria", "Gisele")

# Crie o data frame com vetores de caracter, os títulos
titulos <- data.frame(credit_rating, donos_titulos, stringsAsFactors = FALSE)
str(titulos)

# Crie uma coluna de fatores
titulos$credit_factor <- factor(titulos$credit_rating, ordered = TRUE, levels = c("AAA","A","BB"))
str(titulos)

# Componentes da lista
nome <- "Apple e IBM"
apple <- c(109.49, 109.90, 109.11, 109.95, 111.03)
ibm <- c(159.82, 160.02, 159.84, 160.35, 164.79)
matriz_cor <- cor(cbind(apple, ibm))

# Crie a lista
carteira <- list(nome, apple, ibm, matriz_cor)

carteira

names(carteira) <- c("nome", "apple", "ibm", "correlacao")

carteira

# Segundo e terceiro elementos da carteira
carteira[c(2,3)]

# Use $ para obter as correlações
options(digits = 4)
carteira$correlacao

# Adicione pesos: 20% Apple, 80% IBM
carteira$peso <- c(apple = .20, ibm = .80)

carteira

# Altere os pesos: 30% Apple, 70% IBM
carteira$peso <- c(apple = .30, ibm = .70)

carteira

# Remova os preços da ação da Microsoft da carteira
carteira$microsoft <- NULL

# Defina o grupo a partir do ano
grupo <- caixa$ano

# Split cash on your new grouping
caixa_div <- split(caixa, grupo)

caixa_div

# Junte de volta os dados
caixa_original <- unsplit(caixa_div, grupo)

caixa_original

matriz <- matrix(c(1,2,3,4,5,6), nrow = 2, ncol = 3)
rownames(matriz) <- c("Linha1", "Linha2")
colnames(matriz) <- c("Col1", "Col2", "Col3")
matriz

fator <- factor(c("A", "A", "B"), ordered = TRUE, levels = c("A", "B"))

# atributos da variável matriz
attributes(matriz)

# dimensão de 'matriz' 
attr(matriz, "dim")
dim(matriz) # mais simples

# atributes de 'fator'
attributes(fator)

