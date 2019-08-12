## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  fig.path = "man/Figuras/README-",
  out.width = "100%"
)

## ----eval=FALSE----------------------------------------------------------
#  devtools::install_github('jelagmil/soccergraphR', build_opts = c("--no-resave-data", "--no-manual"))
#  library(soccergraphR)

## ----eval=FALSE----------------------------------------------------------
#  #Para que se abra en el navegador:
#  browseVignettes("soccergraphR")
#  
#  #Para que se abra en la pestaña de Help de RStudio:
#  vignette("my-vignette")

## ----eval=FALSE----------------------------------------------------------
#  ?OptaMAParrowpass
#  ?OptaMAPcontras
#  ?OptaMAPcorner
#  ?OptaMAPdfrontpass
#  ?OptaMAPdirectpass
#  ?OptaMAPheatMapFrom
#  ?OptaMAPheatMapTo
#  ?OptaMAPmatrixpass
#  ?OptaMAPmatrixpasscluster
#  ?OptaMAPposesion
#  ?OptaMAPposesionzonal
#  ?OptaMAPradarevent
#  ?OptaMAPshoot
#  ?OptaMAPshoot2
#  ?OptaXMLeventos
#  ?OptaXMLpassmatrix
#  ?OptaXMLposesion
#  ?OptaXMLstats

## ----pressure1, echo=FALSE, fig.cap="", out.width = '100%'---------------
knitr::include_graphics("C:/Users/jlagosmi/Desktop/MASTER BIG DATA/PAQUETE_R/soccergraphR/vignettes/21.png")

## ----eval=FALSE----------------------------------------------------------
#  #Pon la ruta donde tengas instsalada la libreria en mi caso:
#  ruta_eventos<-c('C:/My Program Files/R/R-3.5.1/library/soccergraphR/data/f24.xml')
#  df<-OptaXMLeventos(ruta_eventos)

## ----pressure, echo=FALSE, fig.cap="A la izq XML de Opta, a la derecha convertido a dataframe", out.width = '100%'----
knitr::include_graphics("C:/Users/jlagosmi/Desktop/MASTER BIG DATA/PAQUETE_R/soccergraphR/vignettes/3.png")

## ----eval=FALSE----------------------------------------------------------
#  #Pon la ruta donde tengas instsalada la libreria en mi caso:
#  ruta_pases1<-c('C:/My Program Files/R/R-3.5.1/library/soccergraphR/data/pass1.xml')
#  ruta_pases2<-c('C:/My Program Files/R/R-3.5.1/library/soccergraphR/data/pass2.xml')
#  df1<-OptaXMLpassmatrix(ruta_pases1)
#  df2<-OptaXMLpassmatrix(ruta_pases2)

## ----OPTAXMLPASSMATRIX, echo=FALSE, fig.cap="A la izq XML de Opta, a la derecha convertido a dataframe", out.width = '100%'----
knitr::include_graphics("C:/Users/jlagosmi/Desktop/MASTER BIG DATA/PAQUETE_R/soccergraphR/vignettes/1.png")

## ----eval=FALSE----------------------------------------------------------
#  #Pon la ruta donde tengas instsalada la libreria en mi caso:
#  ruta_pases1<-c('C:/My Program Files/R/R-3.5.1/library/soccergraphR/data/pass1.xml')
#  df1<-OptaXMLpassmatrix(ruta_pases1)
#  #Se calcula el grafo para la tabla df1 teniendo en cuenta un número de pases superior a 4
#  OptaMAPmatrixpass(df1,4)

## ----OPTAMAPMATRIXMAP1, echo=FALSE, fig.cap="", out.width = '100%'-------
knitr::include_graphics("C:/Users/jlagosmi/Desktop/MASTER BIG DATA/PAQUETE_R/soccergraphR/vignettes/2_1.png")

## ----OPTAMAPMATRIXMAP2, echo=FALSE, fig.cap="", out.width = '100%'-------
knitr::include_graphics("C:/Users/jlagosmi/Desktop/MASTER BIG DATA/PAQUETE_R/soccergraphR/vignettes/2.png")

