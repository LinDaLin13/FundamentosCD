library(ggplot2)


g1 <- read.csv("C:\\Users\\USER\\Documents\\grupo 1.csv", sep = ';', encoding = "UTF-8")


g2 <- read.csv("C:\\Users\\USER\\Documents\\grupo 2.csv", sep = ';', encoding = "UTF-8")



#/////////////////////////////////////////////////////////////////////////////////////////////////////////
#1Representar la variable Grupo Sanguíneo mediante un diagrama de sectores en
#cada uno de los grupos. Incluir un título descriptivo en cada gráfico y colorear los
#sectores de azul, amarillo, rosa y verde.
#/////////////////////////////////////////////////////////////////////////////////////////////////////////


grupo_counts <- table(g1$Grupo.Sanguineo)


# Colores para cada grupo sanguíneo
colores <- c("#3366CC", "#FFD700", "#FF69B4", "#228B22")  # Azul, Amarillo, Rosa, Verde

df <- data.frame(grupo = names(grupo_counts), count = as.numeric(grupo_counts))

# Crear el gráfico de sectores con ggplot2
ggplot(df, aes(x = "", y = count, fill = grupo)) +
  geom_bar(width = 1, stat = "identity", color = "black", size = 1.5, position = "fill") +
  coord_polar(theta = "y") +
  scale_fill_manual(values = colores) +
  labs(title = "Distribución de Grupo Sanguíneo") +
  theme_void() +
  theme(legend.position = "bottom",
        panel.border = element_rect(color = "black", fill = NA, size = 2),
        plot.title = element_text(hjust = 0.5, size = 16, face = "bold", margin = margin(b = 20)),
        plot.margin = margin(10, 10, 10, 10, unit = "pt"),
        plot.background = element_rect(fill = "white", color = "black", size = 1.5),
        panel.grid.minor = element_blank(),
        plot.caption = element_text(hjust = 0.5, size = 12, margin = margin(t = 10)))


grupo_counts1 <- table(g1$Grupo.Sanguineo)


# Colores para cada grupo sanguíneo
colores <- c("#3366CC", "#FFD700", "#FF69B4", "#228B22")  # Azul, Amarillo, Rosa, Verde

df1 <- data.frame(grupo = names(grupo_counts1), count = as.numeric(grupo_counts1))

# Crear el gráfico de sectores con ggplot2
ggplot(df1, aes(x = "", y = count, fill = grupo)) +
  geom_bar(width = 1, stat = "identity", color = "black", size = 1.5, position = "fill") +
  coord_polar(theta = "y") +
  scale_fill_manual(values = colores) +
  labs(title = "Distribución de Grupo Sanguíneo") +
  theme_void() +
  theme(legend.position = "bottom",
        panel.border = element_rect(color = "black", fill = NA, size = 2),
        plot.title = element_text(hjust = 0.5, size = 16, face = "bold", margin = margin(b = 20)),
        plot.margin = margin(10, 10, 10, 10, unit = "pt"),
        plot.background = element_rect(fill = "white", color = "black", size = 1.5),
        panel.grid.minor = element_blank(),
        plot.caption = element_text(hjust = 0.5, size = 12, margin = margin(t = 10)))
grupo_counts <- table(g1$Grupo.Sanguineo)





grupo_counts2 <- table(g2$Grupo.Sanguineo)


df2 <- data.frame(grupo = names(grupo_counts2), count = as.numeric(grupo_counts2))

# Crear el gráfico de sectores con ggplot2
ggplot(df2, aes(x = "", y = count, fill = grupo)) +
  geom_bar(width = 1, stat = "identity", color = "black", size = 1.5, position = "fill") +
  coord_polar(theta = "y") +
  scale_fill_manual(values = colores) +
  labs(title = "Distribución de Grupo Sanguíneo") +
  theme_void() +
  theme(legend.position = "bottom",
        panel.border = element_rect(color = "black", fill = NA, size = 2),
        plot.title = element_text(hjust = 0.5, size = 16, face = "bold", margin = margin(b = 20)),
        plot.margin = margin(10, 10, 10, 10, unit = "pt"),
        plot.background = element_rect(fill = "white", color = "black", size = 1.5),
        panel.grid.minor = element_blank(),
        plot.caption = element_text(hjust = 0.5, size = 12, margin = margin(t = 10)))



