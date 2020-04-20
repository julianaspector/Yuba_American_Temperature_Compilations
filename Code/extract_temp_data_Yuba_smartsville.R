library(tidyverse)
library(tabulizer)
library(xlsx)
library(padr)
library(zoo)

smartsville_2001_14_20 <- extract_tables(
  file='S:/DWR/VOL1/BayDeltaDRV/Tributaries/Yuba River/Yuba_Temperature_Compilation/Yuba_Temperature_Work/Yuba Compliance WY 2000-2001/2000_01_anncomprpt_ocr.pdf',
  output = "data.frame",
  pages = c(14,15,16,17,18,19,20),
  guess=FALSE
)

smartsville_2001_14_20_df <- NULL

for (i in 1:5){
  smartsville_2001_14_20[[i]]<-smartsville_2001_14_20[[i]] %>% select(c("X.1", "X.2", "Yuba.County.Water.Agency"))
  smartsville_2001_14_20[[i]] <- head(smartsville_2001_14_20[[i]], -1)
  smartsville_2001_14_20[[i]] <- smartsville_2001_14_20[[i]][-c(1:2),]
  smartsville_2001_14_20[[i]] <- separate(smartsville_2001_14_20[[i]], 3, into=c("Min", "Mean"), sep=" ")
  smartsville_2001_14_20[[i]] <- smartsville_2001_14_20[[i]] %>% rename(Date=X.1, Max=X.2)
  smartsville_2001_14_20_df <- rbind(smartsville_2001_14_20_df, smartsville_2001_14_20[[i]])
}


for (i in 6){
  smartsville_2001_14_20[[i]]<-smartsville_2001_14_20[[i]] %>% select(c("X.1", "X.2", "Yuba.county.Water.Agency"))
  smartsville_2001_14_20[[i]] <- head(smartsville_2001_14_20[[i]], -1)
  smartsville_2001_14_20[[i]] <- smartsville_2001_14_20[[i]][-c(1:2),]
  smartsville_2001_14_20[[i]] <- separate(smartsville_2001_14_20[[i]], 3, into=c("Min", "Mean"), sep=" ")
  smartsville_2001_14_20[[i]] <- smartsville_2001_14_20[[i]] %>% rename(Date=X.1, Max=X.2)
  smartsville_2001_14_20_df <- rbind(smartsville_2001_14_20_df, smartsville_2001_14_20[[i]])
}

for (i in 7){
  smartsville_2001_14_20[[i]]<-smartsville_2001_14_20[[i]] %>% select(c("X.1", "X.2", "Yuba.County.Water.Agency"))
  smartsville_2001_14_20[[i]] <- head(smartsville_2001_14_20[[i]], -1)
  smartsville_2001_14_20[[i]] <- smartsville_2001_14_20[[i]][-c(1:2),]
  smartsville_2001_14_20[[i]] <- separate(smartsville_2001_14_20[[i]], 3, into=c("Min", "Mean"), sep=" ")
  smartsville_2001_14_20[[i]] <- smartsville_2001_14_20[[i]] %>% rename(Date=X.1, Max=X.2)
  smartsville_2001_14_20_df <- rbind(smartsville_2001_14_20_df, smartsville_2001_14_20[[i]])
}

smartsville_2001 <- NULL
smartsville_2001 <- rbind(smartsville_2001, smartsville_2001_14_20_df)
smartsville_2001$Date <- gsub('/', '-', smartsville_2001$Date)
smartsville_2001$Date <- as.Date(smartsville_2001$Date, "%m-%d-%Y")
smartsville_2001$Date <- seq.Date(from=smartsville_2001$Date[1], length.out = dim(smartsville_2001)[1], by="day")
smartsville_2001$Max <- as.numeric(smartsville_2001$Max)
smartsville_2001$Min <- as.numeric(smartsville_2001$Min)
smartsville_2001$Mean <- as.numeric(smartsville_2001$Mean)


smartsville_2002_19_30 <- extract_tables(
  file='S:/DWR/VOL1/BayDeltaDRV/Tributaries/Yuba River/Yuba_Temperature_Compilation/Yuba_Temperature_Work/Yuba Compliance WY 2002-2003/Yuba12-31-02ComplianceReport_ann_02_ocr.pdf',
  output = "data.frame",
  pages = c(19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30),
  guess=FALSE
)

smartsville_2002_19_30_df <- NULL

for (i in 1){
  smartsville_2002_19_30[[i]] <- smartsville_2002_19_30[[i]][c(3,4,5)]
  smartsville_2002_19_30[[i]] <- head(smartsville_2002_19_30[[i]], -1)
  smartsville_2002_19_30[[i]] <- smartsville_2002_19_30[[i]][-c(1:2),]
  smartsville_2002_19_30[[i]] <- separate(smartsville_2002_19_30[[i]], 3, into=c("Min", "Mean"), sep=" ")
  smartsville_2002_19_30[[i]] <- smartsville_2002_19_30[[i]] %>% rename(Date=1,
                                                                        Max=2)
  smartsville_2002_19_30_df <- rbind(smartsville_2002_19_30_df, smartsville_2002_19_30[[i]])
}
for (i in 2:3){
  smartsville_2002_19_30[[i]] <- smartsville_2002_19_30[[i]][c(2,3,4)]
  smartsville_2002_19_30[[i]] <- head(smartsville_2002_19_30[[i]], -1)
  smartsville_2002_19_30[[i]] <- smartsville_2002_19_30[[i]][-c(1:2),]
  smartsville_2002_19_30[[i]] <- separate(smartsville_2002_19_30[[i]],3, into=c("Min","Mean"), sep=" ")
  smartsville_2002_19_30[[i]] <- smartsville_2002_19_30[[i]] %>% rename(Date=1, Max=2)
  smartsville_2002_19_30_df <- rbind(smartsville_2002_19_30_df, smartsville_2002_19_30[[i]])
}

