soccergraphR v.0.1.2
================
Jesús Lagos @Vdot\_spain <jelagmil@gmail.com>
2019-07-08

<!-- README.md is generated from README.Rmd. Please edit that file -->
La libreria soccergraphR esta pensada para todos aquellos que trabajen con los datos de OPTA y para que las personas que estén estudiando o quieran conocer los datos puedan analizarlos y hacer visualizaciones y análisis de los mismos. Con esta libreria podrás:

-   Parsear los xml de Opta (Hay 6 ficheros de ejemplo: f24, f28,2xpass,stats y srml)
-   Analizar los grafos de pases y gráficas de radar
-   Análizar las zonas de tiro
-   Mapas de calor de pases
-   Análisis de corners
-   Gráficas de radar según las estadísticas de una temporada
-   Analizar las posesiones y los eventos por zona
-   Analizar grafos de pases adelantados
-   Analizar las recuperaciones y los tiros asociados.

Para poder probar las funciones de la libreria se ha instalado en `..\R\R-3.5.1\library\soccergraphR\data` los siguientes ficheros:

-   f24. Es el XML de eventos de un partido
-   Pass1 y pass2. Los xml de pases de los 2 equipos del fichero f24
-   f28. Es el XML de posesiones
-   Stats. Es el XML con las estadísticas de toda la temporada de un equipo
-   SRML. Es el XMl con estadísticas de un partido

Versiones
=========
Versión 0.1.2 
-------------
- Se ha incluido la función para realizar mapas con xG y el campo de coordenadas.

Versión 0.1.1 
-------------
- Se corregido la leyenda de OptaMAPcontras 
- Se ha cambiado OptaMAPcorner por flechas 
- Se ha añadido la función OptaMAParrowpass para visualizar pases como flechas por jugador 
- Actualizado las viñetas, ayudas y Readme 
- Se ha mejorado OptaMAPshoot marcando el pie izquierdo y derecho del tirador 
- Se ha añadido la función OptaMAPshoot2 que visualiza los disparos desde una vista aérea 
- Se han ajustado los radar plot por posición

Instalación y Ayuda
-------------------

Para instalar el paquete desde Github:

``` r
devtools::install_github('jelagmil/soccergraphR', build_opts = c("--no-resave-data", "--no-manual"))
library(soccergraphR)
```

Una vez instalado puedes leer la explicación de la libreria ejecutando:

``` r
#Para que se abra en el navegador:
browseVignettes("soccergraphR")

#Para que se abra en la pestaña de Help de RStudio:
vignette("my-vignette")
```

Para conocer cada función y como se usa cada una también puedes usar "?" seguido de la función para mostrar la ayuda en la pestaña de Help de RStudio. Si apretas F1 con el cursor puesto en la función también se despliega en la ayuda:

``` r
?OptaMAParrowpass
?OptaMAPcontras
?OptaMAPcorner
?OptaMAPdfrontpass
?OptaMAPdirectpass
?OptaMAPheatMapFrom
?OptaMAPheatMapTo
?OptaMAPmatrixpass
?OptaMAPmatrixpasscluster
?OptaMAPposesion
?OptaMAPposesionzonal
?OptaMAPradarevent
?OptaMAPshoot
?OptaMAPshoot2
?OptaXMLeventos
?OptaXMLpassmatrix
?OptaXMLposesion
?OptaXMLstats
```

Se vería así: <img src="vignettes/21.png" width="100%" />

OptaXMLeventos
--------------

Con esta función `df<-OptaXMLeventos(ruta_fichero)` podrás pasar el xml f24 a un dataframe teniendo cada evento por linea y sus cualificadores por columna ademas de servirte para muchas de las funciones de esta libreria.

``` r
#Pon la ruta donde tengas instsalada la libreria en mi caso:
ruta_eventos<-c('C:/My Program Files/R/R-3.5.1/library/soccergraphR/data/f24.xml')
df<-OptaXMLeventos(ruta_eventos)
```

Y así quedaría:

<img src="vignettes/3.png" alt="A la izq XML de Opta, a la derecha convertido a dataframe" width="100%" />
<p class="caption">
A la izq XML de Opta, a la derecha convertido a dataframe
</p>

OPTAXMLPASSMATRIX
-----------------

Con esta función `df<-OptaXMLpassmatrix(ruta_fichero)`podrás pasar el xml Pass\_matrix a un dataframe teniendo cada jugador repetido por cada conexión con otro jugador para usarlo en algunas de las funciones descritas en esta libreria.

``` r
#Pon la ruta donde tengas instsalada la libreria en mi caso:
ruta_pases1<-c('C:/My Program Files/R/R-3.5.1/library/soccergraphR/data/pass1.xml')
ruta_pases2<-c('C:/My Program Files/R/R-3.5.1/library/soccergraphR/data/pass2.xml')
df1<-OptaXMLpassmatrix(ruta_pases1)
df2<-OptaXMLpassmatrix(ruta_pases2)
```

Y quedaría:

<img src="vignettes/1.png" alt="A la izq XML de Opta, a la derecha convertido a dataframe" width="100%" />
<p class="caption">
A la izq XML de Opta, a la derecha convertido a dataframe
</p>

OptaMAPmatrixpass
-----------------

Con esta función `OptaMAPmatrixpass(df,4)` se lee el data frame parseado y se genera un grafo que conecta cada jugador con los otros jugadores según los pases realizados en el partido. El segundo parámetro indica el número de pases mínimo a tener en cuenta (si no queremos representar si un jugador pasa 1 vez a otro por ejemplo)

Además cada jugador será representado en la coordenada del XML, con un tamaño de punto según el número de pases exitosos y en color más claro si tiene más centralidad(betweenness) en el grafo.

`La centralidad(betweenness) se define como la intermediación de un nodo en el camino que une otros nodos. Supongamos que escogemos dos jugadores al azar en un equipo, por lo que el camino más corto entre ellos en sus pases pasa por otro nodo. Ese nodo sería un intermediador y por tanto su centralidad mayor.`

Las lineas se representan en de Rojo a Azul en función del número de pases. Cuanto más rojo más pases se han dado entre esos jugadores.

En la parte inferior se mostrará el valor de la densidad del grafo.

`La densidad del grafo se mide como todos los posibles caminos entre los jugadores. Por ejemplo, imaginad que hay 3 jugadores en el campo, por tanto habría 3 conexiones teorica, entre 1 y 2, entre 1 y 3 y entre 2 y 3. Si se cumplen sería un valor de 1, pero si solo hay dos conexiones sería de un 0.6. Cuanta más densidad más conectados están los equipos como el caso de Barcelona y Betis`

``` r
#Pon la ruta donde tengas instsalada la libreria en mi caso:
ruta_pases1<-c('C:/My Program Files/R/R-3.5.1/library/soccergraphR/data/pass1.xml')
df1<-OptaXMLpassmatrix(ruta_pases1)
#Se calcula el grafo para la tabla df1 teniendo en cuenta un número de pases superior a 4
OptaMAPmatrixpass(df1,4)
```

Y quedaría:

<img src="vignettes/2_1.png" width="100%" />

También puedes usar la función `grid.arrange(p1, p2,p4,p5,p6,p7,p8, nrow = 2)` si por ejemplo tienes 8 ficheros (no los hay en el paquete) y representar varios partidos a la vez:

<img src="vignettes/2.png" width="100%" />

OptaMAPcorner
-------------

Con esta función `OptaMAPcorner(df,1)` podrás visualizar en un mapa de calor las zonas donde saca los corners un equipo y el tipo de remate y con que parte del cuerpo fue realizado.

El df será el parseado con la función OPTAXMLEVENTOS:

``` r
#Pon la ruta donde tengas instsalada la libreria en mi caso:
ruta_eventos<-c('C:/My Program Files/R/R-3.5.1/library/soccergraphR/data/f24.xml')
df<-OptaXMLeventos(ruta_eventos)
OptaMAPcorner(df,1)
```

Y quedaría:

<img src="vignettes/8_1.png" width="100%" />

