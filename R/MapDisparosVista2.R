#' Esta funcion crea un mapa con las zonas de tiro indicando si era gol con que parte del
#' cuerpo se hizo el disparo desde una vista aerea
#'
#' @param df Un df
#' @param home Un numero que puede ser 1 o 0 en funcion si es local(1) o visitante (0)
#' @return El mapa de tiros de \code{df}  y si es local \code{home}
#' @examples
#' OptaMAPshoot2(df,1)
#' OptaMAPshoot2(df,0)
#' @export
#'
OptaMAPshoot2 <- function(df,home){

  #Nos quedamos con los campos que nos interesan
  shots<-dplyr::select(df,type_id,team_id,outcome,x,y,player_id,"102","103","home_team_id","away_team_id","15","20","72")
  #cambiamos los nombres de las columnas
  names(shots)<-c("type_id","team_id","outcome","x","y","player_id","a","b","c","d","head","der","izq")

  #Convertimos a numerico los Factor
  shots$a <- as.numeric(as.character(shots$a))
  shots$b <- as.numeric(as.character(shots$b))
  shots$c <- as.numeric(as.character(shots$c))
  shots$d <- as.numeric(as.character(shots$d))
  shots$head <- as.numeric(as.character(shots$head))
  shots$der <- as.numeric(as.character(shots$der))
  shots$izq <- as.numeric(as.character(shots$izq))

  #Gestionamos la selección de Local o Visitante
  if(home==1){
    shots <- dplyr::filter(shots,team_id== c)}
  else{
    shots <- dplyr::filter(shots,team_id!= c)
  }

  #Filtramos los tiros
  shots <- dplyr::filter(shots, match(type_id,c('13','14','15','16'))  & (!is.na(a) & !is.na(b)))

  #Calculamos la distancia a portería como un campo nuevo
  shots$distancia<-((100-shots$x)^2+(35-(shots$y*0.7))^2)^0.5


  #hacemos un BIN de la distancia
  shots<-shots %>%
    dplyr::mutate(Dist_Shoot = case_when(
      distancia>=0 & distancia<=2 ~ 2,
      distancia>2 & distancia<=5 ~ 5,
      distancia>5 & distancia<=11 ~ 11,
      distancia>11 & distancia<=20 ~ 20,
      distancia>20  ~ 50
    )
    )

  #Categorizamos los tiros en una columna
  shots<-shots %>%
    dplyr::mutate(Tipo_tiro = case_when(
      type_id==13 ~ "Fuera",
      type_id==14 ~ "Al poste",
      type_id==15 ~ "A puerta",
      type_id==16 ~ "Gol"

    )
    )


  shots<-shots %>%
    dplyr::mutate(Remate = case_when(
      der==-1 ~ "Pie Der",
      izq==-1 ~ "Pie Izq",
      head==-1 ~ "Cabeza"
    )
    )


  h <- OptaMAPcampofutbol()
  p <- h +

    ggtitle(paste("\nMapa de disparos")) +
    # Aquí dibujamos el mapa de calor de los corners
    #stat_density2d(data=polar2,aes(x=f*106,y=g*70,fill = ..level..,alpha=..level..), geom="polygon",show.legend = FALSE) +
    #scale_fill_gradient(low="yellow", high="red",aesthetics = "fill") +
    # dejo comentado la linea siguiente para el futuro, dado que con ella dibujamos la flecha del lanzamiento de corner
    geom_segment(data=shots,aes(x=x*106, y=y*70, xend = 10600, yend = a*70,colour=Tipo_tiro),arrow = arrow(length = unit(0.01, "npc")))+
    #geom_point(data = shots,aes(x = ((a)),y = ((b)/15.57)*1.31,color=Tipo_tiro,size=-Dist_Shoot,shape=Remate,stroke = 1)) +
    #Dibujamos los remates
    geom_point(data=shots,aes(x = x*106, y=y*70,shape=Remate,colour=Tipo_tiro),size=3,stroke = 1)+
    #metemos la leyenda abajo
    theme(legend.position="bottom")

  return(p)

}
