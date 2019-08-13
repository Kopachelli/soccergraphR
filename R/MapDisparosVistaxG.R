#' Esta funcion crea un mapa con diferentes disparos, muestra su ubicación y calcula su xG.
#'
#' @param numeroequipos es un integer que indica el número de equipos para hacer el gráfico
#' @return El mapa de tiros en un partido para los equipos con el xG calculado
#' @examples
#' OptaMAPshootxG(2)
#' @export
#'
#'
OptaMAPshootxG <- function(numeroequipos){

  if(numeroequipos>2 | numeroequipos==0 ){
    return(c("Debes seleccionar un número de equipos 1 ó 2"))
  }

  #save(xG_model, file = "xG_model.rda")
  load("xG_model.rda")

  if(numeroequipos==1 ){
    equipo1 <- readline("Escribe el nombre del equipo 1: ")
    numerotiros <- readline("¿Cuántos tiros vas a incluir?: ")

  j=0
  for(i in 1:numerotiros){
  j=j+1



    x <- readline("Localiza en el plano la coordenada X y escribela aquí: ")
    y <- readline("Localiza en el plano la coordenada Y y escribela aquí: ")

    x <- as.numeric(unlist(strsplit(x, ",")))
    y <- as.numeric(unlist(strsplit(y, ",")))

    distancia<-((106-x)^2+((35)-(y))^2)^0.5

    if(y==35){
      angulo<-round(asin(0)*57.2974694,digits=2)
    }else if(y>35){
      angulo<-round(asin((y-35)/distancia)*57.2974694,digits=2)
    }else if(y<35){
      angulo<-round(asin((35-y)/distancia)*57.2974694,digits=2)
    }




    parte_cuerpo<-menu(c("cabeza", "pied","piei","otraparte"), title="Selecciona una parte del cuerpo:")

    if(parte_cuerpo==1){
      parte_cuerpo<-c('cabeza')
    }else if(parte_cuerpo==2){
      parte_cuerpo<-c('pied')
    }else if(parte_cuerpo==3){
      parte_cuerpo<-c('piei')
    }else if(parte_cuerpo==4){
      parte_cuerpo<-c('otraparte')
    }

    situacion<-menu(c("juegoestatico", "contra","faltaind","corner",'faltadir','penalty','banda'), title="Selecciona una parte del cuerpo:")

    if(situacion==1){
      situacion<-c('juegoestatico')
    }else if(situacion==2){
      situacion<-c('contra')
    }else if(situacion==3){
      situacion<-c('faltaind')
    }else if(situacion==4){
      situacion<-c('corner')
    }else if(situacion==5){
      situacion<-c('faltadir')
    }else if(situacion==6){
      situacion<-c('penalty')
    }else if(situacion==7){
      situacion<-c('banda')
    }

    penal<-menu(c("Si", "No"), title="¿Es un tiro de penalty?:")
    if(penal==1){
      penal<-"-1"
    }else if(penal==2){
      penal<-"0"
    }

    caracara<-menu(c("Si", "No"), title="¿Es un uno contra uno contra el portero?:")
    if(caracara==1){
      caracara<-"-1"
    }else if(caracara==2){
      caracara<-"0"
    }


    prueba<-data.frame(list(distancia,angulo,caracara,penal,situacion,parte_cuerpo,equipo1))
    names(prueba)<-c('distancia','angulo','one2one','penalty','situacion_juego','parte_cuerpo','equipo')
    prueba$distancia <- as.numeric(as.character(prueba$distancia))
    prueba$angulo <- as.numeric(as.character(prueba$angulo))
    prueba$GBM <- caret::predict(xG_model, prueba, na.action = na.pass, type = "prob")[,"1"]


    prueba$x<-x
    prueba$y<-y

    if(j==1){
      Mapa_disparos<-prueba
    }else{
      Mapa_disparos<-rbind(Mapa_disparos,prueba)
    }

    Goles_totales<-sum(Mapa_disparos$GBM)

  }

  h <- OptaMAPcampofutbol()
  p <- h +

    # ggtitle(paste("\nMapa de disparo")) +
    # Aquí dibujamos el mapa de calor de los corners
    #stat_density2d(data=polar2,aes(x=f*106,y=g*70,fill = ..level..,alpha=..level..), geom="polygon",show.legend = FALSE) +
    #scale_fill_gradient(low="yellow", high="red",aesthetics = "fill") +
    # dejo comentado la linea siguiente para el futuro, dado que con ella dibujamos la flecha del lanzamiento de corner
    # geom_segment(data=Mapa_disparos,aes(x=x*100, y=y*100, xend = 10600, yend = 3500),arrow = arrow(length = unit(0.01, "npc")))+
    #geom_point(data = shots,aes(x = ((a)),y = ((b)/15.57)*1.31,color=Tipo_tiro,size=-Dist_Shoot,shape=Remate,stroke = 1)) +
    #Dibujamos los remates
    geom_point(data=Mapa_disparos,aes(x = x*100, y=y*100,size=GBM),stroke = 1) +
    annotate(geom="text", x=7950, y=5500, label=format(Goles_totales,digits=2,nsmall=2), color="black",size=10) +
    annotate(geom="text", x=7950, y=6500, label=equipo1, color="black",size=14) +
    #metemos la leyenda abajo
    theme(legend.position="bottom")

  return(p)
  }else if(numeroequipos==2 ){
    equipo1 <- readline("Escribe el nombre del equipo 1: ")
    numerotiros1 <- readline("¿Cuántos tiros vas a incluir del equipo 1?: ")
    equipo2 <- readline("Escribe el nombre del equipo 2: ")
    numerotiros2 <- readline("¿Cuántos tiros vas a incluir del equipo 2?: ")

    j=0
    for(i in 1:numerotiros1){
      j=j+1



      x <- readline("Localiza en el plano la coordenada X y escribela aquí (equipo 1): ")
      y <- readline("Localiza en el plano la coordenada Y y escribela aquí (equipo 1): ")

      x <- as.numeric(unlist(strsplit(x, ",")))
      y <- as.numeric(unlist(strsplit(y, ",")))

      distancia<-((106-x)^2+((35)-(y))^2)^0.5

      if(y==35){
        angulo<-round(asin(0)*57.2974694,digits=2)
      }else if(y>35){
        angulo<-round(asin((y-35)/distancia)*57.2974694,digits=2)
      }else if(y<35){
        angulo<-round(asin((35-y)/distancia)*57.2974694,digits=2)
      }




      parte_cuerpo<-menu(c("cabeza", "pied","piei","otraparte"), title="Selecciona una parte del cuerpo:")

      if(parte_cuerpo==1){
        parte_cuerpo<-c('cabeza')
      }else if(parte_cuerpo==2){
        parte_cuerpo<-c('pied')
      }else if(parte_cuerpo==3){
        parte_cuerpo<-c('piei')
      }else if(parte_cuerpo==4){
        parte_cuerpo<-c('otraparte')
      }

      situacion<-menu(c("juegoestatico", "contra","faltaind","corner",'faltadir','penalty','banda'), title="Selecciona una parte del cuerpo:")

      if(situacion==1){
        situacion<-c('juegoestatico')
      }else if(situacion==2){
        situacion<-c('contra')
      }else if(situacion==3){
        situacion<-c('faltaind')
      }else if(situacion==4){
        situacion<-c('corner')
      }else if(situacion==5){
        situacion<-c('faltadir')
      }else if(situacion==6){
        situacion<-c('penalty')
      }else if(situacion==7){
        situacion<-c('banda')
      }

      penal<-menu(c("Si", "No"), title="¿Es un tiro de penalty?:")
      if(penal==1){
        penal<-"-1"
      }else if(penal==2){
        penal<-"0"
      }

      caracara<-menu(c("Si", "No"), title="¿Es un uno contra uno contra el portero?:")
      if(caracara==1){
        caracara<-"-1"
      }else if(caracara==2){
        caracara<-"0"
      }


      prueba<-data.frame(list(distancia,angulo,caracara,penal,situacion,parte_cuerpo,equipo1))
      names(prueba)<-c('distancia','angulo','one2one','penalty','situacion_juego','parte_cuerpo','equipo')
      prueba$distancia <- as.numeric(as.character(prueba$distancia))
      prueba$angulo <- as.numeric(as.character(prueba$angulo))
      prueba$GBM <- caret::predict(xG_model, prueba, na.action = na.pass, type = "prob")[,"1"]


      prueba$x<-x
      prueba$y<-y

      if(j==1){
        Mapa_disparos1<-prueba
      }else{
        Mapa_disparos1<-rbind(Mapa_disparos1,prueba)
      }

      Goles_totales1<-sum(Mapa_disparos1$GBM)

    }

    j=0
    for(i in 1:numerotiros2){
      j=j+1

      x <- readline("Localiza en el plano la coordenada X y escribela aquí (equipo 2): ")
      y <- readline("Localiza en el plano la coordenada Y y escribela aquí (equipo 2): ")

      x <- as.numeric(unlist(strsplit(x, ",")))
      y <- as.numeric(unlist(strsplit(y, ",")))

      distancia<-((106-x)^2+((35)-(y))^2)^0.5

      if(y==35){
        angulo<-round(asin(0)*57.2974694,digits=2)
      }else if(y>35){
        angulo<-round(asin((y-35)/distancia)*57.2974694,digits=2)
      }else if(y<35){
        angulo<-round(asin((35-y)/distancia)*57.2974694,digits=2)
      }




      parte_cuerpo<-menu(c("cabeza", "pied","piei","otraparte"), title="Selecciona una parte del cuerpo:")

      if(parte_cuerpo==1){
        parte_cuerpo<-c('cabeza')
      }else if(parte_cuerpo==2){
        parte_cuerpo<-c('pied')
      }else if(parte_cuerpo==3){
        parte_cuerpo<-c('piei')
      }else if(parte_cuerpo==4){
        parte_cuerpo<-c('otraparte')
      }

      situacion<-menu(c("juegoestatico", "contra","faltaind","corner",'faltadir','penalty','banda'), title="Selecciona una parte del cuerpo:")

      if(situacion==1){
        situacion<-c('juegoestatico')
      }else if(situacion==2){
        situacion<-c('contra')
      }else if(situacion==3){
        situacion<-c('faltaind')
      }else if(situacion==4){
        situacion<-c('corner')
      }else if(situacion==5){
        situacion<-c('faltadir')
      }else if(situacion==6){
        situacion<-c('penalty')
      }else if(situacion==7){
        situacion<-c('banda')
      }

      penal<-menu(c("Si", "No"), title="¿Es un tiro de penalty?:")
      if(penal==1){
        penal<-"-1"
      }else if(penal==2){
        penal<-"0"
      }

      caracara<-menu(c("Si", "No"), title="¿Es un uno contra uno contra el portero?:")
      if(caracara==1){
        caracara<-"-1"
      }else if(caracara==2){
        caracara<-"0"
      }


      prueba<-data.frame(list(distancia,angulo,caracara,penal,situacion,parte_cuerpo,equipo2))
      names(prueba)<-c('distancia','angulo','one2one','penalty','situacion_juego','parte_cuerpo','equipo')
      prueba$distancia <- as.numeric(as.character(prueba$distancia))
      prueba$angulo <- as.numeric(as.character(prueba$angulo))
      prueba$GBM <- caret::predict(xG_model, prueba, na.action = na.pass, type = "prob")[,"1"]


      prueba$x<-x
      prueba$y<-y

      if(j==1){
        Mapa_disparos2<-prueba
      }else{
        Mapa_disparos2<-rbind(Mapa_disparos2,prueba)
      }

      Goles_totales2<-sum(Mapa_disparos2$GBM)

    }

    h <- OptaMAPcampofutbol()
    p <- h +

      # ggtitle(paste("\nMapa de disparo")) +
      # Aquí dibujamos el mapa de calor de los corners
      #stat_density2d(data=polar2,aes(x=f*106,y=g*70,fill = ..level..,alpha=..level..), geom="polygon",show.legend = FALSE) +
      #scale_fill_gradient(low="yellow", high="red",aesthetics = "fill") +
      # dejo comentado la linea siguiente para el futuro, dado que con ella dibujamos la flecha del lanzamiento de corner
      # geom_segment(data=Mapa_disparos,aes(x=x*100, y=y*100, xend = 10600, yend = 3500),arrow = arrow(length = unit(0.01, "npc")))+
      #geom_point(data = shots,aes(x = ((a)),y = ((b)/15.57)*1.31,color=Tipo_tiro,size=-Dist_Shoot,shape=Remate,stroke = 1)) +
      #Dibujamos los remates
      geom_point(data=Mapa_disparos1,aes(x = x*100, y=y*100,size=GBM),stroke = 1,color="red") +
      geom_point(data=Mapa_disparos2,aes(x = 10600-x*100, y=y*100,size=GBM),stroke = 1,color="blue") +
      annotate(geom="text", x=7950, y=5500, label=format(Goles_totales1,digits=2,nsmall=2), color="black",size=10) +
      annotate(geom="text", x=7950, y=6500, label=equipo1, color="black",size=14) +
      annotate(geom="text", x=2650, y=5500, label=format(Goles_totales2,digits=2,nsmall=2), color="black",size=10) +
      annotate(geom="text", x=2650, y=6500, label=equipo2, color="black",size=14)
      #metemos la leyenda abajo
      #theme(legend.position="bottom")

    return(p)
  }

}