#/////////////////////////////////////////////////////////////////////////////////////////////////////////
#2. Representar la variable Estatura mediante un histograma en cada uno de los grupos.
#/////////////////////////////////////////////////////////////////////////////////////////////////////////



histograma_gr1 <- ggplot(g1, aes(x = Estatura)) +
  geom_histogram(fill = "skyblue", color = "black", bins = 10) +
  labs(title = "Histograma de Estatura - Grupo 1", x = "Estatura", y = "Frecuencia") +
  theme_minimal()

# Histograma para el grupo 2
histograma_gr2 <- ggplot(g2, aes(x = Estatura)) +
  geom_histogram(fill = "lightgreen", color = "black", bins = 10) +
  labs(title = "Histograma de Estatura - Grupo 2", x = "Estatura", y = "Frecuencia") +
  theme_minimal()

# Mostrar los histogramas
print(histograma_gr1)
print(histograma_gr2)

#/////////////////////////////////////////////////////////////////////////////////////////////////////////
#3. ¿Existe algún dato atípico en la variable Edad en el grupo A? ¿Y en el grupo B?
#/////////////////////////////////////////////////////////////////////////////////////////////////////////


# Crear diagrama de caja para Grupo 1 - Edad
boxplot_edad_g1 <- ggplot(g1, aes(x = "", y = Edad)) +
  geom_boxplot(fill = "skyblue") +
  labs(title = "Diagrama de Caja - Grupo 1 - Edad", x = "", y = "Edad") +
  theme_minimal()

# Crear diagrama de caja para Grupo 2 - Edad
boxplot_edad_g2 <- ggplot(g2, aes(x = "", y = Edad)) +
  geom_boxplot(fill = "lightgreen") +
  labs(title = "Diagrama de Caja - Grupo 2 - Edad", x = "", y = "Edad") +
  theme_minimal()

# Mostrar los diagramas de caja
print(boxplot_edad_g1)
print(boxplot_edad_g2)


#se observa que no hay datos atipicos (outliers) que afenten las mediciones

#/////////////////////////////////////////////////////////////////////////////////////////////////////////

#4. ¿Cuál es el valor máximo del 40% de las estaturas más pequeñas de los individuos
#en el grupo 1? ¿Y el valor mínimo del 30% de las estaturas mayores de los
#individuos en el grupo 2?

#/////////////////////////////////////////////////////////////////////////////////////////////////////////

# Ordenar las estaturas de menor a mayor en el Grupo 1 y Grupo 2
estaturas_gr1_ordenadas <- sort(g1$Estatura, na.last = TRUE)
estaturas_gr2_ordenadas <- sort(g2$Estatura, na.last = TRUE)


# Calcular el valor máximo del 40% de las estaturas más pequeñas en el Grupo 1
maximog1 <- quantile(estaturas_gr1_ordenadas, 0.4, na.rm = TRUE)

# Calcular el valor mínimo del 30% de las estaturas mayores en el Grupo 2
minimog2 <- quantile(estaturas_gr2_ordenadas, 0.7, na.rm = TRUE)


maximog1
minimog2

#/////////////////////////////////////////////////////////////////////////////////////////////////////////
#5. ¿Dónde son las variables edad y estatura más homogéneas: en el grupo A o en el B?
#/////////////////////////////////////////////////////////////////////////////////////////////////////////


hist(g1$Edad)

hist(g2$Edad)


hist.default(g1$Estatura)
hist(g2$Estatura)

#/////////////////////////////////////////////////////////////////////////////////////////////////////////

#6. ¿En qué grupo presentan los individuos una altura media mayor? ¿En qué grupo
#presentan los individuos una altura mediana menor?
#/////////////////////////////////////////////////////////////////////////////////////////////////////////




#/////////////////////////////////////////////////////////////////////////////////////////////////////////

#7. Estudia la asimetría y la curtosis de la variable Estatura en el grupo A.

#/////////////////////////////////////////////////////////////////////////////////////////////////////////






#/////////////////////////////////////////////////////////////////////////////////////////////////////////

#8. Finalmente se espera que el grupo presente las conclusiones a las que puede llegar
#con el desarrollo del tal

#/////////////////////////////////////////////////////////////////////////////////////////////////////////



