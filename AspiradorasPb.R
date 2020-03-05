

campos<-as.vector(data[1,])
midist<-matrix(0, ncol=8, nrow=8)
for(i in 1:8){
  c<-dist(x=c(campos[1], mycluster$centers[,1]))

  b<-as.matrix(c)
  distancia<-b[-1,1]
  midist[i,]<-distancia
}

rownames(midist)<-c("Volumen","Precio", "Opiniones", "Peso", "Potencia","alto", "ancho","profundida")
midist

dist_total<-apply(midist,2,sum)

#Quién tiene la menor distancia
num_cluster<-which.min(dist_total)