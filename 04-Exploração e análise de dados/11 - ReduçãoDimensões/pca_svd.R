'Nesta unidade, mostraremos como realizar a análise de 
componentes principais (PCA) e a decomposição de valores 
singulares (SVD) em R, e como os dois estão relacionados 
uns aos outros.
'

library(devtools) 
library(rafalib)

# install_github('dagdata','genomicsclass')

library(dagdata)
data(tissuesGeneExpression)
group <- as.fumeric(tab$Tissue)


'Em primeiro lugar, a análise de componente principal 
típica nas amostras seria transpor os dados de modo que 
as amostras fossem linhas da matriz de dados. A função 
prcomp pode ser usada para retornar os componentes principais 
e outras variáveis.
'

x <- t(e) # Matrix Transpose
pc <- prcomp(x) #Principal Components Analysis

names(pc)
plot(pc$x[, 1], pc$x[, 2], col = group, main = "PCA", 
     xlab = "PC1", ylab = "PC2")


'Este PCA é equivalente a realizar o SVD nos dados centrados, 
onde a centralização ocorre nas colunas (aqui nos genes). 
Podemos usar a função de varredura para executar operações 
arbitrárias nas linhas e colunas de uma matriz. O segundo 
argumento especifica que queremos operar nas colunas 
(1 seria usado para linhas), eo terceiro e quarto argumentos 
especificam que queremos subtrair os meios de coluna.
'
cx <- sweep(x, 2, colMeans(x), "-") # Sweep out Array Summaries
sv <- svd(cx)
names(sv)
plot(sv$u[, 1], sv$u[, 2], col = group, 
     main = "SVD", xlab = "U1", ylab = "U2")


'Assim, as colunas de U do SVD correspondem às componentes
principais x no PCA. Além disso, a matriz V do SVD é equivalente 
à matriz de rotação retornada por prcomp.
'
sv$v[1:5, 1:5]
pc$rotation[1:5, 1:5]

'Os elementos diagonais de D do SVD são proporcionais aos 
desvios padrão devolvidos pelo PCA. A diferença é que os desvios 
padrão de prcomp são desvios-padrão da amostra (prcomp retorna 
estimativas parciais da variância da amostra, então com a 
correção n / (n-1) n / (n-1)). Os elementos de D são formados 
tomando a soma dos quadrados dos componentes principais, mas não 
dividindo pelo tamanho da amostra.'

head(sv$d^2)
head(pc$sdev^2)
head(sv$d^2/(ncol(e) - 1))

head(sv$d^2/pc$sdev^2)

'Ao dividir as variâncias pela soma, obtemos um gráfico 
da razão de variância explicada por cada componente principal
'
plot(sv$d^2/sum(sv$d^2), xlim = c(0, 15), type = "b",
    pch = 16, xlab = "principal components", 
    ylab = "variance explained")


plot(sv$d^2/sum(sv$d^2), type = "b", pch = 16, 
     xlab = "principal components", 
     ylab = "variance explained")

'Note que, não centralizar os dados antes de executar o svd 
resulta em um gráfico ligeiramente diferente:
'
svNoCenter <- svd(x)
plot(pc$x[, 1], pc$x[, 2], col = group, 
     main = "PCA", xlab = "PC1", ylab = "PC2")
points(0, 0, pch = 3, cex = 4, lwd = 4)


plot(svNoCenter$u[, 1], svNoCenter$u[, 2], col = group, main = "SVD not centered", 
     xlab = "U1", ylab = "U2")

'Finalmente, mostramos que o SVD na matriz de dados onde 
as amostras são colunas - como usado na Análise de Variáveis 
Substitutas SVA - é equivalente ao SVD na matriz de dados 
onde as amostras são linhas, se nenhuma centralização tiver sido feita.
'
sv2 <- svd(t(e))
plot(sv2$u[, 1], sv2$u[, 2], col = group, main = "samples vs genes (typical PCA)", 
     xlab = "U1", ylab = "U2")

sv1 <- svd(e)
plot(sv1$v[, 1], sv1$v[, 2], col = group, main = "genes vs samples (SVA)", xlab = "V1", 
     ylab = "V2")

'A questão de qual direção ao centro depende de qual o 
foco da análise é. Para comparar as distâncias da amostra, 
como no gráfico típico de PCA, as linhas são amostras e os 
genes são centrados. Para encontrar genes que contribuem para 
lote, como no modelo SVA, as linhas são genes e as amostras são 
centradas
'