for (i in 4){
  smartsville_2002_19_30[[i]] <- smartsville_2002_19_30[[i]][c(2,3)]
  smartsville_2002_19_30[[i]] <- head(smartsville_2002_19_30[[i]], -1)
  smartsville_2002_19_30[[i]] <- smartsville_2002_19_30[[i]][-c(1:2),]
  smartsville_2002_19_30[[i]] <- separate(smartsville_2002_19_30[[i]],2, into=c("Max","Min","Mean"), sep=" ")
  smartsville_2002_19_30[[i]] <- smartsville_2002_19_30[[i]] %>% rename(Date=1)
  smartsville_2002_19_30_df <- rbind(smartsville_2002_19_30_df, smartsville_2002_19_30[[i]])
}

for (i in 5){
  smartsville_2002_19_30[[i]] <- smartsville_2002_19_30[[i]][c(2,3,4)]
  smartsville_2002_19_30[[i]] <- head(smartsville_2002_19_30[[i]], -1)
  smartsville_2002_19_30[[i]] <- smartsville_2002_19_30[[i]][-c(1:2),]
  smartsville_2002_19_30[[i]] <- separate(smartsville_2002_19_30[[i]],3, into=c("Min","Mean"), sep=" ")
  smartsville_2002_19_30[[i]] <- smartsville_2002_19_30[[i]] %>% rename(Date=1, Max=2)
  smartsville_2002_19_30_df <- rbind(smartsville_2002_19_30_df, smartsville_2002_19_30[[i]])
}
for (i in 6:7){
  smartsville_2002_19_30[[i]] <- smartsville_2002_19_30[[i]][c(2,3)]
  smartsville_2002_19_30[[i]] <- head(smartsville_2002_19_30[[i]], -1)
  smartsville_2002_19_30[[i]] <- smartsville_2002_19_30[[i]][-c(1:2),]
  smartsville_2002_19_30[[i]] <- separate(smartsville_2002_19_30[[i]],2, into=c("Max","Min","Mean"), sep=" ")
  smartsville_2002_19_30[[i]] <- smartsville_2002_19_30[[i]] %>% rename(Date=1)
  smartsville_2002_19_30_df <- rbind(smartsville_2002_19_30_df, smartsville_2002_19_30[[i]])
}

for (i in 8:11){
  smartsville_2002_19_30[[i]] <- smartsville_2002_19_30[[i]][c(2,3,4)]
  smartsville_2002_19_30[[i]] <- head(smartsville_2002_19_30[[i]], -1)
  smartsville_2002_19_30[[i]] <- smartsville_2002_19_30[[i]][-c(1:2),]
  smartsville_2002_19_30[[i]] <- separate(smartsville_2002_19_30[[i]],3, into=c("Min","Mean"), sep=" ")
  smartsville_2002_19_30[[i]] <- smartsville_2002_19_30[[i]] %>% rename(Date=1, Max=2)
  smartsville_2002_19_30_df <- rbind(smartsville_2002_19_30_df, smartsville_2002_19_30[[i]])
}

for (i in 12){
  smartsville_2002_19_30[[i]] <- smartsville_2002_19_30[[i]][c(3,4,5)]
  smartsville_2002_19_30[[i]] <- head(smartsville_2002_19_30[[i]], -1)
  smartsville_2002_19_30[[i]] <- smartsville_2002_19_30[[i]][-c(1:2),]
  smartsville_2002_19_30[[i]] <- separate(smartsville_2002_19_30[[i]],3, into=c("Min","Mean"), sep=" ")
  smartsville_2002_19_30[[i]] <- smartsville_2002_19_30[[i]] %>% rename(Date=1, Max=2)
  smartsville_2002_19_30_df <- rbind(smartsville_2002_19_30_df, smartsville_2002_19_30[[i]])
}

smartsville_2002_19_30_df <- na.omit(smartsville_2002_19_30_df)
smartsville_2002_19_30_df$Date <- sub("^$", 1, smartsville_2002_19_30_df$Date)
smartsville_2002_19_30_df <- smartsville_2002_19_30_df %>% add_row(Date=1, Max=51.31, Min=50.47, Mean=50.63, .after=61)
smartsville_2002_19_30_df <- smartsville_2002_19_30_df %>% add_row(Date=1, Max=47.68, Min=44.32, Mean=45.49, .after=122)

smartsville_2002 <- NULL
smartsville_2002 <- rbind(smartsville_2002, smartsville_2002_19_30_df)
smartsville_2002$Max <- as.numeric(smartsville_2002$Max)
smartsville_2002$Min <- as.numeric(smartsville_2002$Min)
smartsville_2002$Mean <- as.numeric(smartsville_2002$Mean)

smartsville_2002$WaterYear <- c(rep(2001, 92), rep(2002, 273))
smartsville_2002$Month <- c(rep(10, 31), rep(11,30), rep(12,31), rep(1,31), rep(2,28), rep(3,31), rep(4,30), rep(5,31), rep(6,30), rep(7,31), rep(8,31), rep(9,30))
smartsville_2002 <- smartsville_2002 %>% rename(Day=Date)
smartsville_2002$Date <- as.Date(with(smartsville_2002, paste(WaterYear, Month, Day,sep="-")), "%Y-%m-%d")
smartsville_2002$Date <- seq.Date(from=smartsville_2002$Date[1], length.out = dim(smartsville_2002)[1], by="day")
smartsville_2002 <- within(smartsville_2002, rm(Day, Month, WaterYear))

