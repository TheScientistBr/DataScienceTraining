'R é uma linguagem computacional que permite que usuário
programe algoritmos e utilize ferramentas que foram
programadas por outras pessoas

Zuur et. al. (2009) A Beginner’s Guide to R. Use R! Springer'



# Iniciando 
'Em cada caso, uma expressão matemática é inserida, avalida e o
resultado da operação é impresso na tela.
'
(1 + 1/100)^100

'Note que cada resultado é precedido
por “[1]”. O prefixo [1] indica que o
resultado é o primeiro elemento do
vetor de saída.'

# qual é o valor do resto?
5 %% 2

# operações lógicas:
x <- TRUE
!x

y <- FALSE

x & y
!x & y
x & !y


'R disponibiliza diversas funções pré-programadas, tais como sin(x),
cos(x), log(x), sqrt(x), entre muitas outras.

R calcula valores numéricos com precisão elevada. Porém, está pré-programado para
representar apenas 7 dígitos significativos. Esta opção pode ser modificada utilizando
a função options(digits=x):'

exp(1)
pi
sin(pi/6)
options(digits = 16)
sin(pi/6)
'As funções floor(x) e ceiling(x) arredondam, respectivamente, para o
menor e maior número inteiro mais próximo.'
exp(2)
floor(exp(2))
ceiling(pi)

print(NaN)
print(NA)
print(Inf)
print(-Inf)
head(LETTERS,n = 3)
head(letters,n = 3)
month.abb
month.name

# Para obter detalhes a respeito da função sqrt(x), por exemplo:

?sqrt
help("sqrt")
help.search("sqrt")

'As operações anteriores mostram o resultado da avaliação de comandos
sendo impressos em tela. No entanto, um resultado pode ser armazenado
através da atribuição do valor calculado a uma variável.
'

x <- 5 + 7
x
y <- sqrt(4)
y

'Para visualizar o valor de uma variável,
basta digitar o seu nome ou os comandos
print(x) ou show(x) ou, ainda, digitando
a expressão de atribuição entre parênteses.
'

z <- x^y
z
n <- 1
(n <- n + 1)

# Ponto e vírgula (;) separa comandos distintos.

x <- 5 + 7; y <- sqrt(4)
z <- x^y
z

# O comando rm(list=ls()) remove todos os objetos da área de trabalho: 
ls()
objects()

rm(list=ls())

'A massa de dados “Iris” é provavelmente o exemplo mais famoso na literatura 
de reconhecimento de padrões. Foi publicada por Ronald Fisher em 1936
para demonstrar a técnica de Análise Discriminante Linear

Fisher, R. A. (1936). The use of multiple measurements in taxonomic problems.
Annual Eugenics, 7, Part II, 179–188.
'
URL <- "http://archive.ics.uci.edu/ml/machine-learning-databases/iris/iris.data"
iris.dat <- read.table(file = URL, sep = ",", header = FALSE)

'A função read.table() recebe os argumentos:
sep = "," : para valores separados por VÍRGULAS
sep = "\t" : para valores separados por TABULAÇÃO
sep = " " : para valores separados por ESPAÇO'

# header = TRUE : o arquivo contém nomes de variáveis na primeira linha

'Como foi dito anteriormente, R armazena informação através de objetos.
Diferentes estruturas de dados em R são representadas através de diferentes 
classes de objetos. Algumas classes comuns são:

vector         : coleção ordenada de elementos primitivos (objeto básico de R)
matrix e array : coleção “retangular” de elementos primitivos de dimensão 2, ou maior.
factor         : variável categórica
data.frame     : tabela de dados de dimensão 2.

Os elementos primitivos podem ser de vários tipos:
numeric : números reais
complex : números complexos
integer : números inteiros
character : cadeia de caracteres
logical : elementos são TRUE ou FALSE
raw     : elementos são bytes'

#Podemos verificar a classe do objeto iris.dat utilizando a função class():
class(iris.dat)

'Para visualizar partes (inicial ou final) da estrutura de dados, aplicamos as funções
head(x, n) e tail(x, n):'

head(iris.dat, n = 2) 
tail(iris.dat, n = 3)

# Primeiro, criamos um vetor com os novos nomes,
# utilizando a função c() para concatenar elementos primitivos
# (neste caso, cadeias de caracteres):
nomes <- c("Sepal.L", "Sepal.W", "Petal.L", "Petal.W", "Species")
class(nomes)

is.vector(nomes)

# Atribuimos os valores deste vetor aos nomes das colunas de iris.dat:
colnames(iris.dat) <- nomes; colnames(iris.dat)

# Para utilizar o nome das variáveis diretamente para
# acessar objetos na estrutura de dados, utilizamos a função attach():
attach(iris.dat)

# Podemos fazer agora:
unique(iris.dat$Species)

is.factor(Species)
'Criamos anteriormente um vetor de nomes para os atributos da
estrutura de dados iris.dat utilizando a função c().

Podemos criar vetores nulos, ou que contenham seqüências de números,
ou sem valores específicos: Vetor nulo:'

v1 <- c(); v1

# Vetores contendo seqüências de números:
v2 <- 1:10; v2

v3 <- seq(from = 0, to = 1, by = 0.1); v3

