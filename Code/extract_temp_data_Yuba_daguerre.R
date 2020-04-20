library(tidyverse)
library(tabulizer)
library(xlsx)
library(padr)

daguerre_2001_21_27 <- extract_tables(
  file='S:/DWR/VOL1/BayDeltaDRV/Tributaries/Yuba River/Yuba_Temperature_Compilation/Yuba_Temperature_Work/Yuba Compliance WY 2000-2001/2000_01_anncomprpt_ocr.pdf',
  output = "data.frame",
  pages = c(21,22,23,24,25,26,27),
  guess=FALSE
)

daguerre_2001_21_27_df <- NULL

for (i in 1){
  daguerre_2001_21_27[[i]]<-daguerre_2001_21_27[[i]] %>% select(c("Dam", "X.1", "Yuba.Countv.Water.Aoencv"))
  daguerre_2001_21_27[[i]] <- head(daguerre_2001_21_27[[i]], -1)
  daguerre_2001_21_27[[i]] <- daguerre_2001_21_27[[i]][-c(1:2),]
  daguerre_2001_21_27[[i]] <- separate(daguerre_2001_21_27[[i]], 3, into=c("Min", "Mean"), sep=" ")
  daguerre_2001_21_27[[i]] <- daguerre_2001_21_27[[i]] %>% rename(Date=Dam, Max=X.1)
  daguerre_2001_21_27_df <- rbind(daguerre_2001_21_27_df, daguerre_2001_21_27[[i]])
}

for (i in 2:3){
  daguerre_2001_21_27[[i]]<-daguerre_2001_21_27[[i]] %>% select(c("Dam", "X.1", "Yuba.County.Water.Aoencv"))
  daguerre_2001_21_27[[i]] <- head(daguerre_2001_21_27[[i]], -1)
  daguerre_2001_21_27[[i]] <- daguerre_2001_21_27[[i]][-c(1:2),]
  daguerre_2001_21_27[[i]] <- separate(daguerre_2001_21_27[[i]], 3, into=c("Min", "Mean"), sep=" ")
  daguerre_2001_21_27[[i]] <- daguerre_2001_21_27[[i]] %>% rename(Date=Dam, Max=X.1)
  daguerre_2001_21_27_df <- rbind(daguerre_2001_21_27_df, daguerre_2001_21_27[[i]])
}

for (i in 4){
  daguerre_2001_21_27[[i]]<-daguerre_2001_21_27[[i]] %>% select(c("Temperatures.at.Dauuurra.Point.Dam", "X.1", "Yuba.County.Water.Auencv"))
  daguerre_2001_21_27[[i]] <- head(daguerre_2001_21_27[[i]], -1)
  daguerre_2001_21_27[[i]] <- daguerre_2001_21_27[[i]][-c(1:2),]
  daguerre_2001_21_27[[i]] <- separate(daguerre_2001_21_27[[i]], 3, into=c("Min", "Mean"), sep=" ")
  daguerre_2001_21_27[[i]] <- daguerre_2001_21_27[[i]] %>% rename(Date=Temperatures.at.Dauuurra.Point.Dam, Max=X.1)
  daguerre_2001_21_27_df <- rbind(daguerre_2001_21_27_df, daguerre_2001_21_27[[i]])
}
for (i in 5){
  daguerre_2001_21_27[[i]]<-daguerre_2001_21_27[[i]] %>% select(c("Temperatures.at.Daguerra.Point.Dam", "X.1", "Yuba.Countv.Water.Aoencv"))
  daguerre_2001_21_27[[i]] <- head(daguerre_2001_21_27[[i]], -1)
  daguerre_2001_21_27[[i]] <- daguerre_2001_21_27[[i]][-c(1:2),]
  daguerre_2001_21_27[[i]] <- separate(daguerre_2001_21_27[[i]], 3, into=c("Min", "Mean"), sep=" ")
  daguerre_2001_21_27[[i]] <- daguerre_2001_21_27[[i]] %>% rename(Date=Temperatures.at.Daguerra.Point.Dam, Max=X.1)
  daguerre_2001_21_27_df <- rbind(daguerre_2001_21_27_df, daguerre_2001_21_27[[i]])
}

for (i in 6){
  daguerre_2001_21_27[[i]]<-daguerre_2001_21_27[[i]] %>% select(c("Dam", "X.1", "Yuba.Countv.Water.Aouncv"))
  daguerre_2001_21_27[[i]] <- head(daguerre_2001_21_27[[i]], -1)
  daguerre_2001_21_27[[i]] <- daguerre_2001_21_27[[i]][-c(1:2),]
  daguerre_2001_21_27[[i]] <- separate(daguerre_2001_21_27[[i]], 3, into=c("Min", "Mean"), sep=" ")
  daguerre_2001_21_27[[i]] <- daguerre_2001_21_27[[i]] %>% rename(Date=Dam, 
                                                                  Max=X.1)
  daguerre_2001_21_27_df <- rbind(daguerre_2001_21_27_df, daguerre_2001_21_27[[i]])
}

for (i in 7){
  daguerre_2001_21_27[[i]]<-daguerre_2001_21_27[[i]] %>% select(c("Dam", "X.1", "Yuba.County.Water.Aoencv"))
  daguerre_2001_21_27[[i]] <- head(daguerre_2001_21_27[[i]], -1)
  daguerre_2001_21_27[[i]] <- daguerre_2001_21_27[[i]][-c(1:2),]
  daguerre_2001_21_27[[i]] <- separate(daguerre_2001_21_27[[i]], 3, into=c("Min", "Mean"), sep=" ")
  daguerre_2001_21_27[[i]] <- daguerre_2001_21_27[[i]] %>% rename(Date=Dam, Max=X.1)
  daguerre_2001_21_27_df <- rbind(daguerre_2001_21_27_df, daguerre_2001_21_27[[i]])
}