smartsville_2002 <- smartsville_2002[,c(4,1,2,3)]


smartsville_2003_19_25 <- extract_tables(
  file='S:/DWR/VOL1/BayDeltaDRV/Tributaries/Yuba River/Yuba_Temperature_Compilation/Yuba_Temperature_Work/Yuba Compliance WY 2002-2003/2003annrpt_ocr.pdf',
  output = "data.frame",
  pages = c(19,20,21,22,23,24,25),
  guess=FALSE
)

smartsville_2003_19_30_df <- NULL

for (i in 1:7){
  names(smartsville_2003_19_25[[i]]) <- smartsville_2003_19_25[[i]][4,]
  smartsville_2003_19_25[[i]] <- smartsville_2003_19_25[[i]][-c(1:4),]
  smartsville_2003_19_25[[i]] <- separate(smartsville_2003_19_25[[i]], 2, into=c("Maximum", "Minimum", "Average"), sep=" ")
  smartsville_2003_19_30_df <- rbind(smartsville_2003_19_30_df, smartsville_2003_19_25[[i]])
}

smartsville_2003_26 <- extract_tables(
  file='S:/DWR/VOL1/BayDeltaDRV/Tributaries/Yuba River/Yuba_Temperature_Compilation/Yuba_Temperature_Work/Yuba Compliance WY 2002-2003/2003annrpt_ocr.pdf',
  output = "data.frame",
  pages = c(26),
  guess=FALSE
)

keeps <- c("X", "X.1")
smartsville_2003_26[[1]] <- smartsville_2003_26[[1]][keeps]
names(smartsville_2003_26[[1]]) <- smartsville_2003_26[[1]][5,]
smartsville_2003_26[[1]] <- smartsville_2003_26[[1]][-c(1:5),]
smartsville_2003_26[[1]] <- separate(smartsville_2003_26[[1]], 2, into=c("Maximum", "Minimum", "Average"), sep=" ")
smartsville_2003_19_30_df <- rbind(smartsville_2003_19_30_df, smartsville_2003_26[[1]])


smartsville_2003_27_30 <- extract_tables(
  file='S:/DWR/VOL1/BayDeltaDRV/Tributaries/Yuba River/Yuba_Temperature_Compilation/Yuba_Temperature_Work/Yuba Compliance WY 2002-2003/2003annrpt_ocr.pdf',
  output = "data.frame",
  pages = c(27,28, 29, 30),
  guess=FALSE
)

for (i in 1:4){
  names(smartsville_2003_27_30[[i]]) <- smartsville_2003_27_30[[i]][4,]
  smartsville_2003_27_30[[i]] <- smartsville_2003_27_30[[i]][-c(1:4),]
  smartsville_2003_27_30[[i]] <- separate(smartsville_2003_27_30[[i]], 2, into=c("Maximum", "Minimum", "Average"), sep=" ")
  smartsville_2003_19_30_df <- rbind(smartsville_2003_19_30_df, smartsville_2003_27_30[[i]])
}

smartsville_2003_19_30_df[299,2] <- 53.11
smartsville_2003_19_30_df[299,3] <- 52.55
smartsville_2003_19_30_df[299,4] <- 52.89
smartsville_2003_19_30_df[304,2] <- 53.11
smartsville_2003_19_30_df[304,3] <- 52.55
smartsville_2003_19_30_df[304,4] <- 52.77

smartsville_2003 <- NULL
smartsville_2003 <- rbind(smartsville_2003, smartsville_2003_19_30_df)
smartsville_2003$ WaterYear <- c(rep(2002, 92), rep(2003, 273))
smartsville_2003$Month <- c(rep(10, 31), rep(11,30), rep(12,31), rep(1,31), rep(2,28), rep(3,31), rep(4,30), rep(5,31), rep(6,30), rep(7,31), rep(8,31), rep(9,30))
smartsville_2003 <- smartsville_2003 %>% rename(Day=Date, Max=Maximum,
                                                Min=Minimum,
                                                Mean=Average)
smartsville_2003$Date <- as.Date(with(smartsville_2003, paste(WaterYear, Month, Day,sep="-")), "%Y-%m-%d")
smartsville_2003 <- within(smartsville_2003, rm(Day, Month, WaterYear))
smartsville_2003$Max <- as.numeric(smartsville_2003$Max)
smartsville_2003$Min <- as.numeric(smartsville_2003$Min)
smartsville_2003$Mean <- as.numeric(smartsville_2003$Mean)
smartsville_2003 <- smartsville_2003[,c(4,1,2,3)]



# no data for August 2004
smartsville_2004_19_30 <- extract_tables(
  file='S:/DWR/VOL1/BayDeltaDRV/Tributaries/Yuba River/Yuba_Temperature_Compilation/Yuba_Temperature_Work/Yuba Compliance WY 2003-2004/2003_04_anncomprpt_ocr.pdf',
  output = "data.frame",
  pages = c(19,20,21,22,23,24,25,26,27,28,30),
  guess=FALSE
)

smartsville_2004_19_30_df <- NULL

