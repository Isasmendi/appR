Uniforme=function(a,b){
  u=runif(1, 0.01, 0.99)
  x= a +( b - a)*u
  return(x= a +( b - a)*u)
}

Normal=function(M,d){
  sum=0
  for(i in 1:12){
    #llamar funcion aletoria
    u=runif(1, 0.01, 0.99)
    sum=sum+u
  }
  
  #ejercicio 1 Una compañía de seguros está tratando de evaluar la eficiencia de un sistema de telemarketing.
  #runif(10, 0.01, 0.99) funcion aleatoria
  #sample(state.name, 10) elemtos que no se repiten
  
  #random.number<-numeric(10000)
  #random.seed<-2018
  #for (j in 1:10000){
  # random.seed<-(171*random.seed)%%32767
  # random.number[j]<-random.seed/32767
  #}
  #random.number
  
  
  return( x=d*(sum-6)+M)
} 