daguerre_2001 <- NULL
daguerre_2001 <- rbind(daguerre_2001, daguerre_2001_21_27_df)
daguerre_2001$Date <- gsub('/', '-', daguerre_2001$Date)
daguerre_2001$Date <- as.Date(daguerre_2001$Date, "%m-%d-%Y")
daguerre_2001$Max <- as.numeric(daguerre_2001$Max)
daguerre_2001$Min <- as.numeric(daguerre_2001$Min)
daguerre_2001$Mean <- as.numeric(daguerre_2001$Mean)
daguerre_2001$Date <- seq.Date(from = daguerre_2001$Date[1], length.out = dim(daguerre_2001)[1], by = "day")

daguerre_2001$Mean <- replace(daguerre_2001$Mean, c(21,26,33,156), c(53.66,53.50,53.96,56.83))





daguerre_2002_31_41 <- extract_tables(
  file='S:/DWR/VOL1/BayDeltaDRV/Tributaries/Yuba River/Yuba_Temperature_Compilation/Yuba_Temperature_Work/Yuba Compliance WY 2002-2003/Yuba12-31-02ComplianceReport_ann_02_ocr.pdf',
  output = "data.frame",
  pages = c(31,32,33,34,35,36,37,38,39,40,41),
  guess=FALSE
)

daguerre_2002_31_41_df <- NULL

for (i in 1){
  daguerre_2002_31_41[[i]] <- daguerre_2002_31_41[[i]][c(4,6,7)]
  daguerre_2002_31_41[[i]] <- head(daguerre_2002_31_41[[i]], -1)
  daguerre_2002_31_41[[i]] <- daguerre_2002_31_41[[i]][-c(1:2),]
  daguerre_2002_31_41[[i]] <- separate(daguerre_2002_31_41[[i]], 3, into=c("Min", "Mean"), sep=" ")
  daguerre_2002_31_41[[i]] <- daguerre_2002_31_41[[i]] %>% rename(Date=1, Max=2)
  daguerre_2002_31_41_df <- rbind(daguerre_2002_31_41_df, daguerre_2002_31_41[[i]])
}
for (i in 2){
  daguerre_2002_31_41[[i]] <- daguerre_2002_31_41[[i]][c(2,4,5)]
  daguerre_2002_31_41[[i]] <- head(daguerre_2002_31_41[[i]], -1)
  daguerre_2002_31_41[[i]] <- daguerre_2002_31_41[[i]][-c(1:2),]
  daguerre_2002_31_41[[i]] <- separate(daguerre_2002_31_41[[i]], 3, into=c("Min", "Mean"), sep=" ")
  daguerre_2002_31_41[[i]] <- daguerre_2002_31_41[[i]] %>% rename(Date=1, Max=2)
  daguerre_2002_31_41_df <- rbind(daguerre_2002_31_41_df, daguerre_2002_31_41[[i]])
}


for (i in 3){
  daguerre_2002_31_41[[i]] <- daguerre_2002_31_41[[i]][c(3,5)]
  daguerre_2002_31_41[[i]] <- head(daguerre_2002_31_41[[i]], -1)
  daguerre_2002_31_41[[i]] <- daguerre_2002_31_41[[i]][-c(1:2),]
  daguerre_2002_31_41[[i]] <- separate(daguerre_2002_31_41[[i]], 2, into=c("Max","Min", "Mean"), sep=" ")
  daguerre_2002_31_41[[i]] <- daguerre_2002_31_41[[i]] %>% rename(Date=1, Max=2)
  daguerre_2002_31_41_df <- rbind(daguerre_2002_31_41_df, daguerre_2002_31_41[[i]])
}

for (i in 4:8){
  daguerre_2002_31_41[[i]] <- daguerre_2002_31_41[[i]][c(2,4,5)]
  daguerre_2002_31_41[[i]] <- head(daguerre_2002_31_41[[i]], -1)
  daguerre_2002_31_41[[i]] <- daguerre_2002_31_41[[i]][-c(1:2),]
  daguerre_2002_31_41[[i]] <- separate(daguerre_2002_31_41[[i]], 3, into=c("Min", "Mean"), sep=" ")
  daguerre_2002_31_41[[i]] <- daguerre_2002_31_41[[i]] %>% rename(Date=1, Max=2)
  daguerre_2002_31_41_df <- rbind(daguerre_2002_31_41_df, daguerre_2002_31_41[[i]])
}
for (i in 9){
  daguerre_2002_31_41[[i]] <- daguerre_2002_31_41[[i]][c(4,6,7)]
  daguerre_2002_31_41[[i]] <- head(daguerre_2002_31_41[[i]], -1)
  daguerre_2002_31_41[[i]] <- daguerre_2002_31_41[[i]][-c(1:2),]
  daguerre_2002_31_41[[i]] <- separate(daguerre_2002_31_41[[i]], 3, into=c("Min", "Mean"), sep=" ")
  daguerre_2002_31_41[[i]] <- daguerre_2002_31_41[[i]] %>% rename(Date=1, Max=2)
  daguerre_2002_31_41_df <- rbind(daguerre_2002_31_41_df, daguerre_2002_31_41[[i]])
}
for (i in 10){
  daguerre_2002_31_41[[i]] <- daguerre_2002_31_41[[i]][c(2,4,5)]
  daguerre_2002_31_41[[i]] <- head(daguerre_2002_31_41[[i]], -1)
  daguerre_2002_31_41[[i]] <- daguerre_2002_31_41[[i]][-c(1:2),]
  daguerre_2002_31_41[[i]] <- separate(daguerre_2002_31_41[[i]], 3, into=c("Min", "Mean"), sep=" ")
  daguerre_2002_31_41[[i]] <- daguerre_2002_31_41[[i]] %>% rename(Date=1, Max=2)
  daguerre_2002_31_41_df <- rbind(daguerre_2002_31_41_df, daguerre_2002_31_41[[i]])
}
for (i in 11){
  daguerre_2002_31_41[[i]] <- daguerre_2002_31_41[[i]][c(2,3,4)]
  daguerre_2002_31_41[[i]] <- head(daguerre_2002_31_41[[i]], -1)
  daguerre_2002_31_41[[i]] <- daguerre_2002_31_41[[i]][-c(1:2),]
  daguerre_2002_31_41[[i]] <- separate(daguerre_2002_31_41[[i]], 3, into=c("Min", "Mean"), sep=" ")
  daguerre_2002_31_41[[i]] <- daguerre_2002_31_41[[i]] %>% rename(Date=1, Max=2)
  daguerre_2002_31_41_df <- rbind(daguerre_2002_31_41_df, daguerre_2002_31_41[[i]])
}