# Vetor contendo elementos repetidos:
v4 <- rep(NA, times = 5); v4

# Vetor com seqüência de números aleatórios:
v5 <- runif(3, min = 0, max = 1); v5

'Obter um conjunto resumido de informações estatísticas pode ser bastante útil
antes do início da análise dos dados, propriamente dita, já que permite uma
visão global da massa de dados em estudo (se existem pontos fora da curva, se
os limites para cada variável fazem sentido, etc.).

A função summary() fornece um resumo dos dados:
'
summary(iris.dat)

'Podemos também explorar a massa de dados utilizando ferramentas
gráficas simples:
'       
plot(iris.dat)

'A função hist() gera histogramas, que são úteis em representar
graficamente a distribuição dos valores nos dados analisados:'

#  Definição de parâmetros gráficos:
par(mfrow = c(2,2), lwd = 2)

# Gera histograma para Sepal.L
hist(Sepal.L)

# Adiciona média:
abline(v = mean(Sepal.L), col = "red")
hist(Sepal.W)
abline(v = mean(Sepal.W), col = "red")
hist(Petal.L)
abline(v = mean(Petal.L), col = "red")
hist(Petal.W)
abline(v = mean(Petal.W), col = "red")

'Outra representação gráfica da distribuição de valores é dada pelo
boxplot:'

'A relação y ∼ x é chamada “fórmula” em R, em que o símbolo ∼ representa
uma relação de dependência. Neste caso, estamos gerando o boxplot
para os valores da variável “Petal.L” como função da variável “Species'
 
boxplot(Petal.L ~ Species)

'Podemos escolher representar gráficamente a relação entre um único par
de variáveis:'

plot(iris.dat[c(1,3)], pch = 20, col = as.numeric(Species)) 
legend("bottomright",legend = unique(Species), col = 1:3, 
       pch = 20, inset = 0.02)

'Escolhemos apenas a 1a. e 3a. variáveis com o comando [c(1,3)].
A função as.numeric() transforma fatores em números (1, 2, 3).

Alguns parâmetros definem elementos gráficos: “pch” determina o caractere usado para
representar cada ponto do gráfico, enquanto “col” atribui uma cor.

A função legend() acrescenta a legenda no gráfico.'


'Observamos no gráfico do slide anterior que a espécie Iris-setosa se
destaca das demais. Podemos excluí-la de nossa análise da seguinte
maneira:
'
# A função which(x) retorna a posição no vetor x
# cujo resultado da avaliação vale TRUE
setosa <- which(Species == "Iris-setosa")

# Para excluir as observações da espécie Iris-setosa, fazemos:
iris.datS <- iris.dat[-setosa, ]
# O sinal “–” remove as entradas definidas pela variável “setosa”.

'Observamos anteriormente que, removendo-se as observações da espécie
Iris-setosa, que existe uma relação aproximadamente linear entre as
variáveis “Petal.L” e “Sepal.L” para as observações das outras
espécies:'

plot(Petal.L ~ Sepal.L, data = iris.datS, pch = 19)
# Note que estamos utilizando os dados "iris.datS

'Vamos agora construir um modelo de regressão linear:
Queremos estimar os parâmetros α e β.
Em R, utilizamos a função lm() para gerar um objeto da classe “lm”
(linear model). O modelo é especificado da seguinte maneira:
'

reg <- lm(Petal.L ∼ Sepal.L, data = iris.datS)

'Podemos utilizar a função summary() para obter informação a respeito
do ajuste do modelo:
'
summary(reg)

# Um objeto da classe lm possui muitos atributos.

names(reg)
names(summary(reg))
# Podemos acessar os valores de um determinado atributo utilizando o símbolo “$”:
reg$coefficients

'É possível obter alguns gráficos de diagnóstico para o modelo linear
ajustado utilizando a função plot():
'
par(mfrow = c(2,2)) # gera gráficos em uma matriz 2 × 2
plot(reg)
par(mfrow = c(1,1)) # retorna à configuração original

'Podemos adicionar a curva de regressão ao gráfico Petal.L × Sepal.L
utilizando a função abline():
'

plot(Petal.L ~ Sepal.L, data = iris.dat2)
abline(coef(reg), col = "red", lwd = 2)

'Gráficos podem ser salvos em formato PDF para serem utilizados
posteriormente, na geração de relatórios em LaTeX, por exemplo'

pdf("iris-Regressao.pdf", width = 5, height = 5, onefile = TRUE)
plot(Petal.L ~ Sepal.L, data = iris.dat2)
dev.off()

'Basta, então verificar no diretório de trabalho o arquivo
“iris-Regressao.pdf” contendo o gráfico do slide anterior
É possível salvar o conteúdo da área de trabalho, para utilizar
posteriormente, através dos comandos save.image() e save().'

# Para salvar todos os objetos na área de trabalho:
save.image(file = "iris-Ex.Rdata")

# Para especificar os objetos a serem salvos:
save(reg, file = "iris-Reg.Rdata")

# Cada um destes arquivos será salvo no diretório de trabalho em que R foi iniciado.
# Para verificar o diretório de trabalho (“working directory”):
getwd()

# Para modificar o diretório de trabalho:

setwd()

# Para carregar um objeto salvo previamente:
load(file = "iris-Ex.Rdata")