for (i in 1:11){
  names(smartsville_2004_19_30[[i]]) <- smartsville_2004_19_30[[i]][4,]
  smartsville_2004_19_30[[i]] <- smartsville_2004_19_30[[i]][-c(1:4),]
  smartsville_2004_19_30[[i]] <- separate(smartsville_2004_19_30[[i]], 2, into=c("Maximum", "Minimum"), sep=" ")
  smartsville_2004_19_30_df <- rbind(smartsville_2004_19_30_df, smartsville_2004_19_30[[i]])
}

smartsville_2004 <- NULL
smartsville_2004 <- rbind(smartsville_2004, smartsville_2004_19_30_df)
smartsville_2004$ WaterYear <- c(rep(2003, 92), rep(2004, 243))
smartsville_2004$Month <- c(rep(10, 31), rep(11,30), rep(12,31), rep(1,31), rep(2,29), rep(3,31), rep(4,30), rep(5,31), rep(6,30), rep(7,31), rep(9,30))
smartsville_2004 <- smartsville_2004 %>% rename(Day=Date,
                                                Max=Maximum,
                                                Min=Minimum,
                                                Mean=Average)
smartsville_2004$Date <- as.Date(with(smartsville_2004, paste(WaterYear, Month, Day,sep="-")), "%Y-%m-%d")
smartsville_2004 <- within(smartsville_2004, rm(Day, Month, WaterYear))
smartsville_2004$Max <- as.numeric(smartsville_2004$Max)
smartsville_2004$Min <- as.numeric(smartsville_2004$Min)
smartsville_2004$Mean <- as.numeric(smartsville_2004$Mean)
smartsville_2004 <- smartsville_2004[,c(4,1,2,3)]

smartsville_2005 <- NULL

for (i in 1:12){
  smartsville_2005<- bind_rows(smartsville_2005, read.xlsx(file='S:/DWR/VOL1/BayDeltaDRV/Tributaries/Yuba River/Yuba_Temperature_Compilation/Yuba_Temperature_Work/Yuba Compliance WY 2004-2005/YCWA Annual Operation Report WY04-05/Smartsville Temperatures.xls', sheetIndex=i, header=TRUE, colClasses = "numeric"))
}
smartsville_2005 <- select(smartsville_2005, -c(NA.))

smartsville_2005$ WaterYear <- c(rep(2004, 92), rep(2005, 273))
smartsville_2005$Month <- c(rep(10, 31), rep(11,30), rep(12,31), rep(1,31), rep(2,28), rep(3,31), rep(4,30), rep(5,31), rep(6,30), rep(7,31), rep(8,31), rep(9,30))
smartsville_2005 <- smartsville_2005 %>% rename(Day=Date,
                                                Max=Maximum,
                                                Min=Minimum,
                                                Mean=Average)
smartsville_2005$Date <- as.Date(with(smartsville_2005, paste(WaterYear, Month, Day,sep="-")), "%Y-%m-%d")
smartsville_2005 <- within(smartsville_2005, rm(Day, Month, WaterYear))
smartsville_2005 <- smartsville_2005[,c(4,1,2,3)]


smartsville_2006 <- NULL

for (i in 2:13){
  smartsville_2006<- bind_rows(smartsville_2006, read.xlsx(file='S:/DWR/VOL1/BayDeltaDRV/Tributaries/Yuba River/Yuba_Temperature_Compilation/Yuba_Temperature_Work/Yuba Compliance WY 2005-2006/annual operations report/Smartsville Temperatures.xls', sheetIndex=i, header=TRUE, colClasses = "numeric"))
}
smartsville_2006 <- select(smartsville_2006, -c(NA.))
smartsville_2006 <- na.omit(smartsville_2006)

smartsville_2006$ WaterYear <- c(rep(2005, 92), rep(2006, 273))
smartsville_2006$Month <- c(rep(10, 31), rep(11,30), rep(12,31), rep(1,31), rep(2,28), rep(3,31), rep(4,30), rep(5,31), rep(6,30), rep(7,31), rep(8,31), rep(9,30))
smartsville_2006 <- smartsville_2006 %>% rename(Day=Date,
                                                Max=Maximum,
                                                Min=Minimum,
                                                Mean=Average)
smartsville_2006$Date <- as.Date(with(smartsville_2006, paste(WaterYear, Month, Day,sep="-")), "%Y-%m-%d")
smartsville_2006 <- within(smartsville_2006, rm(Day, Month, WaterYear))
smartsville_2006 <- smartsville_2006[,c(4,1,2,3)]


smartsville_2007 <- NULL
for (i in 1:12){
  smartsville_2007<- bind_rows(smartsville_2007, read.xlsx(file='S:/DWR/VOL1/BayDeltaDRV/Tributaries/Yuba River/Yuba_Temperature_Compilation/Yuba_Temperature_Work/Yuba Compliance WY 2006-2007/2007 Annual Report/Temperatures @ Smartsville.xls', sheetIndex=i, header=TRUE, colClasses = "numeric"))
}
smartsville_2007 <- select(smartsville_2007, -c(NA.))


smartsville_2007$ WaterYear <- c(rep(2006, 92), rep(2007, 273))
smartsville_2007$Month <- c(rep(10, 31), rep(11,30), rep(12,31), rep(1,31), rep(2,28), rep(3,31), rep(4,30), rep(5,31), rep(6,30), rep(7,31), rep(8,31), rep(9,30))
smartsville_2007 <- smartsville_2007 %>% rename(Day=Date,
                                                Max=Maximum,
                                                Min=Minimum,
                                                Mean=Average)
