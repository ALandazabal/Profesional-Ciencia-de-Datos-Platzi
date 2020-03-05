res <- read.csv("C:/Users/Usuario/Desktop/Platzi/Profesional de Ciencia de Datos/dataAmazon2.csv")
summary(res)

#Procesado de peso
aspiradoras<-as.data.frame(res)

#Convert a field
aspiradoras$peso<-as.character(aspiradoras$peso)
aspiradoras$peso<-gsub(" Kg", "", aspiradoras$peso)
aspiradoras$peso<-gsub(",", ".", aspiradoras$peso)
aspiradoras$peso<-gsub("-1",NA, aspiradoras$peso)
aspiradoras$peso<-as.numeric(aspiradoras$peso)

#Get mean
pesomedio<-mean(aspiradoras$peso, na.rm=TRUE)
pesomedio

#Change a value
aspiradoras$peso[is.na(aspiradoras$peso)]<-pesomedio
hist(aspiradoras$peso)
summary(aspiradoras$peso)

#Procesado de volumen
aspiradoras$volumen<-as.character(aspiradoras$volumen)
aspiradoras$volumen<-gsub(" litros", "", aspiradoras$volumen)
aspiradoras$volumen<-gsub("-1",NA, aspiradoras$volumen)
aspiradoras$volumen<-as.numeric(aspiradoras$volumen)
volumenmedio<-mean(aspiradoras$volumen, na.rm=TRUE)
aspiradoras$volumen[is.na(aspiradoras$volumen)]<-volumenmedio
hist(aspiradoras$volumen)


#Siguiente parametro numero de opiniiones
str(aspiradoras$opiniones)
#Convertimos a char para procesar
aspiradoras$opiniones<-as.character(aspiradoras$opiniones)
aspiradoras$opiniones<-gsub("valoraciones", "", aspiradoras$opiniones)
aspiradoras$opiniones<-gsub("opinión de cliente", "", aspiradoras$opiniones)
aspiradoras$opiniones<-gsub(",", "", aspiradoras$opiniones)
aspiradoras$opiniones<-as.numeric(aspiradoras$opiniones)
aspiradoras$opiniones[is.na(aspiradoras$opiniones)] <- mean(aspiradoras$opiniones, na.rm = TRUE)
hist(aspiradoras$opiniones)
boxplot(aspiradoras$opiniones)


#Siguiente parametro numero de precio
str(aspiradoras$precio)
#Convertimos a char para procesar
aspiradoras$precio<-as.character(aspiradoras$precio)
aspiradoras$precio<-gsub("???", "", aspiradoras$precio)
aspiradoras$precio<-gsub("€", "", aspiradoras$precio)
aspiradoras$precio<-gsub(",", ".", aspiradoras$precio)
#Eliminamos el ultimo character
aspiradoras$precio<-str_sub(aspiradoras$precio, 1, str_length(aspiradoras$precio)-1)
aspiradoras$precio<-as.numeric(aspiradoras$precio)
aspiradoras$precio[is.na(aspiradoras$precio)] <- mean(aspiradoras$precio, na.rm = TRUE)
hist(aspiradoras$precio)
boxplot(aspiradoras$precio)

str(aspiradoras$potencia)
#Convertimos a char para procesar
aspiradoras$potencia<-as.character(aspiradoras$potencia)
aspiradoras$potencia<-gsub("watt_hours", "", aspiradoras$potencia)
aspiradoras$potencia<-gsub("vatios", "", aspiradoras$potencia)
aspiradoras$potencia<-gsub("-1", NA, aspiradoras$potencia)
aspiradoras$potencia<-as.numeric(aspiradoras$potencia)
pmean<-mean(aspiradoras$potencia, na.rm = TRUE)
aspiradoras$potencia[is.na(aspiradoras$potencia)] <- pmean

library(stringr)
aspiradoras$dimensiones<-as.character(aspiradoras$dimensiones)
aspiradoras$dimensiones<-gsub("cm", "", aspiradoras$dimensiones)
aspiradoras$dimensiones<-gsub(",", ".", aspiradoras$dimensiones)
dimen<-str_split_fixed(aspiradoras$dimensiones,"x", 3)

#cbind para unir columnas
res_limpio<-cbind(aspiradoras, dimen)
res_limpio<-res_limpio[,-4]

#Change names of a column
colnames(res_limpio)[8]<-"Altura"