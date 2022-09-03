#calculating Shannon diversity of species and functional groups

library(vegan)

#spewciesdiv
spediv_250k=NULL
all_bins=as.data.frame(cbind(seq(-75,90,5), 0))
colnames(all_bins)=c("lat", "del")

for (i in 1:length(roundage15M250k)){
  pt=as.data.frame(table(timeslabs15M_250k[[i]]$round.pal.lat, timeslabs15M_250k[[i]]$species))
  pt$Freq=as.numeric(pt$Freq) 
  tblb=as.data.frame(acast(pt, Var1~Var2, value.var="Freq"))
  tblb2=cbind(rownames(tblb), tblb)
  colnames(tblb2)[1]="lat"
  tblb2$lat=as.numeric(tblb2$lat)
  tblb3=full_join(all_bins,tblb2, by="lat")
  
  pt2=tblb3[,-c(1,2)]
  
  spediv_250k=cbind(spediv_250k,apply(pt2, 1, diversity))
  
  
  print(paste("Finished Timebin ", i))
}

rownames(spediv_250k)= as.character(seq(-75,90,5))
colnames(spediv_250k)= as.character(roundage15M250k)

#eco
Ecodiv_250k=NULL
all_bins=as.data.frame(cbind(seq(-75,90,5), 0))
colnames(all_bins)=c("lat", "del")

for (i in 1:length(roundage15M250k)){
  pt=as.data.frame(table(timeslabs15M_250k[[i]]$round.pal.lat, timeslabs15M_250k[[i]]$ecogroup))
  pt$Freq=as.numeric(pt$Freq) 
  tblb=as.data.frame(acast(pt, Var1~Var2, value.var="Freq"))
  tblb2=cbind(rownames(tblb), tblb)
  colnames(tblb2)[1]="lat"
  tblb2$lat=as.numeric(tblb2$lat)
  tblb3=full_join(all_bins,tblb2, by="lat")
  
  pt2=tblb3[,-c(1,2)]
  
  Ecodiv_250k=cbind(Ecodiv_250k,apply(pt2, 1, diversity))
  
  
  print(paste("Finished Timebin ", i))
}

rownames(Ecodiv_250k)= as.character(seq(-75,90,5))
colnames(Ecodiv_250k)= as.character(roundage15M250k)

#morpho
Morphodiv_250k=NULL
all_bins=as.data.frame(cbind(seq(-75,90,5), 0))
colnames(all_bins)=c("lat", "del")

for (i in 1:length(roundage15M250k)){
  pt=as.data.frame(table(timeslabs15M_250k[[i]]$round.pal.lat, timeslabs15M_250k[[i]]$morphogroup))
  pt$Freq=as.numeric(pt$Freq) 
  tblb=as.data.frame(acast(pt, Var1~Var2, value.var="Freq"))
  tblb2=cbind(rownames(tblb), tblb)
  colnames(tblb2)[1]="lat"
  tblb2$lat=as.numeric(tblb2$lat)
  tblb3=full_join(all_bins,tblb2, by="lat")
  
  pt2=tblb3[,-c(1,2)]
  
  Morphodiv_250k=cbind(Morphodiv_250k,apply(pt2, 1, diversity))
  
  
  print(paste("Finished Timebin ", i))
}

rownames(Morphodiv_250k)= as.character(seq(-75,90,5))
colnames(Morphodiv_250k)= as.character(roundage15M250k)