smartsville_2007$Date <- as.Date(with(smartsville_2007, paste(WaterYear, Month, Day,sep="-")), "%Y-%m-%d")
smartsville_2007 <- within(smartsville_2007, rm(Day, Month, WaterYear))
smartsville_2007 <- smartsville_2007[,c(4,1,2,3)]


smartsville_2008_19_30 <- extract_tables(
  file='S:/DWR/VOL1/BayDeltaDRV/Tributaries/Yuba River/Yuba_Temperature_Compilation/Yuba_Temperature_Work/Yuba Compliance WY 2007-2008/2008 SWRCB Annual Rpt Final.pdf',
  output = "data.frame",
  pages = c(19,20,21,22,23,24,25,26,27,28,29,30),
  guess=FALSE
)

smartsville_2008_19_30_df <- NULL

for (i in 1:12){
  names(smartsville_2008_19_30[[i]]) <- smartsville_2008_19_30[[i]][4,]
  smartsville_2008_19_30[[i]] <- smartsville_2008_19_30[[i]][-c(1:4),]
  smartsville_2008_19_30[[i]] <- separate(smartsville_2008_19_30[[i]], 2, into=c("Maximum", "Minimum", "Average"), sep=" ")
  smartsville_2008_19_30_df <- rbind(smartsville_2008_19_30_df, smartsville_2008_19_30[[i]])
}

smartsville_2008 <- NULL
smartsville_2008 <- rbind(smartsville_2008, smartsville_2008_19_30_df)
smartsville_2008$ WaterYear <- c(rep(2007, 92), rep(2008, 274))
smartsville_2008$Month <- c(rep(10,31), rep(11,30), rep(12,31), rep(1,31), rep(2,29), rep(3,31), rep(4,30), rep(5,31), rep(6,30), rep(7,31), rep(8,31), rep(9,30))
smartsville_2008 <- smartsville_2008 %>% rename(Day=Date, Max=Maximum, Min=Minimum, Mean=Average)
smartsville_2008$Date <- as.Date(with(smartsville_2008, paste(WaterYear, Month, Day,sep="-")), "%Y-%m-%d")
smartsville_2008 <- within(smartsville_2008, rm(Day, Month, WaterYear))
smartsville_2008$Max <- as.numeric(smartsville_2008$Max)
smartsville_2008$Min <- as.numeric(smartsville_2008$Min)
smartsville_2008$Mean <- as.numeric(smartsville_2008$Mean)
smartsville_2008 <- smartsville_2008[,c(4,1,2,3)]
smartsville_2009_19_30 <- extract_tables(
  file='S:/DWR/VOL1/BayDeltaDRV/Tributaries/Yuba River/Yuba_Temperature_Compilation/Yuba_Temperature_Work/Yuba Compliance WY 2008-2009/Annual Operations Report/Annual State Water Resources Control Board Report.pdf',
  output = "data.frame",
  pages = c(19,20,21,22,23,24,25,26,27,28,29,30),
  guess=TRUE
)

smartsville_2009_19_30_df <- NULL

for (i in 1:12){
  smartsville_2009_19_30_df <- bind_rows(smartsville_2009_19_30_df, smartsville_2009_19_30[[i]])
}

smartsville_2009 <- NULL
smartsville_2009 <- rbind(smartsville_2009, smartsville_2009_19_30_df)
smartsville_2009$ WaterYear <- c(rep(2008, 92), rep(2009, 273))
smartsville_2009$Month <- c(rep(10,31), rep(11,30), rep(12,31), rep(1,31), rep(2,28), rep(3,31), rep(4,30), rep(5,31), rep(6,30), rep(7,31), rep(8,31), rep(9,30))
smartsville_2009 <- smartsville_2009 %>% rename(Day=Date, Max=Maximum, Min=Minimum, Mean=Average)
smartsville_2009$Date <- as.Date(with(smartsville_2009, paste(WaterYear, Month, Day,sep="-")), "%Y-%m-%d")
smartsville_2009 <- within(smartsville_2009, rm(Day, Month, WaterYear))
smartsville_2009 <- smartsville_2009[,c(4,1,2,3)]
smartsville_2009$Date <- seq.Date(from=smartsville_2009$Date[1], length.out = dim(smartsville_2009)[1], by="day")


smartsville_2010_19_30 <- extract_tables(
  file='S:/DWR/VOL1/BayDeltaDRV/Tributaries/Yuba River/Yuba_Temperature_Compilation/Yuba_Temperature_Work/Yuba Compliance WY 2009-2010/SWRCB D-1644 Annual Report Ending 9-30-10.pdf',
  output = "data.frame",
  pages = c(19,20,21,22,23,24,25,26,27,28,29,30),
  guess=TRUE
)

smartsville_2010_19_30_df <- NULL

for (i in 1:12){
  smartsville_2010_19_30_df <- bind_rows(smartsville_2010_19_30_df, smartsville_2010_19_30[[i]])
}

smartsville_2010 <- NULL
smartsville_2010 <- rbind(smartsville_2010, smartsville_2010_19_30_df)
smartsville_2010$ WaterYear <- c(rep(2009, 92), rep(2010, 273))
smartsville_2010$Month <- c(rep(10,31), rep(11,30), rep(12,31), rep(1,31), rep(2,28), rep(3,31), rep(4,30), rep(5,31), rep(6,30), rep(7,31), rep(8,31), rep(9,30))
smartsville_2010 <- smartsville_2010 %>% rename(Day=Date, Max=Maximum, Min=Minimum, Mean=Average)
smartsville_2010$Date <- as.Date(with(smartsville_2010, paste(WaterYear, Month, Day,sep="-")), "%Y-%m-%d")
smartsville_2010 <- within(smartsville_2010, rm(Day, Month, WaterYear))
smartsville_2010 <- smartsville_2010[,c(4,1,2,3)]
smartsville_2010$Date <- seq.Date(from=smartsville_2010$Date[1], length.out = dim(smartsville_2010)[1], by="day")