daguerre_2002_31_41_df <- na.omit(daguerre_2002_31_41_df)
daguerre_2002_31_41_df[32,1] <- 1
daguerre_2002_31_41_df[152,1] <- 1
daguerre_2002_31_41_df[244,1] <- 1
daguerre_2002_31_41_df[274,1] <- 1
daguerre_2002_31_41_df[275,1] <- 2

daguerre_2002 <- NULL
daguerre_2002 <- rbind(daguerre_2002, daguerre_2002_31_41_df)
daguerre_2002$ WaterYear <- c(rep(2001, 92), rep(2002, 202))
daguerre_2002$Month <- c(rep(10,31), rep(11,30), rep(12,31), 
                         rep(1,31), rep(2,28), rep(3,31), 
                         rep(4,30), rep(5,31), rep(6,30), rep(7,2), rep(9,19))
daguerre_2002 <- daguerre_2002 %>% rename(Day=Date)
daguerre_2002$Date <- as.Date(with(daguerre_2002, paste(WaterYear, Month, Day,sep="-")), "%Y-%m-%d")
daguerre_2002 <- within(daguerre_2002, rm(Day, Month, WaterYear))
daguerre_2002$Max <- as.numeric(daguerre_2002$Max)
daguerre_2002$Min <- as.numeric(daguerre_2002$Min)
daguerre_2002$Mean <- as.numeric(daguerre_2002$Mean)
daguerre_2002 <- daguerre_2002[,c(4,1,2,3)]


daguerre_2003_31_42 <- extract_tables(
  file='S:/DWR/VOL1/BayDeltaDRV/Tributaries/Yuba River/Yuba_Temperature_Compilation/Yuba_Temperature_Work/Yuba Compliance WY 2002-2003/2003annrpt_ocr.pdf',
  output = "data.frame",
  pages = c(31,32,33,34,35,36,37,38,39,40,41,42),
  guess=FALSE
)

daguerre_2003_31_42_df <- NULL

for (i in 1:12){
  names(daguerre_2003_31_42[[i]]) <- daguerre_2003_31_42[[i]][4,]
  daguerre_2003_31_42[[i]] <- daguerre_2003_31_42[[i]][-c(1:4),]
  daguerre_2003_31_42[[i]] <- separate(daguerre_2003_31_42[[i]], 2, into=c("Max", "Min", "Mean"), sep=" ")
  daguerre_2003_31_42_df <- rbind(daguerre_2003_31_42_df, daguerre_2003_31_42[[i]])
}


daguerre_2003 <- NULL
daguerre_2003 <- rbind(daguerre_2003, daguerre_2003_31_42_df)
daguerre_2003$ WaterYear <- c(rep(2002, 92), rep(2003, 273))
daguerre_2003$Month <- c(rep(10, 31), rep(11,30), rep(12,31), rep(1,31), rep(2,28), rep(3,31), rep(4,30), rep(5,31), rep(6,30), rep(7,31), rep(8,31), rep(9,30))
daguerre_2003 <- daguerre_2003 %>% rename(Day=Date)
daguerre_2003$Date <- as.Date(with(daguerre_2003, paste(WaterYear, Month, Day,sep="-")), "%Y-%m-%d")
daguerre_2003 <- within(daguerre_2003, rm(Day, Month, WaterYear))
daguerre_2003$Max <- as.numeric(daguerre_2003$Max)
daguerre_2003$Min <- as.numeric(daguerre_2003$Min)
daguerre_2003$Mean <- as.numeric(daguerre_2003$Mean)
daguerre_2003 <- daguerre_2003[,c(4,1,2,3)]


daguerre_2004_31_42 <- extract_tables(
  file='S:/DWR/VOL1/BayDeltaDRV/Tributaries/Yuba River/Yuba_Temperature_Compilation/Yuba_Temperature_Work/Yuba Compliance WY 2003-2004/2003_04_anncomprpt_ocr.pdf',
  output = "data.frame",
  pages = c(31,32,33,34,35,36,37,38,39,40,41,42),
  guess=FALSE
)

daguerre_2004_31_42_df <- NULL

for (i in 1:12){
  names(daguerre_2004_31_42[[i]]) <- daguerre_2004_31_42[[i]][4,]
  daguerre_2004_31_42[[i]] <- daguerre_2004_31_42[[i]][-c(1:4),]
  daguerre_2004_31_42[[i]] <- separate(daguerre_2004_31_42[[i]], 2, into=c("Max", "Min"), sep=" ")
  daguerre_2004_31_42_df <- rbind(daguerre_2004_31_42_df, daguerre_2004_31_42[[i]])
}

