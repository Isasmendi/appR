
library(shiny)

shinyUI(fluidPage(
  titlePanel("Simulacion de Plantacion de Naranjas"),
  h4("Ejercicio4"),
  h6("En una plantación de naranjas existen 2000 árboles c/u con una
     media de 150 naranjas con una desviación de 30. Se considera además
     que un jornalero puede levantar entre 1000 y 1500 naranjas por día
     Además, es necesario embolsar las naranjas para lo cual debe tener
     en cuenta que cada bolsa puede contener entre 100 y 120 naranjas."),
  h6("Si se cuenta con 18 jornaleros, informe lo siguiente:
      a. Cantidad de naranjas que cosechan en total.
      b. Cantidad de naranjas que cosechan por día.
      c. Cantidad de bolsas necesarias para la cosecha.
      d. Cantidad de días que se tardará en cosechar.
"),
  sidebarLayout(
    sidebarPanel(sliderInput("jornale", "Nro jornaleros", min=10, max=50, value=18),
                 sliderInput("plantas", "Nro plantas", min=1000, max=10000, value=2000),
                 numericInput("media_narja", "media de naranjas por arbol:", 150,min = 50, max = 200),
                 numericInput("desv_narja", "desviacion de naranjas por arbol:", 30,min = 10, max = 90),
                 sliderInput("rang_cosecha", "nro de naranja por jornaleros", min=500, max=5000,value=c(1000,1500)),
                 sliderInput("rang_bolsa", "nro de naranja por bolsa", min=50, max=200, value=c(100,120))
                 
                 ),              
    mainPanel( h4("Resultados"),
               textOutput("totNaranjas"),
               textOutput("totbolsas"),
               textOutput("totdias"),
               plotOutput("distPlot"),
               h4("Cosecha por dia"),
               verbatimTextOutput('a_out'),
               h4("Muestras de 3 jornaleros por dia"),
               plotOutput("jor")
              )
  )
  ))