smartsville_2011_18_29 <- extract_tables(
  file='S:/DWR/VOL1/BayDeltaDRV/Tributaries/Yuba River/Yuba_Temperature_Compilation/Yuba_Temperature_Work/Yuba Compliance WY 2010-2011/SWRCB 2011 Compliance Report final.pdf',
  output = "data.frame",
  pages = c(18,19,20,21,22,23,24,25,26,27,28,29),
  guess=TRUE
)

smartsville_2011_18_29_df <- NULL

for (i in 1:12){
  smartsville_2011_18_29_df <- bind_rows(smartsville_2011_18_29_df, smartsville_2011_18_29[[i]])
}

smartsville_2011 <- NULL
smartsville_2011 <- rbind(smartsville_2011, smartsville_2011_18_29_df)
smartsville_2011$ WaterYear <- c(rep(2010, 92), rep(2011, 273))
smartsville_2011$Month <- c(rep(10,31), rep(11,30), rep(12,31), rep(1,31), rep(2,28), rep(3,31), rep(4,30), rep(5,31), rep(6,30), rep(7,31), rep(8,31), rep(9,30))
smartsville_2011 <- smartsville_2011 %>% rename(Day=Date, Max=Maximum, Min=Minimum)
smartsville_2011$Date <- as.Date(with(smartsville_2011, paste(WaterYear, Month, Day,sep="-")), "%Y-%m-%d")
smartsville_2011 <- within(smartsville_2011, rm(Day, Month, WaterYear))
smartsville_2011 <- smartsville_2011[,c(4,1,2,3)]

smartsville_2012_20_31 <- extract_tables(
  file='S:/DWR/VOL1/BayDeltaDRV/Tributaries/Yuba River/Yuba_Temperature_Compilation/Yuba_Temperature_Work/Yuba Compliance WY 2011-2012/SWRCB 2012 An Rpt.pdf',
  output = "data.frame",
  pages = c(20,21,22,23,24,25,26,27,28,29,30,31),
  guess=TRUE
)

smartsville_2012_20_31_df <- NULL

for (i in 1:12){
  smartsville_2012_20_31_df <- bind_rows(smartsville_2012_20_31_df, smartsville_2012_20_31[[i]])
}

smartsville_2012 <- NULL
smartsville_2012 <- rbind(smartsville_2012, smartsville_2012_20_31_df)
smartsville_2012$ WaterYear <- c(rep(2011, 92), rep(2012, 274))
smartsville_2012$Month <- c(rep(10,31), rep(11,30), rep(12,31), rep(1,31), rep(2,29), rep(3,31), rep(4,30), rep(5,31), rep(6,30), rep(7,31), rep(8,31), rep(9,30))
smartsville_2012 <- smartsville_2012 %>% rename(Day=Date, Max=Maximum, Min=Minimum)
smartsville_2012$Date <- as.Date(with(smartsville_2012, paste(WaterYear, Month, Day,sep="-")), "%Y-%m-%d")
smartsville_2012 <- within(smartsville_2012, rm(Day, Month, WaterYear))
smartsville_2012 <- smartsville_2012[,c(4,1,2,3)]


smartsville_2013_19_30 <- extract_tables(
  file='S:/DWR/VOL1/BayDeltaDRV/Tributaries/Yuba River/Yuba_Temperature_Compilation/Yuba_Temperature_Work/Yuba Compliance WY 2012-2013/YCWA SWRCB 2013 Annual Report.pdf',
  output = "data.frame",
  pages = c(19,20,21,22,23,24,25,26,27,28,29,30),
  guess=TRUE
)

smartsville_2013_19_30_df <- NULL

for (i in 1:12){
  smartsville_2013_19_30_df <- bind_rows(smartsville_2013_19_30_df, smartsville_2013_19_30[[i]])
}

smartsville_2013 <- NULL
smartsville_2013 <- rbind(smartsville_2013, smartsville_2013_19_30_df)
smartsville_2013$ WaterYear <- c(rep(2012, 92), rep(2013, 273))
smartsville_2013$Month <- c(rep(10,31), rep(11,30), rep(12,31), rep(1,31), rep(2,28), rep(3,31), rep(4,30), rep(5,31), rep(6,30), rep(7,31), rep(8,31), rep(9,30))
smartsville_2013 <- smartsville_2013 %>% rename(Day=Date, Max=Maximum, Min=Minimum)
smartsville_2013$Date <- as.Date(with(smartsville_2013, paste(WaterYear, Month, Day,sep="-")), "%Y-%m-%d")
smartsville_2013 <- within(smartsville_2013, rm(Day, Month, WaterYear))
smartsville_2013 <- smartsville_2013[,c(4,1,2,3)]

smartsville_2014_21_32 <- extract_tables(
  file='S:/DWR/VOL1/BayDeltaDRV/Tributaries/Yuba River/Yuba_Temperature_Compilation/Yuba_Temperature_Work/Yuba Compliance WY 2013-2014/SWRCB 2014 Annual Compliance Report.pdf',
  output = "data.frame",
  pages = c(21,22,23,24,25,26,27,28,29,30,31,32),
  guess=TRUE
)