OptaMAPdirectpass
-----------------

Con esta función `OptaMAPdirectpass(df,1)` podrás visualizar en un mapa a cada jugador con su gráfico de radar ubicado en la coordenada promedio de sus pases.

``` r
#Pon la ruta donde tengas instsalada la libreria en mi caso:
ruta_eventos<-c('C:/My Program Files/R/R-3.5.1/library/soccergraphR/data/f24.xml')
df<-OptaXMLeventos(ruta_eventos)
OptaMAPdirectpass(df,1)
```

Y quedaría:

<img src="vignettes/4_1.png" width="100%" />

También puedes usar la función `grid.arrange(p1, p2,p4,p5,p6,p7,p8, nrow = 2)` si por ejemplo tienes 8 ficheros (no los hay en el paquete) y representar varios partidos a la vez.

El df será el parseado con la función OPTAXMLEVENTOS

<img src="vignettes/4.png" width="100%" />

OptaMAPheatMapFrom y OptaMAPheatMapTo
-------------------------------------

Con estas funciones `OptaMAPheatMapFrom(df,1)` y `OptaMAPheatMapTo(df,1)` podrás visualizar un mapa por jugador con su mapa de calor desde donde pasan y adonde pasan

``` r
#Pon la ruta donde tengas instsalada la libreria en mi caso:
ruta_eventos<-c('C:/My Program Files/R/R-3.5.1/library/soccergraphR/data/f24.xml')
df<-OptaXMLeventos(ruta_eventos)
OptaMAPheatMapFrom(df,1)
OptaMAPheatMapTo(df,1)
```

El df será el parseado con la función OPTAXMLEVENTOS

<img src="vignettes/6.png" alt="Zonas desde donde pasan los jugadores" width="100%" />
<p class="caption">
Zonas desde donde pasan los jugadores
</p>

<img src="vignettes/7.png" alt="Zonas adonde pasan los jugadores" width="100%" />
<p class="caption">
Zonas adonde pasan los jugadores
</p>

OptaMAParrowpass
----------------

Con estas funciones `OptaMAParrowpass(df,1)` podrás visualizar un mapa por jugador con su mapa de pases en función de su tipologia

``` r
#Pon la ruta donde tengas instsalada la libreria en mi caso:
ruta_eventos<-c('C:/My Program Files/R/R-3.5.1/library/soccergraphR/data/f24.xml')
df<-OptaXMLeventos(ruta_eventos)
OptaMAParrowpass(df,1)
```

El df será el parseado con la función OPTAXMLEVENTOS

<img src="vignettes/25.png" alt="Zonas desde donde pasan los jugadores" width="100%" />
<p class="caption">
Zonas desde donde pasan los jugadores
</p>

OptaMAPshoot
------------

Con esta función `OptaMAPshoot(df,1))` podrás visualizar una porteria y adonde se ha dirigido cada tiro, cual fue gol y según el tamaño la distancia de donde fue realizado.

El df será el parseado con la función OPTAXMLEVENTOS:

``` r
#Pon la ruta donde tengas instsalada la libreria en mi caso:
ruta_eventos<-c('C:/My Program Files/R/R-3.5.1/library/soccergraphR/data/f24.xml')
df<-OptaXMLeventos(ruta_eventos)
OptaMAPshoot(df,1)
```

Y quedaría:

<img src="vignettes/5_1.png" width="100%" />

OptaMAPshoot2
-------------

Con esta función `OptaMAPshoot2(df,1))` podrás visualizar desde arriba los disparos realizados

El df será el parseado con la función OPTAXMLEVENTOS:

``` r
#Pon la ruta donde tengas instsalada la libreria en mi caso:
ruta_eventos<-c('C:/My Program Files/R/R-3.5.1/library/soccergraphR/data/f24.xml')
df<-OptaXMLeventos(ruta_eventos)
OptaMAPshoot2(df,1)
```

Y quedaría:

<img src="vignettes/5_2.png" width="100%" />

OPTAXMLPOSESION
---------------