## ----eval=FALSE----------------------------------------------------------
#  #Pon la ruta donde tengas instsalada la libreria en mi caso:
#  ruta_eventos<-c('C:/My Program Files/R/R-3.5.1/library/soccergraphR/data/f24.xml')
#  df<-OptaXMLeventos(ruta_eventos)
#  OptaMAPcorner(df,1)

## ----OPTAMAPCORNER, echo=FALSE, fig.cap="", out.width = '100%'-----------
knitr::include_graphics("C:/Users/jlagosmi/Desktop/MASTER BIG DATA/PAQUETE_R/soccergraphR/vignettes/8_1.png")

## ----eval=FALSE----------------------------------------------------------
#  #Pon la ruta donde tengas instsalada la libreria en mi caso:
#  ruta_eventos<-c('C:/My Program Files/R/R-3.5.1/library/soccergraphR/data/f24.xml')
#  df<-OptaXMLeventos(ruta_eventos)
#  OptaMAPdirectpass(df,1)

## ----OPTAMAPDIRECTPASS, echo=FALSE, fig.cap="", out.width = '100%'-------
knitr::include_graphics("C:/Users/jlagosmi/Desktop/MASTER BIG DATA/PAQUETE_R/soccergraphR/vignettes/4_1.png")

## ----OPTAMAPDIRECTPASS2, echo=FALSE, fig.cap="", out.width = '100%'------
knitr::include_graphics("C:/Users/jlagosmi/Desktop/MASTER BIG DATA/PAQUETE_R/soccergraphR/vignettes/4.png")

## ----eval=FALSE----------------------------------------------------------
#  #Pon la ruta donde tengas instsalada la libreria en mi caso:
#  ruta_eventos<-c('C:/My Program Files/R/R-3.5.1/library/soccergraphR/data/f24.xml')
#  df<-OptaXMLeventos(ruta_eventos)
#  OptaMAPheatMapFrom(df,1)
#  OptaMAPheatMapTo(df,1)

## ----OPTAMAPHEATMAPFROM, echo=FALSE, fig.cap="Zonas desde donde pasan los jugadores", out.width = '100%'----
knitr::include_graphics("C:/Users/jlagosmi/Desktop/MASTER BIG DATA/PAQUETE_R/soccergraphR/vignettes/6.png")

## ----OPTAMAPHEATMAPFROM2, echo=FALSE, fig.cap="Zonas adonde pasan los jugadores", out.width = '100%'----
knitr::include_graphics("C:/Users/jlagosmi/Desktop/MASTER BIG DATA/PAQUETE_R/soccergraphR/vignettes/7.png")

## ----eval=FALSE----------------------------------------------------------
#  #Pon la ruta donde tengas instsalada la libreria en mi caso:
#  ruta_eventos<-c('C:/My Program Files/R/R-3.5.1/library/soccergraphR/data/f24.xml')
#  df<-OptaXMLeventos(ruta_eventos)
#  OptaMAParrowpass(df,1)

## ----OptaMAParrowpass, echo=FALSE, fig.cap="Zonas desde donde pasan los jugadores", out.width = '100%'----
knitr::include_graphics("C:/Users/jlagosmi/Desktop/MASTER BIG DATA/PAQUETE_R/soccergraphR/vignettes/25.png")

## ----eval=FALSE----------------------------------------------------------
#  #Pon la ruta donde tengas instsalada la libreria en mi caso:
#  ruta_eventos<-c('C:/My Program Files/R/R-3.5.1/library/soccergraphR/data/f24.xml')
#  df<-OptaXMLeventos(ruta_eventos)
#  OptaMAPshoot(df,1)

## ----OPTAMAPSHOOT, echo=FALSE, fig.cap="", out.width = '100%'------------
knitr::include_graphics("C:/Users/jlagosmi/Desktop/MASTER BIG DATA/PAQUETE_R/soccergraphR/vignettes/5_1.png")