smartsville_2014_21_32_df <- NULL

for (i in 1:12){
  smartsville_2014_21_32_df <- bind_rows(smartsville_2014_21_32_df, smartsville_2014_21_32[[i]])
}

smartsville_2014 <- NULL
smartsville_2014 <- rbind(smartsville_2014, smartsville_2014_21_32_df)
smartsville_2014$ WaterYear <- c(rep(2013, 92), rep(2014, 273))
smartsville_2014$Month <- c(rep(10,31), rep(11,30), rep(12,31), rep(1,31), rep(2,28), rep(3,31), rep(4,30), rep(5,31), rep(6,30), rep(7,31), rep(8,31), rep(9,30))
smartsville_2014 <- smartsville_2014 %>% rename(Day=Date)
smartsville_2014$Date <- as.Date(with(smartsville_2014, paste(WaterYear, Month, Day,sep="-")), "%Y-%m-%d")
smartsville_2014 <- within(smartsville_2014, rm(Day, Month, WaterYear))
smartsville_2014 <- smartsville_2014[,c(4,1,2,3)]

smartsville_2015_19_30 <- extract_tables(
  file='S:/DWR/VOL1/BayDeltaDRV/Tributaries/Yuba River/Yuba_Temperature_Compilation/Yuba_Temperature_Work/Yuba Compliance WY 2014-2015/YCWA D-1644 2015 Annual Compliance Rep 12-29-15.pdf',
  output = "data.frame",
  pages = c(19,20,21,22,23,24,25,26,27,28,29,30),
  guess=TRUE
)

smartsville_2015_19_30_df <- NULL

for (i in 1:12){
  smartsville_2015_19_30_df <- bind_rows(smartsville_2015_19_30_df, smartsville_2015_19_30[[i]])
}


smartsville_2015_19_30_df <- smartsville_2015_19_30_df[-366,]
smartsville_2015 <- NULL

smartsville_2015 <- rbind(smartsville_2015, smartsville_2015_19_30_df)
smartsville_2015$ WaterYear <- c(rep(2014, 92), rep(2015, 273))
smartsville_2015$Month <- c(rep(10,31), rep(11,30), rep(12,31), rep(1,31), rep(2,28), rep(3,31), rep(4,30), rep(5,31), rep(6,30), rep(7,31), rep(8,31), rep(9,30))
smartsville_2015 <- smartsville_2015 %>% rename(Day=Date)
smartsville_2015$Date <- as.Date(with(smartsville_2015, paste(WaterYear, Month, Day,sep="-")), "%Y-%m-%d")
smartsville_2015 <- within(smartsville_2015, rm(Day, Month, WaterYear))
smartsville_2015 <- smartsville_2015[,c(4,1,2,3)]

smartsville_2016_19_54 <- extract_tables(
  file='S:/DWR/VOL1/BayDeltaDRV/Tributaries/Yuba River/Yuba_Temperature_Compilation/Yuba_Temperature_Work/Yuba Compliance WY 2015-2016/2016 RD1644 Final.pdf',
  output = "data.frame",
  pages = c(19,22,25,28,31,34,37,40,43,46,49,52),
  guess=TRUE
)

smartsville_2016_19_54_df <- NULL

for (i in 1:12){
  smartsville_2016_19_54_df <- bind_rows(smartsville_2016_19_54_df, smartsville_2016_19_54[[i]])
}

smartsville_2016 <- NULL
smartsville_2016 <- rbind(smartsville_2016, smartsville_2016_19_54_df)
smartsville_2016$ WaterYear <- c(rep(2015, 92), rep(2016, 274))
smartsville_2016$Month <- c(rep(10,31), rep(11,30), rep(12,31), rep(1,31), rep(2,29), rep(3,31), rep(4,30), rep(5,31), rep(6,30), rep(7,31), rep(8,31), rep(9,30))
smartsville_2016 <- smartsville_2016 %>% rename(Day=Date)
smartsville_2016$Date <- as.Date(with(smartsville_2016, paste(WaterYear, Month, Day,sep="-")), "%Y-%m-%d")
smartsville_2016 <- within(smartsville_2016, rm(Day, Month, WaterYear))
smartsville_2016 <- smartsville_2016[,c(4,1,2,3)]

smartsville_2017_19_54 <- extract_tables(
  file='S:/DWR/VOL1/BayDeltaDRV/Tributaries/Yuba River/Yuba_Temperature_Compilation/Yuba_Temperature_Work/Yuba Compliance WY 2016-2017/2017 RD1644 Final v2.pdf',
  output = "data.frame",
  pages = c(19,22,25,28,31,34,37,40,43,46,49,52),
  guess=TRUE
)

smartsville_2017_19_54_df <- NULL

for (i in 1:12){
  smartsville_2017_19_54_df <- bind_rows(smartsville_2017_19_54_df, smartsville_2017_19_54[[i]])
}

smartsville_2017 <- NULL
smartsville_2017 <- rbind(smartsville_2017, smartsville_2017_19_54_df)
smartsville_2017$ WaterYear <- c(rep(2016, 92), rep(2017, 273))
smartsville_2017$Month <- c(rep(10,31), rep(11,30), rep(12,31), rep(1,31), rep(2,28), rep(3,31), rep(4,30), rep(5,31), rep(6,30), rep(7,31), rep(8,31), rep(9,30))
smartsville_2017 <- smartsville_2017 %>% rename(Day=Date)
smartsville_2017$Date <- as.Date(with(smartsville_2017, paste(WaterYear, Month, Day,sep="-")), "%Y-%m-%d")
smartsville_2017 <- within(smartsville_2017, rm(Day, Month, WaterYear))
smartsville_2017 <- smartsville_2017[,c(4,1,2,3)]

