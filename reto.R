library(rvest)
url<-"https://www.laliga.com/laliga-santander/clubes"


library(stringr)
pag<-"#__next > div:nth-child(2) > div.styled__ClubsWrapper-sc-1el5vkx-1.dHwnXs > div.styled__ClubsContainer-sc-1el5vkx-0.eManki.styled__ContainerMax-ujqhyo-0.dIbAc > div > div:nth-child(1)"
lista_clubs<-c(1:20)
pagL<-character() 
for( val in lista_clubs ){
  val
  pagL[val]<-str_replace_all(pag, "nth-child(1)", "val")
}