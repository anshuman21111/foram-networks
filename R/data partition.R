######For 15 Million years and 250k bin-sizes, we make different base files to construct networks

foramdata15Morgall=read.csv("data/Triton_Eco_Morpho_15Ma_Binned.csv") #filename

foramdata15Mbins=foramdata15Morgall

foramdata15Mbins=foramdata15Mbins[-which(is.na(foramdata15Mbins$ecogroup)),]
foramdata15Mbins=foramdata15Mbins[-which(is.na(foramdata15Mbins$morphogroup)),]

roundage15M250k=unique(foramdata15Mbins$round.age_250_ka)

#timeslab data 25k in 15M
timeslabs15M_250k=list()
for (i in 1:length(roundage15M250k)) {
  timeslabs15M_250k[[i]]=foramdata15Mbins[which(foramdata15Mbins$round.age_250_ka==roundage15M250k[i]),]
}

