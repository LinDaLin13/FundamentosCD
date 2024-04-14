library(ggplot2)
library(dplyr)

#importamos lo datos de los estudiantes 
df <-  read.csv("C:\\Users\\USER\\Downloads\\Datos act 3 .csv", sep = ';')


#se borran datos vacios
df <- na.omit(df)

#se eliminan caracteres especiales de la tabla
df <- df %>%
  mutate(Ciudad = iconv(Ciudad, to = "ASCII//TRANSLIT"))


#se modifican los vacios creados y se añde la cuidad Bogota
df <- df %>%
  mutate(Ciudad = replace(na_if(Ciudad, ""), is.na(Ciudad), "Bogota"))


df$Estatura <- gsub(",","",df$Estatura) 

# Convertir la columna Estatura a tipo numérico
df$Estatura <- as.numeric(df$Estatura)

# Multiplicar por 10 los datos menores a 100 en la columna Estatura
df <- df %>%
  mutate(Estatura = ifelse(Estatura < 100, Estatura * 10, Estatura))


print(df)


#/////////////////////////////////////////////////////////////////////////////////////////////////////////

#1)Realizar una tabla de frecuencias absolutas y otra de frecuencias relativas para la
#variable Calificación. Almacena las tablas anteriores en dos variables y llámalas
#absolutas y relativas.
#/////////////////////////////////////////////////////////////////////////////////////////////////////////


# Calcular la tabla de frecuencias absolutas para la variable Calificación
absolutas <- table(df$Nota)
print(absolutas) 


#calcular la tabla de frecuencias relativas para la variable nota.
relativas <- prop.table(table(df$Nota))
relativas

#/////////////////////////////////////////////////////////////////////////////////////////////////////////

#2. Representar la variable ciudad mediante un diagrama de barras y un diagrama de
#sectores. Incluye un título adecuado para cada gráfico y colorea las barras y los
#sectores de colores diferentes.

#/////////////////////////////////////////////////////////////////////////////////////////////////////////


# Diagrama de barras
barras <- ggplot(df, aes(x = Ciudad, fill = Ciudad)) +
  geom_bar() +
  labs(title = "Diagrama de Barras - Ciudad") +
  theme_minimal()

barras


#Diagrama por sectores
sectores <- ggplot(df , aes(x = "", fill = Ciudad)) +
  geom_bar(width = 1) +
  coord_polar(theta = "y") +
  labs(title = "Diagrama de Sectores - Ciudad") +
  theme_void()

sectores
#/////////////////////////////////////////////////////////////////////////////////////////////////////////

#3Para la variable Edad, realizar un histograma y un diagrama de caja y bigotes
#considerando la opción range = 1.5. Incluye un título apropiado para cada gráfico y
#colorea las barras del histograma de color amarillo. ¿Existe algún valor atípico en
#esta variable? Reduce el valor del argumento range hasta 0.5. ¿Varían las
#conclusiones?

#/////////////////////////////////////////////////////////////////////////////////////////////////////////

histograma_1_5 <- ggplot(df, aes(x = Edad, fill = "Edad")) +
  geom_histogram(binwidth = 1, color = "black", fill = "yellow") +
  labs(title = "Histograma de Edad (Range = 1.5)", x = "Edad", y = "Frecuencia") +
  theme_minimal()

histograma_1_5


#se ccrea la caja de vigore con rango 1.5
caja_bigotes_1_5 <- ggplot(df, aes(x = "", y = Edad, fill = "Edad")) +
  geom_boxplot() +
  labs(title = "Diagrama de Caja y Bigotes de Edad (Range = 1.5)", y = "Edad") +
  theme_minimal()

caja_bigotes_1_5
#/////////////////////////////////////////////////////////////////////////////////////////////////////////

#4. Realizar un resumen de la variable Puntuación mediante la orden summary.
#Comprueba que las medidas que proporciona summary coinciden con las medidas
#calculadas de forma individual usando su función específica.

#/////////////////////////////////////////////////////////////////////////////////////////////////////////

summary(df)
  
mean(df$Nota)
median(df$Nota)
min(df$Nota)
max(df$Nota)
quantile(df$Nota, probs = c(0.25, 0.5, 0.75))



summary(df$Estatura)


# Calcular la estatura media
mean(df$Estatura)

# Calcular la desviación estándar
sd(df$Estatura)

# Calcular el rango intercuartílico
IQR(df$Estatura)