daguerre_2004 <- NULL
daguerre_2004 <- rbind(daguerre_2004, daguerre_2004_31_42_df)
daguerre_2004$ WaterYear <- c(rep(2003, 92), rep(2004, 274))
daguerre_2004$Month <- c(rep(10,31), rep(11,30), rep(12,31), rep(1,31), rep(2,29), rep(3,31), rep(4,30), rep(5,31), rep(6,30), rep(7,31), rep(8,31), rep(9,30))
daguerre_2004 <- daguerre_2004 %>% rename(Day=Date, Mean=Average)
daguerre_2004$Date <- as.Date(with(daguerre_2004, paste(WaterYear, Month, Day,sep="-")), "%Y-%m-%d")
daguerre_2004 <- within(daguerre_2004, rm(Day, Month, WaterYear))
daguerre_2004$Max <- as.numeric(daguerre_2004$Max)
daguerre_2004$Min <- as.numeric(daguerre_2004$Min)
daguerre_2004$Mean <- as.numeric(daguerre_2004$Mean)
daguerre_2004 <- daguerre_2004[,c(4,1,2,3)]


# no data October 5, 2005-January 18, 2006 & June 15,2006-August 2,2006
daguerre_2005 <- NULL

for (i in 1:12){
  daguerre_2005<- bind_rows(daguerre_2005, read.xlsx(file='S:/DWR/VOL1/BayDeltaDRV/Tributaries/Yuba River/Yuba_Temperature_Compilation/Yuba_Temperature_Work/Yuba Compliance WY 2004-2005/YCWA Annual Operation Report WY04-05/Daguerra Temperatures.xls', sheetIndex=i, header=TRUE, colClasses = "numeric", startRow = 2))
}
daguerre_2005 <- select(daguerre_2005, -c(NA.))

daguerre_2005$ WaterYear <- c(rep(2004, 92), rep(2005, 273))
daguerre_2005$Month <- c(rep(10,31), rep(11,30), rep(12,31), rep(1,31), rep(2,28), rep(3,31), rep(4,30), rep(5,31), rep(6,30), rep(7,31), rep(8,31), rep(9,30))
daguerre_2005 <- daguerre_2005 %>% rename(Day=Date, Max=Maximum, Min=Minimum, Mean=Average)
daguerre_2005$Date <- as.Date(with(daguerre_2005, paste(WaterYear, Month, Day,sep="-")), "%Y-%m-%d")
daguerre_2005 <- within(daguerre_2005, rm(Day, Month, WaterYear))
daguerre_2005 <- daguerre_2005[,c(4,1,2,3)]
daguerre_2005$Date <- seq.Date(from=daguerre_2005$Date[1], length.out = dim(daguerre_2005)[1], by="day")



daguerre_2006 <- NULL
for (i in 2:13){
   daguerre_2006<- bind_rows(daguerre_2006, read.xlsx(file='S:/DWR/VOL1/BayDeltaDRV/Tributaries/Yuba River/Yuba_Temperature_Compilation/Yuba_Temperature_Work/Yuba Compliance WY 2005-2006/annual operations report/Daguerra Temperatures.xls', 
                                                      sheetIndex=i, header=TRUE, colClasses = "numeric"))
 }
daguerre_2006 <- select(daguerre_2006, -c(NA.))
daguerre_2006 <- daguerre_2006[-c(32,33,34,35,36),]

daguerre_2006$ WaterYear <- c(rep(2005, 92), rep(2006, 273))
daguerre_2006$Month <- c(rep(10,31), rep(11,30), rep(12,31), rep(1,31), rep(2,28), rep(3,31), rep(4,30), rep(5,31), rep(6,30), rep(7,31), rep(8,31), rep(9,30))
daguerre_2006 <- daguerre_2006 %>% rename(Day=Date, Max=Maximum, Min=Minimum, Mean=Average)
daguerre_2006$Date <- as.Date(with(daguerre_2006, paste(WaterYear, Month, Day,sep="-")), "%Y-%m-%d")
daguerre_2006 <- within(daguerre_2006, rm(Day, Month, WaterYear))
daguerre_2006 <- daguerre_2006[,c(4,1,2,3)]


daguerre_2007 <- NULL
for (i in 1:12){
  daguerre_2007<- bind_rows(daguerre_2007, read.xlsx(file='S:/DWR/VOL1/BayDeltaDRV/Tributaries/Yuba River/Yuba_Temperature_Compilation/Yuba_Temperature_Work/Yuba Compliance WY 2006-2007/2007 Annual Report/Temperatures @ Daguerra.xls', sheetIndex=i, header=TRUE, colClasses = "numeric", startRow = 2))
}
daguerre_2007 <- select(daguerre_2007, -c(NA.))
daguerre_2007 <- daguerre_2007[-c(32,33,34,35,36),]

daguerre_2007$ WaterYear <- c(rep(2006, 92), rep(2007, 273))
daguerre_2007$Month <- c(rep(10,31), rep(11,30), rep(12,31), rep(1,31), rep(2,28), rep(3,31), rep(4,30), rep(5,31), rep(6,30), rep(7,31), rep(8,31), rep(9,30))
daguerre_2007 <- daguerre_2007 %>% rename(Day=Date, Max=Maximum, Min=Minimum, Mean=Average)
daguerre_2007$Date <- as.Date(with(daguerre_2007, paste(WaterYear, Month, Day,sep="-")), "%Y-%m-%d")
daguerre_2007 <- within(daguerre_2007, rm(Day, Month, WaterYear))
daguerre_2007 <- daguerre_2007[,c(4,1,2,3)]


daguerre_2008_31_42 <- extract_tables(
  file='S:/DWR/VOL1/BayDeltaDRV/Tributaries/Yuba River/Yuba_Temperature_Compilation/Yuba_Temperature_Work/Yuba Compliance WY 2007-2008/2008 SWRCB Annual Rpt Final.pdf',
  output = "data.frame",
  pages = c(31,32,33,34,35,36,37,38,39,40,41,42),
  guess=FALSE
)