smartsville_2018_19_54 <- extract_tables(
  file='S:/DWR/VOL1/BayDeltaDRV/Tributaries/Yuba River/Yuba_Temperature_Compilation/Yuba_Temperature_Work/Yuba Compliance WY 2017-2018/2018 RD1644 Final Report.pdf',
  output = "data.frame",
  pages = c(19,22,25,28,31,34,37,40,43,46,49,52),
  guess=TRUE
)

smartsville_2018_19_54[[7]][smartsville_2018_19_54[[7]]=='N/A'] <- NA
smartsville_2018_19_54[[7]]$Max <- as.numeric(smartsville_2018_19_54[[7]]$Max)
smartsville_2018_19_54[[7]]$Min <- as.numeric(smartsville_2018_19_54[[7]]$Min)
smartsville_2018_19_54[[7]]$Mean <- as.numeric(smartsville_2018_19_54[[7]]$Mean)


smartsville_2018_19_54_df <- NULL

for (i in 1:12){
  smartsville_2018_19_54_df <- bind_rows(smartsville_2018_19_54_df, smartsville_2018_19_54[[i]])
}

smartsville_2018 <- NULL
smartsville_2018 <- rbind(smartsville_2018, smartsville_2018_19_54_df)
smartsville_2018$ WaterYear <- c(rep(2017, 92), rep(2018, 273))
smartsville_2018$Month <- c(rep(10,31), rep(11,30), rep(12,31), rep(1,31), rep(2,28), rep(3,31), rep(4,30), rep(5,31), rep(6,30), rep(7,31), rep(8,31), rep(9,30))
smartsville_2018 <- smartsville_2018 %>% rename(Day=Date)
smartsville_2018$Date <- as.Date(with(smartsville_2018, paste(WaterYear, Month, Day,sep="-")), "%Y-%m-%d")
smartsville_2018 <- within(smartsville_2018, rm(Day, Month, WaterYear))
smartsville_2018 <- smartsville_2018[,c(4,1,2,3)]

smartsville_2019_19_54 <- extract_tables(
  file='S:/DWR/VOL1/BayDeltaDRV/Tributaries/Yuba River/Yuba_Temperature_Compilation/Yuba_Temperature_Work/2019 RD1644 Final Report.pdf',
  output = "data.frame",
  pages = c(19,22,25,28,31,34,37,40,43,46,49,52),
  guess=TRUE
)

smartsville_2019_19_54[[7]][smartsville_2019_19_54[[7]]=='N/A'] <- NA
smartsville_2019_19_54[[7]]$Max <- as.numeric(smartsville_2019_19_54[[7]]$Max)
smartsville_2019_19_54[[7]]$Min <- as.numeric(smartsville_2019_19_54[[7]]$Min)
smartsville_2019_19_54[[7]]$Mean <- as.numeric(smartsville_2019_19_54[[7]]$Mean)


smartsville_2019_19_54_df <- NULL

for (i in 1:12){
  smartsville_2019_19_54_df <- bind_rows(smartsville_2019_19_54_df, smartsville_2019_19_54[[i]])
}

smartsville_2019 <- NULL
smartsville_2019 <- rbind(smartsville_2019, smartsville_2019_19_54_df)
smartsville_2019$ WaterYear <- c(rep(2018, 92), rep(2019, 273))
smartsville_2019$Month <- c(rep(10,31), rep(11,30), rep(12,31), rep(1,31), rep(2,28), rep(3,31), rep(4,30), rep(5,31), rep(6,30), rep(7,31), rep(8,31), rep(9,30))
smartsville_2019 <- smartsville_2019 %>% rename(Day=Date)
smartsville_2019$Date <- as.Date(with(smartsville_2019, paste(WaterYear, Month, Day,sep="-")), "%Y-%m-%d")
smartsville_2019 <- within(smartsville_2019, rm(Day, Month, WaterYear))
smartsville_2019 <- smartsville_2019[,c(4,1,2,3)]

smartsville_data <- bind_rows(smartsville_2001,
                              smartsville_2002,
                              smartsville_2003, 
                              smartsville_2004, 
                              smartsville_2005,
                              smartsville_2006,
                              smartsville_2007,
                              smartsville_2008,
                              smartsville_2009,
                              smartsville_2010,
                              smartsville_2011,
                              smartsville_2012,
                              smartsville_2013,
                              smartsville_2014,
                              smartsville_2015,
                              smartsville_2016,
                              smartsville_2017,
                              smartsville_2018,
                              smartsville_2019)
smartsville_data <- na.omit(smartsville_data)
smartsville_full <- smartsville_data %>% pad
smartsville_full <- fill_missing_data(smartsville_full, 70, 70L, 55.54, 54.42, 54.96)
smartsville_full <- fill_missing_data(smartsville_full, 89, 89L, 56.65, 54.70, 55.56)
smartsville_full <- fill_missing_data(smartsville_full, 259, 259L,52.20,51.09,51.45)

write.csv(smartsville_full, "S:/DWR/VOL1/BayDeltaDRV/Tributaries/Yuba River/Yuba_Temperature_Compilation/Yuba_Temperature_Work/Complete Time Series/Smartsville.csv")