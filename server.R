library(shiny)

source("ejercicio4.R")
shinyServer(function(input,output){
  reacSimulacion<-reactive({    
   Simulacion(input$plantas,input$jornale,input$media_narja,input$desv_narja,input$rang_cosecha[1],input$rang_cosecha[2],input$rang_bolsa[1],input$rang_bolsa[2])    
 }) 

  output$totNaranjas<-renderText({
  paste("Nro total de naranjas",reacSimulacion()[1,1])  
  })
  output$totbolsas<-renderText({
    paste("Nro total de bolsas", reacSimulacion()[1,2])  
  })
  output$totdias<-renderText({
    paste("Nro total de dias", reacSimulacion()[1,3])  
  })
 
 output$distPlot<-renderPlot({
   barplot( 
     reacSimulacion()$naranjxdia,
           ylab="Nro Naranjas",
           xlab="dias",col="lightblue"
          )
 })
 output$a_out <- renderPrint({
   reacSimulacion()$naranjxdia
 })
 
 output$jor<-renderPlot({
   plot( 
     reacSimulacion()$narajxjor1,
     type = "l",
     ylab="Nro Naranjas",
     xlab="dias"
   )
   points(reacSimulacion()$narajxjor1, cex = .5, col = "dark red")
   lines(reacSimulacion()$narajxjor1, cex = .5, col = "dark red")
   points(reacSimulacion()$narajxjor2, cex = .5, col = "dark blue")
   lines(reacSimulacion()$narajxjor2, cex = .5, col = "dark blue")
   points(reacSimulacion()$narajxjor3, cex = .5, col = "dark green")
   lines(reacSimulacion()$narajxjor3, cex = .5, col = "dark green")
 
   legend("bottomleft", "jornalero 1", col = "dark red",pch=1, lty=1)
   legend("bottom", "jornalero 2", col="dark blue",pch=1,lty=1)
   legend("bottomright", "jornalero 3", col = "dark green",pch=1,lty=1)
   })
  
})