daguerre_2008_31_42_df <- NULL

for (i in 1:12){
  names(daguerre_2008_31_42[[i]]) <- daguerre_2008_31_42[[i]][4,]
  daguerre_2008_31_42[[i]] <- daguerre_2008_31_42[[i]][-c(1:4),]
  daguerre_2008_31_42[[i]] <- separate(daguerre_2008_31_42[[i]], 2, into=c("Maximum", "Minimum", "Average"), sep=" ")
  daguerre_2008_31_42_df <- rbind(daguerre_2008_31_42_df, daguerre_2008_31_42[[i]])
}

daguerre_2008 <- NULL
daguerre_2008 <- rbind(daguerre_2008, daguerre_2008_31_42_df)
daguerre_2008$ WaterYear <- c(rep(2007, 92), rep(2008, 274))
daguerre_2008$Month <- c(rep(10,31), rep(11,30), rep(12,31), rep(1,31), rep(2,29), rep(3,31), rep(4,30), rep(5,31), rep(6,30), rep(7,31), rep(8,31), rep(9,30))
daguerre_2008 <- daguerre_2008 %>% rename(Day=Date, Max=Maximum, Min=Minimum, Mean=Average)
daguerre_2008$Date <- as.Date(with(daguerre_2008, paste(WaterYear, Month, Day,sep="-")), "%Y-%m-%d")
daguerre_2008 <- within(daguerre_2008, rm(Day, Month, WaterYear))
daguerre_2008$Max <- as.numeric(daguerre_2008$Max)
daguerre_2008$Min <- as.numeric(daguerre_2008$Min)
daguerre_2008$Mean <- as.numeric(daguerre_2008$Mean)
daguerre_2008 <- daguerre_2008[,c(4,1,2,3)]
daguerre_2009_31_42 <- extract_tables(
  file='S:/DWR/VOL1/BayDeltaDRV/Tributaries/Yuba River/Yuba_Temperature_Compilation/Yuba_Temperature_Work/Yuba Compliance WY 2008-2009/Annual Operations Report/Annual State Water Resources Control Board Report.pdf',
  output = "data.frame",
  pages = c(31,32,33,34,35,36,37,38,39,40,41,42),
  guess=TRUE
)

daguerre_2009_31_42_df <- NULL

for (i in 1:12){
  daguerre_2009_31_42_df <- bind_rows(daguerre_2009_31_42_df, daguerre_2009_31_42[[i]])
}

daguerre_2009 <- NULL
daguerre_2009 <- rbind(daguerre_2009, daguerre_2009_31_42_df)
daguerre_2009$ WaterYear <- c(rep(2008, 92), rep(2009, 273))
daguerre_2009$Month <- c(rep(10,31), rep(11,30), rep(12,31), rep(1,31), rep(2,28), rep(3,31), rep(4,30), rep(5,31), rep(6,30), rep(7,31), rep(8,31), rep(9,30))
daguerre_2009 <- daguerre_2009 %>% rename(Day=Date, Max=Maximum, Min=Minimum, Mean=Average)
daguerre_2009$Date <- as.Date(with(daguerre_2009, paste(WaterYear, Month, Day,sep="-")), "%Y-%m-%d")
daguerre_2009 <- within(daguerre_2009, rm(Day, Month, WaterYear))
daguerre_2009 <- daguerre_2009[,c(4,1,2,3)]

daguerre_2010_31_42 <- extract_tables(
  file='S:/DWR/VOL1/BayDeltaDRV/Tributaries/Yuba River/Yuba_Temperature_Compilation/Yuba_Temperature_Work/Yuba Compliance WY 2009-2010/SWRCB D-1644 Annual Report Ending 9-30-10.pdf',
  output = "data.frame",
  pages = c(31,32,33,34,35,36,37,38,39,40,41,42),
  guess=TRUE
)

daguerre_2010_31_42_df <- NULL

for (i in 1:12){
  daguerre_2010_31_42_df <- bind_rows(daguerre_2010_31_42_df, daguerre_2010_31_42[[i]])
}

daguerre_2010 <- NULL
daguerre_2010 <- rbind(daguerre_2010, daguerre_2010_31_42_df)
daguerre_2010$ WaterYear <- c(rep(2009, 92), rep(2010, 273))
daguerre_2010$Month <- c(rep(10,31), rep(11,30), rep(12,31), rep(1,31), rep(2,28), rep(3,31), rep(4,30), rep(5,31), rep(6,30), rep(7,31), rep(8,31), rep(9,30))
daguerre_2010 <- daguerre_2010 %>% rename(Day=Date, Max=Maximum, Min=Minimum, Mean=Average)
daguerre_2010$Date <- as.Date(with(daguerre_2010, paste(WaterYear, Month, Day,sep="-")), "%Y-%m-%d")
daguerre_2010 <- within(daguerre_2010, rm(Day, Month, WaterYear))
daguerre_2010 <- daguerre_2010[,c(4,1,2,3)]

daguerre_2011_31_42 <- extract_tables(
  file='S:/DWR/VOL1/BayDeltaDRV/Tributaries/Yuba River/Yuba_Temperature_Compilation/Yuba_Temperature_Work/Yuba Compliance WY 2010-2011/SWRCB 2011 Compliance Report final.pdf',
  output = "data.frame",
  pages = c(30,31,32,33,34,35,36,37,38,39,40,41),
  guess=TRUE
)

daguerre_2011_31_42_df <- NULL

for (i in 1:12){
  daguerre_2011_31_42_df <- bind_rows(daguerre_2011_31_42_df, daguerre_2011_31_42[[i]])
}