## ----eval=FALSE----------------------------------------------------------
#  #Pon la ruta donde tengas instsalada la libreria en mi caso:
#  ruta_eventos<-c('C:/My Program Files/R/R-3.5.1/library/soccergraphR/data/f24.xml')
#  df<-OptaXMLeventos(ruta_eventos)
#  OptaMAPshoot2(df,1)

## ----OPTAMAPSHOOT2, echo=FALSE, fig.cap="", out.width = '100%'-----------
knitr::include_graphics("C:/Users/jlagosmi/Desktop/MASTER BIG DATA/PAQUETE_R/soccergraphR/vignettes/5_2.png")

## ----eval=FALSE----------------------------------------------------------
#  #Pon la ruta donde tengas instsalada la libreria en mi caso:
#  ruta_posesion<-c('C:/My Program Files/R/R-3.5.1/library/soccergraphR/data/f28.xml')
#  df<-OptaXMLposesion(ruta_posesion)

## ----eval=FALSE----------------------------------------------------------
#  #Pon la ruta donde tengas instsalada la libreria en mi caso:
#  ruta_posesion<-c('C:/My Program Files/R/R-3.5.1/library/soccergraphR/data/f28.xml')
#  df<-OptaXMLposesion(ruta_posesion)
#  OptaMAPposesion(df)

## ----OPTAMAPPOSESION, echo=FALSE, fig.cap="", out.width = '100%'---------
knitr::include_graphics("C:/Users/jlagosmi/Desktop/MASTER BIG DATA/PAQUETE_R/soccergraphR/vignettes/9.png")

## ----eval=FALSE----------------------------------------------------------
#  #Pon la ruta donde tengas instsalada la libreria en mi caso:
#  ruta_eventos<-c('C:/My Program Files/R/R-3.5.1/library/soccergraphR/data/f24.xml')
#  df<-OptaXMLeventos(ruta_eventos)
#  OptaMAPposesionzonal(df,1)

## ----OptaMAPposesionzonal1, echo=FALSE, fig.cap="", out.width = '100%'----
knitr::include_graphics("C:/Users/jlagosmi/Desktop/MASTER BIG DATA/PAQUETE_R/soccergraphR/vignettes/11.png")

## ----eval=FALSE----------------------------------------------------------
#  #Pon la ruta donde tengas instsalada la libreria en mi caso:
#  ruta_eventos<-c('C:/My Program Files/R/R-3.5.1/library/soccergraphR/data/f24.xml')
#  df<-OptaXMLeventos(ruta_eventos)
#  OptaMAPposesionzonal(df,0)

## ----OptaMAPposesionzonal2, echo=FALSE, fig.cap="", out.width = '100%'----
knitr::include_graphics("C:/Users/jlagosmi/Desktop/MASTER BIG DATA/PAQUETE_R/soccergraphR/vignettes/10.png")

## ----eval=FALSE----------------------------------------------------------
#  #Pon la ruta donde tengas instsalada la libreria en mi caso:
#  ruta_stats<-c('C:/My Program Files/R/R-3.5.1/library/soccergraphR/data/stats.xml')
#  df<-OptaXMLstats(ruta_stats)

## ----OptaXMLstats, echo=FALSE, fig.cap="", out.width = '100%'------------
knitr::include_graphics("C:/Users/jlagosmi/Desktop/MASTER BIG DATA/PAQUETE_R/soccergraphR/vignettes/12.png")

## ----eval=FALSE----------------------------------------------------------
#  #Pon la ruta donde tengas instsalada la libreria en mi caso:
#  ruta_stats<-c('C:/My Program Files/R/R-3.5.1/library/soccergraphR/data/stats.xml')
#  df<-OptaXMLstats(ruta_stats)
#  OptaMAPradarevent(df,0)

## ----OptaMAPradarevent1, echo=FALSE, fig.cap="", out.width = '100%'------
knitr::include_graphics("C:/Users/jlagosmi/Desktop/MASTER BIG DATA/PAQUETE_R/soccergraphR/vignettes/14.png")

## ----OptaMAPradarevent2, echo=FALSE, fig.cap="", out.width = '100%'------
knitr::include_graphics("C:/Users/jlagosmi/Desktop/MASTER BIG DATA/PAQUETE_R/soccergraphR/vignettes/15.png")

