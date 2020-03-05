library(rvest)
url<- "https://www.cia.gov/careers/opportunities/cia-jobs/index.html"

pagina_web<-read_html(url)

selector<-"#main > div.heading-panel > h1"
nodo<-html_node(pagina_web, selector)
nodo_texto<-html_text(nodo)
nodo_texto


selector_tabla<-"#Selector de tabla"
nodo_tabla <- html_node(pagina_web, selector_tabla)
nodo_tabla_texto <- html_table(nodo_tabla)
nodo_tabla_texto
