#
# Ejercicio 4
#

source("distribuciones.R")

#funcion simulacion de plantacion de naranja
#Simulacion=function(){
#  nroArboles=2000
#  nroJornaleros=18
#  media_narja=150
#  desv_narja=30
#  minNarjxJornal=1000
#  maxNarjxJornal=1500  
#  minNarjxbolsa=100
#  maxNarjxbolsa=120
  
Simulacion=function(nroArboles,nroJornaleros,media_narja,desv_narja,minNarjxJornal,maxNarjxJornal,minNarjxbolsa,maxNarjxbolsa){
  
totNaranja=0
dia=0
acumNarajDia=0
totbolsas=0
naranjxdia<-c()
#muestra rendimiento de jornaleros
jor<-c(sample(1:nroJornaleros,size=3, replace = FALSE))#saca 3 muestras aleatorias de jornalero
narajxjor1<-c()
NarajDiaxjor1=0
narajxjor2<-c()
NarajDiaxjor2=0
narajxjor3<-c()
NarajDiaxjor3=0

for(arbol in 1:nroArboles){
  NaranjaxArbol= round(Normal(media_narja,desv_narja),0) # calcula el numero de naraj por arbol
  totNaranja=totNaranja+NaranjaxArbol
}

while(acumNarajDia<totNaranja){
  jornalero=0
  while(jornalero<nroJornaleros){
    nroNarajxjornalero=round(Uniforme(minNarjxJornal,maxNarjxJornal-minNarjxJornal))# calcula el nro de naraj por jornalero
    bolsas=0
    naranj_acum=0
    while(naranj_acum< nroNarajxjornalero){
      naranjxbolsa=round(Uniforme(minNarjxbolsa-minNarjxbolsa,maxNarjxbolsa)) # calcula el nro de naraj por bolsa 
      naranj_acum=naranj_acum+naranjxbolsa;
      bolsas=bolsas+1
    }
    acumNarajDia=acumNarajDia+naranj_acum    
    totbolsas=totbolsas+bolsas
    #formado de vectores con las muestras de los jornaleros
    if(jornalero==jor[1]){
      NarajDiaxjor1=NarajDiaxjor1+naranj_acum
      narajxjor1<-c(narajxjor1,NarajDiaxjor1)
    }
    if(jornalero==jor[2]){
      NarajDiaxjor2=NarajDiaxjor2+naranj_acum
      narajxjor2<-c(narajxjor2,NarajDiaxjor2)
    }
    if(jornalero==jor[3]){
      NarajDiaxjor3=NarajDiaxjor3+naranj_acum
      narajxjor3<-c(narajxjor3,NarajDiaxjor3)
    }
    jornalero=jornalero+1
  }
  naranjxdia<-c(naranjxdia,acumNarajDia)
  dia=dia+1
}
 return (data.frame(totNaranja,totbolsas,dia,naranjxdia,narajxjor1,narajxjor2,narajxjor3)) 
}