daguerre_2011 <- NULL
daguerre_2011 <- rbind(daguerre_2011, daguerre_2011_31_42_df)
daguerre_2011$ WaterYear <- c(rep(2010, 92), rep(2011, 273))
daguerre_2011$Month <- c(rep(10,31), rep(11,30), rep(12,31), rep(1,31), rep(2,28), rep(3,31), rep(4,30), rep(5,31), rep(6,30), rep(7,31), rep(8,31), rep(9,30))
daguerre_2011 <- daguerre_2011 %>% rename(Day=Date, Max=Maximum, Min=Minimum)
daguerre_2011$Date <- as.Date(with(daguerre_2011, paste(WaterYear, Month, Day,sep="-")), "%Y-%m-%d")
daguerre_2011 <- within(daguerre_2011, rm(Day, Month, WaterYear))
daguerre_2011 <- daguerre_2011[,c(4,1,2,3)]

daguerre_2012_32_43 <- extract_tables(
  file='S:/DWR/VOL1/BayDeltaDRV/Tributaries/Yuba River/Yuba_Temperature_Compilation/Yuba_Temperature_Work/Yuba Compliance WY 2011-2012/SWRCB 2012 An Rpt.pdf',
  output = "data.frame",
  pages = c(32,33,34,35,36,37,38,39,40,41,42,43),
  guess=TRUE
)

daguerre_2012_32_43_df <- NULL

for (i in 1:12){
  daguerre_2012_32_43_df <- bind_rows(daguerre_2012_32_43_df, daguerre_2012_32_43[[i]])
}

daguerre_2012 <- NULL
daguerre_2012 <- rbind(daguerre_2012, daguerre_2012_32_43_df)
daguerre_2012$ WaterYear <- c(rep(2011, 92), rep(2012, 274))
daguerre_2012$Month <- c(rep(10,31), rep(11,30), rep(12,31), rep(1,31), rep(2,29), rep(3,31), rep(4,30), rep(5,31), rep(6,30), rep(7,31), rep(8,31), rep(9,30))
daguerre_2012 <- daguerre_2012 %>% rename(Day=Date, Max=Maximum, Min=Minimum)
daguerre_2012$Date <- as.Date(with(daguerre_2012, paste(WaterYear, Month, Day,sep="-")), "%Y-%m-%d")
daguerre_2012 <- within(daguerre_2012, rm(Day, Month, WaterYear))
daguerre_2012 <- daguerre_2012[,c(4,1,2,3)]


daguerre_2013_31_42 <- extract_tables(
  file='S:/DWR/VOL1/BayDeltaDRV/Tributaries/Yuba River/Yuba_Temperature_Compilation/Yuba_Temperature_Work/Yuba Compliance WY 2012-2013/YCWA SWRCB 2013 Annual Report.pdf',
  output = "data.frame",
  pages = c(31,32,33,34,35,36,37,38,39,40,41,42),
  guess=TRUE
)

daguerre_2013_31_42_df <- NULL

for (i in 1:12){
  daguerre_2013_31_42_df <- bind_rows(daguerre_2013_31_42_df, daguerre_2013_31_42[[i]])
}

daguerre_2013 <- NULL
daguerre_2013 <- rbind(daguerre_2013, daguerre_2013_31_42_df)
daguerre_2013$ WaterYear <- c(rep(2012, 92), rep(2013, 273))
daguerre_2013$Month <- c(rep(10,31), rep(11,30), rep(12,31), rep(1,31), rep(2,28), rep(3,31), rep(4,30), rep(5,31), rep(6,30), rep(7,31), rep(8,31), rep(9,30))
daguerre_2013 <- daguerre_2013 %>% rename(Day=Date, Max=Maximum, Min=Minimum)
daguerre_2013$Date <- as.Date(with(daguerre_2013, paste(WaterYear, Month, Day,sep="-")), "%Y-%m-%d")
daguerre_2013 <- within(daguerre_2013, rm(Day, Month, WaterYear))
daguerre_2013 <- daguerre_2013[,c(4,1,2,3)]

daguerre_2014_33_44 <- extract_tables(
  file='S:/DWR/VOL1/BayDeltaDRV/Tributaries/Yuba River/Yuba_Temperature_Compilation/Yuba_Temperature_Work/Yuba Compliance WY 2013-2014/SWRCB 2014 Annual Compliance Report.pdf',
  output = "data.frame",
  pages = c(33,34,35,36,37,38,39,40,41,42,43,44),
  guess=TRUE
)

daguerre_2014_33_44_df <- NULL

for (i in 1:12){
  daguerre_2014_33_44_df <- bind_rows(daguerre_2014_33_44_df, daguerre_2014_33_44[[i]])
}

daguerre_2014 <- NULL
daguerre_2014 <- rbind(daguerre_2014, daguerre_2014_33_44_df)
daguerre_2014$ WaterYear <- c(rep(2013, 92), rep(2014, 273))
daguerre_2014$Month <- c(rep(10,31), rep(11,30), rep(12,31), rep(1,31), rep(2,28), rep(3,31), rep(4,30), rep(5,31), rep(6,30), rep(7,31), rep(8,31), rep(9,30))
daguerre_2014 <- daguerre_2014 %>% rename(Day=Date)
daguerre_2014$Date <- as.Date(with(daguerre_2014, paste(WaterYear, Month, Day,sep="-")), "%Y-%m-%d")
daguerre_2014 <- within(daguerre_2014, rm(Day, Month, WaterYear))
daguerre_2014 <- daguerre_2014[,c(4,1,2,3)]

