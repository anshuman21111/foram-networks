#####nulmodels
#morpho
#morpho
library(econullnetr)

Stronger_morpho_lat_15M_250k=NULL
NS_morpho_lat_15M_250k=NULL
Weaker_morpho_lat_15M_250k=NULL
all_bins=as.data.frame(cbind(seq(-75,90,5), 0))
colnames(all_bins)=c("lat", "del")


for (i in 1:length(roundage15M250k)){
  pt=as.data.frame(table(timeslabs15M_250k[[i]]$round.pal.lat, timeslabs15M_250k[[i]]$morphogroup))
  pt$Freq=as.numeric(pt$Freq) 
  pt2 <- as.data.frame(acast(pt, Var1~Var2, value.var="Freq"))
  null.1 <- generate_null_net(cbind((rownames(pt2)),pt2), as.data.frame(t(colSums(pt2))),sims = 100, data.type="counts")
  Sig=as.data.frame(test_interactions(null.1, 0.95))
  tbla=as.data.frame(table(Sig$Consumer,Sig$Test))
  tbla$Freq=as.numeric(tbla$Freq)
  tblb=as.data.frame(acast(tbla, Var1~Var2, value.var="Freq"))
  tblb2=cbind(rownames(tblb), tblb)
  colnames(tblb2)[1]="lat"
  tblb2$lat=as.numeric(tblb2$lat)
  tblb3=full_join(all_bins,tblb2, by="lat")
  #Stronger_morpho_lat_15M_250k=rbind(Stronger_morpho_lat_15M_250k, (tblb3$Stronger/dim(pt2)[2]))
  if(length(tblb3$Stronger)!=0){
    Stronger_morpho_lat_15M_250k=rbind(Stronger_morpho_lat_15M_250k, (tblb3$Stronger/dim(pt2)[2]))}
  else{
    placehd=tblb3$ns
    placehd[!is.na(placehd)]=0
    Stronger_morpho_lat_15M_250k=rbind(Stronger_morpho_lat_15M_250k, (placehd/dim(pt2)[2]))}
  if(length(tblb3$Weaker)!=0){
    Weaker_morpho_lat_15M_250k=rbind(Weaker_morpho_lat_15M_250k, (tblb3$Weaker/dim(pt2)[2]))}
  else{
    placehd=tblb3$ns
    placehd[!is.na(placehd)]=0
    Weaker_morpho_lat_15M_250k=rbind(Weaker_morpho_lat_15M_250k, (placehd/dim(pt2)[2]))}
  NS_morpho_lat_15M_250k=rbind(NS_morpho_lat_15M_250k, ((tblb3$ns)/dim(pt2)[2]))
  print(paste("Finished Timebin ", i))
}

colnames(Stronger_morpho_lat_15M_250k)= as.character(seq(-75,90,5))
colnames(Weaker_morpho_lat_15M_250k)= as.character(seq(-75,90,5))
colnames(NS_morpho_lat_15M_250k)= as.character(seq(-75,90,5))


colnames(Stronger_morpho_lat_15M_250k)= as.character(seq(-75,90,5))
colnames(Weaker_morpho_lat_15M_250k)= as.character(seq(-75,90,5))
colnames(NS_morpho_lat_15M_250k)= as.character(seq(-75,90,5))

#eco
Stronger_eco_lat_15M_250k=NULL
NS_eco_lat_15M_250k=NULL
Weaker_eco_lat_15M_250k=NULL
all_bins=as.data.frame(cbind(seq(-75,90,5), 0))
colnames(all_bins)=c("lat", "del")

for (i in 1:length(roundage15M250k)){
  pt=as.data.frame(table(timeslabs15M_250k[[i]]$round.pal.lat, timeslabs15M_250k[[i]]$ecogroup))
  pt$Freq=as.numeric(pt$Freq) 
  pt2 <- as.data.frame(acast(pt, Var1~Var2, value.var="Freq"))
  null.1 <- generate_null_net(cbind((rownames(pt2)),pt2), as.data.frame(t(colSums(pt2))),sims = 100, data.type="counts")
  Sig=as.data.frame(test_interactions(null.1, 0.95))
  tbla=as.data.frame(table(Sig$Consumer,Sig$Test))
  tbla$Freq=as.numeric(tbla$Freq)
  tblb=as.data.frame(acast(tbla, Var1~Var2, value.var="Freq"))
  tblb2=cbind(rownames(tblb), tblb)
  colnames(tblb2)[1]="lat"
  tblb2$lat=as.numeric(tblb2$lat)
  tblb3=full_join(all_bins,tblb2, by="lat")
  Stronger_eco_lat_15M_250k=rbind(Stronger_eco_lat_15M_250k, (tblb3$Stronger/dim(pt2)[2]))
  if(length(tblb3$Stronger)!=0){
    Stronger_eco_lat_15M_250k=rbind(Stronger_eco_lat_15M_250k, (tblb3$Stronger/dim(pt2)[2]))}
  else{
    placehd=tblb3$ns
    placehd[!is.na(placehd)]=0
    Weaker_eco_lat_15M_250k=rbind(Weaker_eco_lat_15M_250k, (placehd/dim(pt2)[2]))}
  if(length(tblb3$Weaker)!=0){
    Weaker_eco_lat_15M_250k=rbind(Weaker_eco_lat_15M_250k, (tblb3$Weaker/dim(pt2)[2]))}
  else{
    placehd=tblb3$ns
    placehd[!is.na(placehd)]=0
    Weaker_eco_lat_15M_250k=rbind(Weaker_eco_lat_15M_250k, (placehd/dim(pt2)[2]))}
  NS_eco_lat_15M_250k=rbind(NS_eco_lat_15M_250k, ((tblb3$ns)/dim(pt2)[2]))
  print(paste("Finished Timebin ", i))
}

colnames(Stronger_eco_lat_15M_250k)= as.character(seq(-75,90,5))
colnames(Weaker_eco_lat_15M_250k)= as.character(seq(-75,90,5))
colnames(NS_eco_lat_15M_250k)= as.character(seq(-75,90,5))
