#linear models
#data_wide; speciesdiv
lmspediv_SSI=NULL
for (i in 1:length(roundage15M250k)) {
  ZZ=c(summary(lm(data_wide[,i]~spediv_250k[,i]))$coefficients[2,1],summary(lm(data_wide[,i]~spediv_250k[,i]))$coefficients[2,4])
  lmspediv_SSI=rbind(lmspediv_SSI,ZZ)
}

rownames(lmspediv_SSI)= as.character(roundage15M250k)
colnames(lmspediv_SSI)= c("coeff", "pval")

lmspediv_SSI=as.data.frame(cbind(roundage15M250k,lmspediv_SSI))

lmspediv_SSI$sig=as.factor((lmspediv_SSI$BH<(0.05)))

lmspediv_SSI$sigBon=as.factor(lmspediv_SSI$pval<(0.05/60))

lmspediv_SSI$BH=p.adjust(lmspediv_SSI$pval, method = "BH", n = length(lmspediv_SSI$pval))

plot(lmspediv_SSI$roundage15M250k, lmspediv_SSI$coeff, pch=16, ylab="LM coeff between ESI and Sp.Div", xlab = "Time in ky", col=lmspediv_SSI$sigBon)

#data_wide; speciesdiv
lmspeecodiv_SSI=NULL
for (i in 1:length(roundage15M250k)) {
  ZZ=c(summary(lm(Ecodiv_250k[,i]~spediv_250k[,i]))$coefficients[2,1],summary(lm(Ecodiv_250k[,i]~spediv_250k[,i]))$coefficients[2,4])
  lmspeecodiv_SSI=rbind(lmspeecodiv_SSI,ZZ)
}

rownames(lmspeecodiv_SSI)= as.character(roundage15M250k)
colnames(lmspeecodiv_SSI)= c("coeff", "pval")

lmspeecodiv_SSI=as.data.frame(cbind(roundage15M250k,lmspeecodiv_SSI))

lmspeecodiv_SSI$sigBon=as.factor(lmspeecodiv_SSI$pval<(0.05/60))

lmspeecodiv_SSI$BH=p.adjust(lmspeecodiv_SSI$pval, method = "BH", n = length(lmspeecodiv_SSI$pval))
lmspeecodiv_SSI$sig=as.factor((lmspeecodiv_SSI$BH<(0.05)))

plot(lmspeecodiv_SSI$roundage15M250k, lmspeecodiv_SSI$coeff, pch=16, ylab="LM coeff between EDiv and Sp.Div", xlab = "Time in ky", col=lmspeecodiv_SSI$sigBon)
