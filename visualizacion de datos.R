##GGPLOT
# ggplot(df), dataframe
# aes() donde  e Y se especifican en el dataset
library(ggplot2)
head(diamonds)  
ggplot(diamonds, aes(x=carat, y=price)) + geom_point() + geom_smooth() 

#Graficas en forma radar
library(fmsb)
data<-diamonds[c(1:1), -(1:4)]
data=rbind(rep(400,5) , rep(0,5) , data)

#Radar
radarchart(data)

#Página que contiene gran cantidad de graph como ejemplo
  #https://www.r-graph-gallery.com/