Con esta función `OptaXMLposesion(path)` se parsea el fichero F28 de OPTA por el que conseguiremos un Data Frame preparado con los datos de posesiones por cada 1/3 del campo cada 15'.

``` r
#Pon la ruta donde tengas instsalada la libreria en mi caso:
ruta_posesion<-c('C:/My Program Files/R/R-3.5.1/library/soccergraphR/data/f28.xml')
df<-OptaXMLposesion(ruta_posesion)
```

OptaMAPposesion
---------------

Con esta función `OptaMAPposesion(df)` podrás visualizar en el campo de fútbol las posesiones en cada 1/3 del campo, indicando el equipo donde se juega cada posesión.

El df será el parseado con la función OPTAXMLPOSESION

``` r
#Pon la ruta donde tengas instsalada la libreria en mi caso:
ruta_posesion<-c('C:/My Program Files/R/R-3.5.1/library/soccergraphR/data/f28.xml')
df<-OptaXMLposesion(ruta_posesion)
OptaMAPposesion(df)
```

Y quedaría:

<img src="vignettes/9.png" width="100%" />

OptaMAPposesionzonal
--------------------

Con esta función `OptaMAPposesionzonal(df,0)` podrás visualizar en el campo de fútbol el número de eventos en cada zona del campo dividido en 18 zonas.

Si pasamos el parámetro 1 obtendremos el número de eventos durante todo el partido.

El df será el parseado con la función OPTAXMLEVENTOS:

``` r
#Pon la ruta donde tengas instsalada la libreria en mi caso:
ruta_eventos<-c('C:/My Program Files/R/R-3.5.1/library/soccergraphR/data/f24.xml')
df<-OptaXMLeventos(ruta_eventos)
OptaMAPposesionzonal(df,1)
```

Y quedaría:

<img src="vignettes/11.png" width="100%" />

Si pasamos el parámetro 0 obtendremos el número de eventos en rangos de 15 minutos:

``` r
#Pon la ruta donde tengas instsalada la libreria en mi caso:
ruta_eventos<-c('C:/My Program Files/R/R-3.5.1/library/soccergraphR/data/f24.xml')
df<-OptaXMLeventos(ruta_eventos)
OptaMAPposesionzonal(df,0)
```

Y quedaría:

<img src="vignettes/10.png" width="100%" />

OptaXMLstats
------------

Con esta función `OptaXMLstats(df)` se parsea el XML de estadísticas de la temporada

``` r
#Pon la ruta donde tengas instsalada la libreria en mi caso:
ruta_stats<-c('C:/My Program Files/R/R-3.5.1/library/soccergraphR/data/stats.xml')
df<-OptaXMLstats(ruta_stats)
```

Y quedaría:

<img src="vignettes/12.png" width="100%" />

OptaMAPradarevent
-----------------

Con esta función `OptaMAPradarevent(df,0/1))` podemos dibujar gráficos de radar para jugadores (1) o para posiciones (0) con algunos eventos (se han seleccioando algunos pudiendo cambiar los campos en código)

El df será el parseado con la función OptaXMLstats

``` r
#Pon la ruta donde tengas instsalada la libreria en mi caso:
ruta_stats<-c('C:/My Program Files/R/R-3.5.1/library/soccergraphR/data/stats.xml')
df<-OptaXMLstats(ruta_stats)
OptaMAPradarevent(df,0)
```

Y quedaría:

<img src="vignettes/14.png" width="100%" />

<img src="vignettes/15.png" width="100%" />

OptaMAPanalisisdefensivo
------------------------

Con esta función `OptaMAPanalisisdefensivo(df))` creamos un mapa de acciones defensivas con la coordenada promedio para cada jugador, haciendo el convex\_hull y calculando la distancia del promedio del equipo a la porteria.

El df será el parseado con la función OPTAXMLEVENTOS

``` r
#Pon la ruta donde tengas instsalada la libreria en mi caso:
ruta_eventos<-c('C:/My Program Files/R/R-3.5.1/library/soccergraphR/data/f24.xml')
df<-OptaXMLeventos(ruta_eventos)
OptaMAPanalisisdefensivo(df)
```

