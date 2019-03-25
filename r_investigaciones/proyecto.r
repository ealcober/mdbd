require("XLConnect")
require("dplyr")
library(dplyr)
#Abre (si es posible) y carga el libro del fichero Excel
#Lee los nombres de sus hojas de cálculo en un vector de tipo carácter
# myExcelFileSheetNamesGPP<-getSheets(myExcelFileContentGPP)
# Lee el contenido de la primera hoja de cálculo
# myExcelFileFirstSheet<- readWorksheet(myExcelFileContent,sheet=myExcelFileSheetNames[1])
gpp<-read.csv('E:/UCM/2019/SEGUNDO_CUAT/MDBD/datasets/proyecto/global-plastics-production.csv',header=TRUE,sep="," , quote="\"",dec=".",fill=TRUE)
sch<-read.csv('E:/UCM/2019/SEGUNDO_CUAT/MDBD/datasets/proyecto/mean-years-of-schooling-selected-countries.csv',header=TRUE,sep="," , quote="\"",dec=".",fill=TRUE)
pmw<-read.table('E:/UCM/2019/SEGUNDO_CUAT/MDBD/datasets/proyecto/per-capita-mismanaged-plastic-waste-vs-gdp-per-capita.csv',header=TRUE,sep="," , quote="\"",dec=".",fill=TRUE,na.strings="0", as.is=T)
pmo<-read.csv('E:/UCM/2019/SEGUNDO_CUAT/MDBD/datasets/proyecto/surface-plastic-mass-by-ocean.csv',header=TRUE,sep="," , quote="\"",dec=".",fill=TRUE)
#edu<-read.csv('E:/UCM/2019/SEGUNDO_CUAT/MDBD/datasets/proyecto/SYB61_T07_Education.csv',header=TRUE,sep=",",quote="",dec=".",fill=T)
  
# plot(gpp$Year, gpp$Global.plastics.production..million.tonnes...tonnes.)
# ELIMINAR COLUMNAS INNECESARIAS
sch$Entity <-NULL
sch$Code <-NULL

haz.cero.na=function(x){
  ifelse(is.na(x),0,x)}

pmw<- data.frame(sapply(pmw,haz.cero.na))
pmo$Code <- NULL
gpp$Entity <- NULL
gpp$Code <- NULL
pmw$Entity <- NULL
pmw$Code <- NULL

layout(matrix(1:4,2,2,byrow = T))
# ejemplo traspas
# tapply(df$values, list(df$cities, df$times), mean)

plot(pmo$Entity, pmo$All.sizes..total.mass...tonnes.)
plot(gpp$Year, gpp$Global.plastics.production..million.tonnes...tonnes.)
# para sacar exactamente el rango de a�os contemplado en pmw
pmw$Year <- as.numeric(as.character(pmw$Year))