daguerre_2015_32 <- extract_tables(
  file='S:/DWR/VOL1/BayDeltaDRV/Tributaries/Yuba River/Yuba_Temperature_Compilation/Yuba_Temperature_Work/Yuba Compliance WY 2014-2015/YCWA D-1644 2015 Annual Compliance Rep 12-29-15.pdf',
  output = "data.frame",
  pages = c(32),
  guess=FALSE
)
names(daguerre_2015_32[[1]]) <- daguerre_2015_32[[1]][4,]
daguerre_2015_32[[1]] <- daguerre_2015_32[[1]][-c(1:4),]
daguerre_2015_32[[1]] <- daguerre_2015_32[[1]][-31]
df_32 <- data.frame(matrix(unlist(daguerre_2015_32[[1]]), nrow=length(daguerre_2015_32[[1]]), byrow=T))
df_32 <- separate(df_32, 1, into=c("Date", "Max", "Min", "Mean"), sep=" ")
df_32$Date <- as.integer(df_32$Date)
df_32$Max <- as.numeric(df_32$Max)
df_32$Min <- as.numeric(df_32$Min)
df_32$Mean <- as.numeric(df_32$Mean)

daguerre_2015_31 <- extract_tables(
  file='S:/DWR/VOL1/BayDeltaDRV/Tributaries/Yuba River/Yuba_Temperature_Compilation/Yuba_Temperature_Work/Yuba Compliance WY 2014-2015/YCWA D-1644 2015 Annual Compliance Rep 12-29-15.pdf',
  output = "data.frame",
  pages = c(31),
  guess=TRUE
)

daguerre_2015_31_42_df <- NULL

for (i in 1){
  daguerre_2015_31_42_df <- bind_rows(daguerre_2015_31_42_df, daguerre_2015_31[[i]])
}

daguerre_2015_31_42_df <- bind_rows(daguerre_2015_31_42_df, df_32)

daguerre_2015_33_42 <- extract_tables(
  file='S:/DWR/VOL1/BayDeltaDRV/Tributaries/Yuba River/Yuba_Temperature_Compilation/Yuba_Temperature_Work/Yuba Compliance WY 2014-2015/YCWA D-1644 2015 Annual Compliance Rep 12-29-15.pdf',
  output = "data.frame",
  pages = c(33:42),
  guess=TRUE
)
for (i in 1:10){
  daguerre_2015_31_42_df <- bind_rows(daguerre_2015_31_42_df, daguerre_2015_33_42[[i]])
}

daguerre_2015 <- NULL

daguerre_2015 <- rbind(daguerre_2015, daguerre_2015_31_42_df)
daguerre_2015$ WaterYear <- c(rep(2014, 92), rep(2015, 273))
daguerre_2015$Month <- c(rep(10,31), rep(11,30), rep(12,31), rep(1,31), rep(2,28), rep(3,31), rep(4,30), rep(5,31), rep(6,30), rep(7,31), rep(8,31), rep(9,30))
daguerre_2015 <- daguerre_2015 %>% rename(Day=Date)
daguerre_2015$Date <- as.Date(with(daguerre_2015, paste(WaterYear, Month, Day,sep="-")), "%Y-%m-%d")
daguerre_2015 <- within(daguerre_2015, rm(Day, Month, WaterYear))
daguerre_2015 <- daguerre_2015[,c(4,1,2,3)]


daguerre_2016_19_54 <- extract_tables(
  file='S:/DWR/VOL1/BayDeltaDRV/Tributaries/Yuba River/Yuba_Temperature_Compilation/Yuba_Temperature_Work/Yuba Compliance WY 2015-2016/2016 RD1644 Final.pdf',
  output = "data.frame",
  pages = c(20,23,26,29,32,35,38,41,44,47,50,53),
  guess=TRUE
)

daguerre_2016_19_54_df <- NULL

for (i in 1:12){
  daguerre_2016_19_54_df <- bind_rows(daguerre_2016_19_54_df, daguerre_2016_19_54[[i]])
}

daguerre_2016 <- NULL
daguerre_2016 <- rbind(daguerre_2016, daguerre_2016_19_54_df)
daguerre_2016$ WaterYear <- c(rep(2015, 92), rep(2016, 274))
daguerre_2016$Month <- c(rep(10,31), rep(11,30), rep(12,31), rep(1,31), rep(2,29), rep(3,31), rep(4,30), rep(5,31), rep(6,30), rep(7,31), rep(8,31), rep(9,30))
daguerre_2016 <- daguerre_2016 %>% rename(Day=Date)
daguerre_2016$Date <- as.Date(with(daguerre_2016, paste(WaterYear, Month, Day,sep="-")), "%Y-%m-%d")
daguerre_2016 <- within(daguerre_2016, rm(Day, Month, WaterYear))
daguerre_2016 <- daguerre_2016[,c(4,1,2,3)]

daguerre_2017_19_54 <- extract_tables(
  file='S:/DWR/VOL1/BayDeltaDRV/Tributaries/Yuba River/Yuba_Temperature_Compilation/Yuba_Temperature_Work/Yuba Compliance WY 2016-2017/2017 RD1644 Final v2.pdf',
  output = "data.frame",
  pages = c(20,23,26,29,32,35,38,41,44,47,50,53),
  guess=TRUE
)

daguerre_2017_19_54_df <- NULL

for (i in 1:12){
  daguerre_2017_19_54_df <- bind_rows(daguerre_2017_19_54_df, daguerre_2017_19_54[[i]])
}

daguerre_2017 <- NULL
daguerre_2017 <- rbind(daguerre_2017, daguerre_2017_19_54_df)
daguerre_2017$ WaterYear <- c(rep(2016, 92), rep(2017, 273))
daguerre_2017$Month <- c(rep(10,31), rep(11,30), rep(12,31), rep(1,31), rep(2,28), rep(3,31), rep(4,30), rep(5,31), rep(6,30), rep(7,31), rep(8,31), rep(9,30))
daguerre_2017 <- daguerre_2017 %>% rename(Day=Date)
daguerre_2017$Date <- as.Date(with(daguerre_2017, paste(WaterYear, Month, Day,sep="-")), "%Y-%m-%d")
daguerre_2017 <- within(daguerre_2017, rm(Day, Month, WaterYear))
daguerre_2017 <- daguerre_2017[,c(4,1,2,3)]