Y quedaría:

<img src="vignettes/16.png" width="100%" />

OptaMAPdfrontpass
-----------------

Con esta función `OptaMAPdfrontpass(df,home,metros,pases)` creamos el grafo para un partido pero solo de pases adelantados según los metros indicados como parámetro y un número de pases mínimo

El df será el parseado con la función OPTAXMLEVENTOS

``` r
#Pon la ruta donde tengas instsalada la libreria en mi caso:
ruta_eventos<-c('C:/My Program Files/R/R-3.5.1/library/soccergraphR/data/f24.xml')
df<-OptaXMLeventos(ruta_eventos)
OptaMAPdfrontpass(df,1,3,3)
```

Y quedaría:

<img src="vignettes/17.png" alt="A la izquierda el grafo normal y a la derecha el grafo solo con pases adelantados para el mismo partido con mínimo de 3 pases y 3 metros" width="100%" />
<p class="caption">
A la izquierda el grafo normal y a la derecha el grafo solo con pases adelantados para el mismo partido con mínimo de 3 pases y 3 metros
</p>

OptaMAPcontras
--------------

Con esta función `OptaMAPcontras(df,1)` creamos un mapa donde podemos observar los eventos de recuperación de balón y posesión y si hay un tiro asociado y el tiempo en segundos que ha pasado hasta el tiro

El df será el parseado con la función OPTAXMLEVENTOS

``` r
#Pon la ruta donde tengas instsalada la libreria en mi caso:
ruta_eventos<-c('C:/My Program Files/R/R-3.5.1/library/soccergraphR/data/f24.xml')
df<-OptaXMLeventos(ruta_eventos)
OptaMAPcontras(df,1)
```

Y quedaría:

<img src="vignettes/19.png" width="100%" />

OptaMAPmatrixpasscluster
------------------------

Con esta función `OptaMAPmatrixpasscluster(df,home,k)` creamos en primer lugar un modelo kmeans para todos los pases de un partido a partir del XML de eventos para generar el grafo de pases entre clusters independientemente de los jugadores. Este método está basado en los estudios de Kawasaki, Sakakue e Ishizaki.

El df será el parseado con la función OPTAXMLEVENTOS

``` r
#Pon la ruta donde tengas instsalada la libreria en mi caso:
ruta_eventos<-c('C:/My Program Files/R/R-3.5.1/library/soccergraphR/data/f24.xml')
df<-OptaXMLeventos(ruta_eventos)
OptaMAPmatrixpasscluster(df,1,20)
```

Y quedaría:

<img src="vignettes/20.png" width="100%" />

OptaMAPcampofutbol
------------------

Con esta función `OptaMAPcampofutbol()` creamos el campo de futbol y es llamada directamente desde cada función para dibujar el campo. Este campo es similar al publicado por soccermatics y es que cuando una cosa está bien, ¿para qué cambiarla?

``` r
#Si la invocamos direcamente:
OptaMAPcampofutbol()
```

quedaría:

<img src="vignettes/22.png" width="100%" />

OptaMAPshootxG
------------------

Con esta función `OptaMAPshootxG()` creamos el mapa con los datos de los tiros de uno o dos equipos, calculando para cada disparo el xG y calculando el resultado a partir de los xG. La función en la consola te va pidiendo los datos para construir el campo con los tiros.

``` r
#Si la invocamos direcamente con 1 o 2 en función de los equipos.
OptaMAPshootxG(1)
```

quedaría:

<img src="vignettes/26.png" width="100%" />


OptaMAPcampofutbol2
------------------

Con esta función `OptaMAPcampofutbol2()` creamos el campo de futbol y es llamada directamente desde cada función para dibujar el campo y poder detectar las coordenadas de un tiro fácilmente

``` r
#Si la invocamos direcamente
OptaMAPcampofutbol2()
```

quedaría:

<img src="vignettes/27.png" width="100%" />




FUTURAS MEJORAS
---------------

-   ANALIZAR EL RESTO DE FICHEROS
