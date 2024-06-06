# CRIAR DATAFRAME
install.packages("survival")
library("survival")

rotterdam
data(cancer, package = "survival")

head(rotterdam)
rotterdam$meno

rotterdam$zinc<-rnorm(n=2982)

rotterdam$size<-with(rotterdam, ifelse(
    size=="<20", "Less than 20",
    ifelse(size=="20-50", "Between 20-50",
    "More than 50")))



# OBTER MÉDIA
mean(rotterdam$age)


# OBTER MEDIANA
median(rotterdam$age)

# OBTER RANGE
range(rotterdam$age)

# SIMPLIFICANDO PARA ESTATÍSTICA DESCRITIVA
#aggregate(rotterdam$age, list(rotterdam$size)),

## PLOTAR GRÁFICOS SIMPLES
# GRÁFICO DE DISPERSÃO
plot((rotterdam$pgr))

plot(rotterdam$age)

# HISTOGRAMAS
hist(rotterdam$pgr)

hist(rotterdam$er)

hist(rotterdam$age)


# TESTES