daguerre_2018_19_54 <- extract_tables(
  file='S:/DWR/VOL1/BayDeltaDRV/Tributaries/Yuba River/Yuba_Temperature_Compilation/Yuba_Temperature_Work/Yuba Compliance WY 2017-2018/2018 RD1644 Final Report.pdf',
  output = "data.frame",
  pages = c(20,23,26,29,32,35,38,41,44,47,50,53),
  guess=TRUE
)

daguerre_2018_19_54[[7]][daguerre_2018_19_54[[7]]=='N/A'] <- NA
daguerre_2018_19_54[[7]]$Max <- as.numeric(daguerre_2018_19_54[[7]]$Max)
daguerre_2018_19_54[[7]]$Min <- as.numeric(daguerre_2018_19_54[[7]]$Min)
daguerre_2018_19_54[[7]]$Mean <- as.numeric(daguerre_2018_19_54[[7]]$Mean)


daguerre_2018_19_54_df <- NULL

for (i in 1:12){
  daguerre_2018_19_54_df <- bind_rows(daguerre_2018_19_54_df, daguerre_2018_19_54[[i]])
}

daguerre_2018 <- NULL
daguerre_2018 <- rbind(daguerre_2018, daguerre_2018_19_54_df)
daguerre_2018$ WaterYear <- c(rep(2017, 92), rep(2018, 273))
daguerre_2018$Month <- c(rep(10,31), rep(11,30), rep(12,31), rep(1,31), rep(2,28), rep(3,31), rep(4,30), rep(5,31), rep(6,30), rep(7,31), rep(8,31), rep(9,30))
daguerre_2018 <- daguerre_2018 %>% rename(Day=Date)
daguerre_2018$Date <- as.Date(with(daguerre_2018, paste(WaterYear, Month, Day,sep="-")), "%Y-%m-%d")
daguerre_2018 <- within(daguerre_2018, rm(Day, Month, WaterYear))
daguerre_2018 <- daguerre_2018[,c(4,1,2,3)]

daguerre_2019_19_54 <- extract_tables(
  file='S:/DWR/VOL1/BayDeltaDRV/Tributaries/Yuba River/Yuba_Temperature_Compilation/Yuba_Temperature_Work/2019 RD1644 Final Report.pdf',
  output = "data.frame",
  pages = c(20,23,26,29,32,35,38,41,44,47,50,53),
  guess=TRUE
)

daguerre_2019_19_54[[11]][daguerre_2019_19_54[[11]]=='N/A'] <- NA
daguerre_2019_19_54[[11]]$Max <- as.numeric(daguerre_2019_19_54[[11]]$Max)
daguerre_2019_19_54[[11]]$Min <- as.numeric(daguerre_2019_19_54[[11]]$Min)
daguerre_2019_19_54[[11]]$Mean <- as.numeric(daguerre_2019_19_54[[11]]$Mean)

daguerre_2019_19_54[[10]][daguerre_2019_19_54[[10]]=='N/A'] <- NA
daguerre_2019_19_54[[10]]$Max <- as.numeric(daguerre_2019_19_54[[10]]$Max)
daguerre_2019_19_54[[10]]$Min <- as.numeric(daguerre_2019_19_54[[10]]$Min)
daguerre_2019_19_54[[10]]$Mean <- as.numeric(daguerre_2019_19_54[[10]]$Mean)


daguerre_2019_19_54_df <- NULL

for (i in 1:12){
  daguerre_2019_19_54_df <- bind_rows(daguerre_2019_19_54_df, daguerre_2019_19_54[[i]])
}

daguerre_2019 <- NULL
daguerre_2019 <- rbind(daguerre_2019, daguerre_2019_19_54_df)
daguerre_2019$ WaterYear <- c(rep(2018, 92), rep(2019, 273))
daguerre_2019$Month <- c(rep(10,31), rep(11,30), rep(12,31), rep(1,31), rep(2,28), rep(3,31), rep(4,30), rep(5,31), rep(6,30), rep(7,31), rep(8,31), rep(9,30))
daguerre_2019 <- daguerre_2019 %>% rename(Day=Date)
daguerre_2019$Date <- as.Date(with(daguerre_2019, paste(WaterYear, Month, Day,sep="-")), "%Y-%m-%d")
daguerre_2019 <- within(daguerre_2019, rm(Day, Month, WaterYear))
daguerre_2019 <- daguerre_2019[,c(4,1,2,3)]


daguerre_data <- bind_rows(daguerre_2001,
                       daguerre_2002,
                       daguerre_2003, 
                       daguerre_2004, 
                       daguerre_2005,
                       daguerre_2006,
                       daguerre_2007,
                       daguerre_2008,
                       daguerre_2009,
                       daguerre_2010,
                       daguerre_2011,
                       daguerre_2012,
                       daguerre_2013,
                       daguerre_2014,
                       daguerre_2015,
                       daguerre_2016,
                       daguerre_2017,
                       daguerre_2018,
                       daguerre_2019)

daguerre_data[934,4] <- 51.18
daguerre_data[50,2] <- 55.38
daguerre_data[1173,2] <- 62.99
daguerre_data[1173,3] <- 54.21

daguerre_full <- daguerre_data %>% pad
write.csv(daguerre_full, "S:/DWR/VOL1/BayDeltaDRV/Tributaries/Yuba River/Yuba_Temperature_Compilation/Yuba_Temperature_Work/Complete Time Series/Daguerre.csv")