## ----eval=FALSE----------------------------------------------------------
#  #Pon la ruta donde tengas instsalada la libreria en mi caso:
#  ruta_eventos<-c('C:/My Program Files/R/R-3.5.1/library/soccergraphR/data/f24.xml')
#  df<-OptaXMLeventos(ruta_eventos)
#  OptaMAPanalisisdefensivo(df)

## ----OptaMAPanalisisdefensivo, echo=FALSE, fig.cap="", out.width = '100%'----
knitr::include_graphics("C:/Users/jlagosmi/Desktop/MASTER BIG DATA/PAQUETE_R/soccergraphR/vignettes/16.png")

## ----eval=FALSE----------------------------------------------------------
#  #Pon la ruta donde tengas instsalada la libreria en mi caso:
#  ruta_eventos<-c('C:/My Program Files/R/R-3.5.1/library/soccergraphR/data/f24.xml')
#  df<-OptaXMLeventos(ruta_eventos)
#  OptaMAPdfrontpass(df,1,3,3)

## ----OptaMAPdfrontpass, echo=FALSE, fig.cap="A la izquierda el grafo normal y a la derecha el grafo solo con pases adelantados para el mismo partido con mínimo de 3 pases y 3 metros", out.width = '100%'----
knitr::include_graphics("C:/Users/jlagosmi/Desktop/MASTER BIG DATA/PAQUETE_R/soccergraphR/vignettes/17.png")

## ----eval=FALSE----------------------------------------------------------
#  #Pon la ruta donde tengas instsalada la libreria en mi caso:
#  ruta_eventos<-c('C:/My Program Files/R/R-3.5.1/library/soccergraphR/data/f24.xml')
#  df<-OptaXMLeventos(ruta_eventos)
#  OptaMAPcontras(df,1)

## ----OptaMAPcontras, echo=FALSE, fig.cap="", out.width = '100%'----------
knitr::include_graphics("C:/Users/jlagosmi/Desktop/MASTER BIG DATA/PAQUETE_R/soccergraphR/vignettes/19.png")

## ----eval=FALSE----------------------------------------------------------
#  #Pon la ruta donde tengas instsalada la libreria en mi caso:
#  ruta_eventos<-c('C:/My Program Files/R/R-3.5.1/library/soccergraphR/data/f24.xml')
#  df<-OptaXMLeventos(ruta_eventos)
#  OptaMAPmatrixpasscluster(df,1,20)

## ----OptaMAPmatrixpasscluster, echo=FALSE, fig.cap="", out.width = '100%'----
knitr::include_graphics("C:/Users/jlagosmi/Desktop/MASTER BIG DATA/PAQUETE_R/soccergraphR/vignettes/20.png")

## ----eval=FALSE----------------------------------------------------------
#  #Si la invocamos direcamente
#  OptaMAPcampofutbol()

## ----OptaMAPcampofutbol, echo=FALSE, fig.cap="", out.width = '100%'------
knitr::include_graphics("C:/Users/jlagosmi/Desktop/MASTER BIG DATA/PAQUETE_R/soccergraphR/vignettes/22.png")

## ----eval=FALSE----------------------------------------------------------
#  #Si la invocamos direcamente con 1 o 2 en función de los equipos.
#  OptaMAPshootxG(1)

## ----OptaMAPshootxG, echo=FALSE, fig.cap="", out.width = '100%'----------
knitr::include_graphics("C:/Users/jlagosmi/Desktop/MASTER BIG DATA/PAQUETE_R/soccergraphR/vignettes/26.png")

## ----eval=FALSE----------------------------------------------------------
#  #Si la invocamos direcamente
#  OptaMAPcampofutbol2()

## ----OptaMAPcampofutbol2, echo=FALSE, fig.cap="", out.width = '100%'-----
knitr::include_graphics("C:/Users/jlagosmi/Desktop/MASTER BIG DATA/PAQUETE_R/soccergraphR/vignettes/27.png")

