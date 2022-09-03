#load relevant data libraries for data morphing and calculating network metrics (library)
library(dplyr)
library(tidyr)
library(reshape2)
library(bipartite)

forLL_eco_15M_250k=NULL #eco - ecotype properties for each timebin network
forLL_morpho_15M_250k=NULL #morpho - morphotype properties for each timebin network
forHL_eco_15M_250k=NULL #eco - latitudinal properties for each timebin network
forHL_morpho_15M_250k=NULL #morpho - latitudinal properties for each timebin network

for (i in 1:length(roundage15M250k)){
  
  pt=as.data.frame(table(timeslabs15M_250k[[i]]$round.pal.lat, timeslabs15M_250k[[i]]$ecogroup))
  pt$Freq=as.numeric(pt$Freq) 
  pt2 <- as.data.frame(acast(pt, Var1~Var2, value.var="Freq"))
  
  
  nodelvl=specieslevel(pt2)
  ecot=nodelvl[[1]]
  ecot$timeslab=roundage15M250k[i]
  ecot$ecot=rownames(ecot)
  forLL_eco_15M_250k=rbind(forLL_eco_15M_250k,ecot)
  
  latitude=nodelvl[[2]]
  latitude$timeslab=roundage15M250k[i]
  latitude$pal.lat=rownames(latitude)
  forHL_eco_15M_250k=rbind(forHL_eco_15M_250k,latitude)
  print(i)
  
  pt=as.data.frame(table(timeslabs15M_250k[[i]]$round.pal.lat, timeslabs15M_250k[[i]]$morphogroup))
  pt$Freq=as.numeric(pt$Freq) 
  pt2 <- as.data.frame(acast(pt, Var1~Var2, value.var="Freq"))
  
  nodelvl=specieslevel(pt2)
  morphot=nodelvl[[1]]
  morphot$timeslab=roundage15M250k[i]
  morphot$morphot=rownames(morphot)
  forLL_morpho_15M_250k=rbind(forLL_morpho_15M_250k,morphot)
  
  latitude=nodelvl[[2]]
  latitude$timeslab=roundage15M250k[i]
  latitude$pal.lat=rownames(latitude)
  forHL_morpho_15M_250k=rbind(forHL_morpho_15M_250k,latitude)
  print(i)
}