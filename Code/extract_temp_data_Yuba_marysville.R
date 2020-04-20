library(tidyverse)
library(tabulizer)
library(xlsx)
library(padr)

marysville_2001_28_34 <- extract_tables(
  file='S:/DWR/VOL1/BayDeltaDRV/Tributaries/Yuba River/Yuba_Temperature_Compilation/Yuba_Temperature_Work/Yuba Compliance WY 2000-2001/2000_01_anncomprpt_ocr.pdf',
  output = "data.frame",
  pages = c(28,29,30,31,32,33,34),
  guess= FALSE
)

marysville_2001_28_34_df <- NULL

for (i in 1){
  marysville_2001_28_34[[i]]<-marysville_2001_28_34[[i]] %>% select(c("Temperatures.at.M.rysville", "X", "uses", "X.1"))
  marysville_2001_28_34[[i]] <- head(marysville_2001_28_34[[i]], -1)
  marysville_2001_28_34[[i]] <- marysville_2001_28_34[[i]][-c(1:2),]
  marysville_2001_28_34[[i]] <- marysville_2001_28_34[[i]] %>% rename(Day=Temperatures.at.M.rysville, 
                                                                      Max=X, 
                                                                      Min=uses, 
                                                                      Mean=X.1)
  marysville_2001_28_34[[i]]$WaterYear <- c(rep(2001, 31))
  marysville_2001_28_34[[i]]$Month <- c(rep(3,31))
  marysville_2001_28_34[[i]]$Date <- as.Date(with(marysville_2001_28_34[[i]], paste(WaterYear, Month, Day,sep="-")), "%Y-%m-%d")
  marysville_2001_28_34[[i]] <- within(marysville_2001_28_34[[i]], rm(Day, Month, WaterYear))
  marysville_2001_28_34[[i]] <- marysville_2001_28_34[[i]][,c(4,1,2,3)]
  marysville_2001_28_34[[i]]$Date <- seq.Date(from = as.Date("2001-03-01"), 
                                              length.out = 31, by = "day")
  marysville_2001_28_34_df <- rbind(marysville_2001_28_34_df, marysville_2001_28_34[[i]])
}

for (i in 2:5){
  marysville_2001_28_34[[i]]<-marysville_2001_28_34[[i]][c(2,3,4)]
  marysville_2001_28_34[[i]] <- head(marysville_2001_28_34[[i]], -1)
  marysville_2001_28_34[[i]] <- marysville_2001_28_34[[i]][-c(1:2),]
  marysville_2001_28_34[[i]] <- separate(marysville_2001_28_34[[i]], 3, into=c("Min", "Mean"), sep=" ")
  
  
  marysville_2001_28_34[[i]] <- marysville_2001_28_34[[i]] %>% rename(Date=1, 
                                                                      Max=2)
  marysville_2001_28_34[[i]]$Date <- as.Date(marysville_2001_28_34[[i]]$Date, "%m/%d/%Y")
  marysville_2001_28_34_df <- rbind(marysville_2001_28_34_df, marysville_2001_28_34[[i]])
}

for (i in 6){
  marysville_2001_28_34[[i]]<-marysville_2001_28_34[[i]][c(2,3,4)]
  marysville_2001_28_34[[i]] <- head(marysville_2001_28_34[[i]], -1)
  marysville_2001_28_34[[i]] <- marysville_2001_28_34[[i]][-c(1:2),]
  marysville_2001_28_34[[i]] <- separate(marysville_2001_28_34[[i]], 3, into=c("Min", "Mean"), sep=" ")
  
  
  marysville_2001_28_34[[i]] <- marysville_2001_28_34[[i]] %>% rename(Date=1, 
                                                                      Max=2)
  marysville_2001_28_34[[i]]$Date <- seq.Date(from = as.Date("2001-08-01"), 
                                              length.out = 31, by = "day")
  
  marysville_2001_28_34_df <- rbind(marysville_2001_28_34_df, marysville_2001_28_34[[i]])
}

for (i in 7){
  marysville_2001_28_34[[i]]<-marysville_2001_28_34[[i]][c(2,3,4)]
  marysville_2001_28_34[[i]] <- head(marysville_2001_28_34[[i]], -1)
  marysville_2001_28_34[[i]] <- marysville_2001_28_34[[i]][-c(1:2),]
  marysville_2001_28_34[[i]] <- separate(marysville_2001_28_34[[i]], 3, into=c("Min", "Mean"), sep=" ")
  
  
  marysville_2001_28_34[[i]] <- marysville_2001_28_34[[i]] %>% rename(Date=1, 
                                                                      Max=2)
  marysville_2001_28_34[[i]]$Date <- as.Date(marysville_2001_28_34[[i]]$Date, "%m/%d/%Y")
  marysville_2001_28_34_df <- rbind(marysville_2001_28_34_df, marysville_2001_28_34[[i]])
}

marysville_2001 <- NULL
marysville_2001 <- rbind(marysville_2001, marysville_2001_28_34_df)
marysville_2001$Max <- as.numeric(marysville_2001$Max)
marysville_2001$Min <- as.numeric(marysville_2001$Min)
marysville_2001$Mean <- as.numeric(marysville_2001$Mean)

marysville_2002_42_53 <- extract_tables(
  file='S:/DWR/VOL1/BayDeltaDRV/Tributaries/Yuba River/Yuba_Temperature_Compilation/Yuba_Temperature_Work/Yuba Compliance WY 2002-2003/Yuba12-31-02ComplianceReport_ann_02_ocr.pdf',
  output = "data.frame",
  pages = c(42,43,44,45,46,47,48,49,50,51,52,53),
  guess=FALSE
)

marysville_2002_42_53_df <- NULL

for (i in 1){
  marysville_2002_42_53[[i]] <- marysville_2002_42_53[[i]][c(2,3,4)]
  marysville_2002_42_53[[i]] <- head(marysville_2002_42_53[[i]], -1)
  marysville_2002_42_53[[i]] <- marysville_2002_42_53[[i]][-c(1:2),]
  marysville_2002_42_53[[i]] <- separate(marysville_2002_42_53[[i]], 3, into=c("Min", "Mean"), sep=" ")
  marysville_2002_42_53[[i]] <- marysville_2002_42_53[[i]] %>% rename(Date=1, Max=2)
  marysville_2002_42_53_df <- rbind(marysville_2002_42_53_df, marysville_2002_42_53[[i]])
}

for (i in 2){
  marysville_2002_42_53[[i]] <- marysville_2002_42_53[[i]][c(2,3,4)]
  marysville_2002_42_53[[i]] <- head(marysville_2002_42_53[[i]], -1)
  marysville_2002_42_53[[i]] <- marysville_2002_42_53[[i]][-c(1:2),]
  marysville_2002_42_53[[i]] <- separate(marysville_2002_42_53[[i]], 3, into=c("Min", "Mean"), sep=" ")
  marysville_2002_42_53[[i]] <- marysville_2002_42_53[[i]] %>% rename(Date=1, Max=2)
  marysville_2002_42_53_df <- rbind(marysville_2002_42_53_df, marysville_2002_42_53[[i]])
}
for (i in 3){
  marysville_2002_42_53[[i]] <- marysville_2002_42_53[[i]][c(3,4,5)]
  marysville_2002_42_53[[i]] <- head(marysville_2002_42_53[[i]], -1)
  marysville_2002_42_53[[i]] <- marysville_2002_42_53[[i]][-c(1:2),]
  marysville_2002_42_53[[i]] <- separate(marysville_2002_42_53[[i]], 3, into=c("Min", "Mean"), sep=" ")
  marysville_2002_42_53[[i]] <- marysville_2002_42_53[[i]] %>% rename(Date=1, Max=2)
  marysville_2002_42_53_df <- rbind(marysville_2002_42_53_df, marysville_2002_42_53[[i]])
}
for (i in 4){
  marysville_2002_42_53[[i]] <- marysville_2002_42_53[[i]][c(2,3,4)]
  marysville_2002_42_53[[i]] <- head(marysville_2002_42_53[[i]], -1)
  marysville_2002_42_53[[i]] <- marysville_2002_42_53[[i]][-c(1:2),]
  marysville_2002_42_53[[i]] <- separate(marysville_2002_42_53[[i]], 3, into=c("Min", "Mean"), sep=" ")
  marysville_2002_42_53[[i]] <- marysville_2002_42_53[[i]] %>% rename(Date=1, Max=2)
  marysville_2002_42_53_df <- rbind(marysville_2002_42_53_df, marysville_2002_42_53[[i]])
}
for (i in 5:7){
  marysville_2002_42_53[[i]] <- marysville_2002_42_53[[i]][c(3,4,5)]
  marysville_2002_42_53[[i]] <- head(marysville_2002_42_53[[i]], -1)
  marysville_2002_42_53[[i]] <- marysville_2002_42_53[[i]][-c(1:2),]
  marysville_2002_42_53[[i]] <- separate(marysville_2002_42_53[[i]], 3, into=c("Min", "Mean"), sep=" ")
  marysville_2002_42_53[[i]] <- marysville_2002_42_53[[i]] %>% rename(Date=1, Max=2)
  marysville_2002_42_53_df <- rbind(marysville_2002_42_53_df, marysville_2002_42_53[[i]])
}
for (i in 8){
  marysville_2002_42_53[[i]] <- marysville_2002_42_53[[i]][c(2,3,4)]
  marysville_2002_42_53[[i]] <- head(marysville_2002_42_53[[i]], -1)
  marysville_2002_42_53[[i]] <- marysville_2002_42_53[[i]][-c(1:2),]
  marysville_2002_42_53[[i]] <- separate(marysville_2002_42_53[[i]], 3, into=c("Min", "Mean"), sep=" ")
  marysville_2002_42_53[[i]] <- marysville_2002_42_53[[i]] %>% rename(Date=1, Max=2)
  marysville_2002_42_53_df <- rbind(marysville_2002_42_53_df, marysville_2002_42_53[[i]])
}
for (i in 9:10){
  marysville_2002_42_53[[i]] <- marysville_2002_42_53[[i]][c(2,3,4)]
  marysville_2002_42_53[[i]] <- head(marysville_2002_42_53[[i]], -1)
  marysville_2002_42_53[[i]] <- marysville_2002_42_53[[i]][-c(1:2),]
  marysville_2002_42_53[[i]] <- separate(marysville_2002_42_53[[i]], 3, into=c("Min", "Mean"), sep=" ")
  marysville_2002_42_53[[i]] <- marysville_2002_42_53[[i]] %>% rename(Date=1, Max=2)
  marysville_2002_42_53_df <- rbind(marysville_2002_42_53_df, marysville_2002_42_53[[i]])
}
for (i in 11){
  marysville_2002_42_53[[i]] <- marysville_2002_42_53[[i]][c(1,2,3,4)]
  marysville_2002_42_53[[i]] <- head(marysville_2002_42_53[[i]], -1)
  marysville_2002_42_53[[i]] <- marysville_2002_42_53[[i]][-c(1:2),]
  marysville_2002_42_53[[i]] <- marysville_2002_42_53[[i]] %>% rename(Date=1, Max=2, Min=3, Mean=4)
  marysville_2002_42_53_df <- rbind(marysville_2002_42_53_df, marysville_2002_42_53[[i]])
}
for (i in 12){
  marysville_2002_42_53[[i]] <- marysville_2002_42_53[[i]][c(1,2,4)]
  marysville_2002_42_53[[i]] <- head(marysville_2002_42_53[[i]], -1)
  marysville_2002_42_53[[i]] <- marysville_2002_42_53[[i]][-c(1:2),]
  marysville_2002_42_53[[i]] <- separate(marysville_2002_42_53[[i]], 2, into=c("Max", "Min"), sep=" ")
  marysville_2002_42_53[[i]] <- marysville_2002_42_53[[i]] %>% rename(Date=1, Mean=4)
  marysville_2002_42_53_df <- rbind(marysville_2002_42_53_df, marysville_2002_42_53[[i]])
}

marysville_2002_42_53_df <- na.omit(marysville_2002_42_53_df)
marysville_2002_42_53_df <- marysville_2002_42_53_df[-c(335),]
marysville_2002_42_53_df <- marysville_2002_42_53_df %>% add_row(Date=1, Max=63.50, Min=55.00, Mean=58.42, .after=243)
marysville_2002_42_53_df$Date <- sub("^$", 1, marysville_2002_42_53_df$Date)

marysville_2002 <- NULL
marysville_2002 <- rbind(marysville_2002, marysville_2002_42_53_df)
marysville_2002$ WaterYear <- c(rep(2001, 92), rep(2002, 273))
marysville_2002$Month <- c(rep(10,31), rep(11,30), rep(12,31), 
                         rep(1,31), rep(2,28), rep(3,31), 
                         rep(4,30), rep(5,31), rep(6,30), rep(7,31), rep(8,31),
                         rep(9,30))
marysville_2002 <- marysville_2002 %>% rename(Day=Date)
marysville_2002$Date <- as.Date(with(marysville_2002, paste(WaterYear, Month, Day,sep="-")), "%Y-%m-%d")
marysville_2002 <- within(marysville_2002, rm(Day, Month, WaterYear))
marysville_2002$Max <- as.numeric(marysville_2002$Max)
marysville_2002$Min <- as.numeric(marysville_2002$Min)
marysville_2002$Mean <- as.numeric(marysville_2002$Mean)
marysville_2002 <- marysville_2002[,c(4,1,2,3)]


marysville_2003_43_47 <- extract_tables(
  file='S:/DWR/VOL1/BayDeltaDRV/Tributaries/Yuba River/Yuba_Temperature_Compilation/Yuba_Temperature_Work/Yuba Compliance WY 2002-2003/2003annrpt_ocr.pdf',
  output = "data.frame",
  pages = c(43,44,45,46,47),
  guess=FALSE
)

marysville_2003_43_54_df <- NULL

for (i in 1:5){
  names(marysville_2003_43_47[[i]]) <- marysville_2003_43_47[[i]][4,]
  marysville_2003_43_47[[i]] <- marysville_2003_43_47[[i]][-c(1:4),]
  marysville_2003_43_47[[i]] <- separate(marysville_2003_43_47[[i]], 2, into=c("Maximum", "Minimum", "Average"), sep=" ")
  marysville_2003_43_54_df <- rbind(marysville_2003_43_54_df, marysville_2003_43_47[[i]])
}

marysville_2003_48 <- extract_tables(
  file='S:/DWR/VOL1/BayDeltaDRV/Tributaries/Yuba River/Yuba_Temperature_Compilation/Yuba_Temperature_Work/Yuba Compliance WY 2002-2003/2003annrpt_ocr.pdf',
  output = "data.frame",
  pages = c(48),
  guess=FALSE
)

keeps <- c("X", "X.1")
marysville_2003_48[[1]] <- marysville_2003_48[[1]][keeps]
names(marysville_2003_48[[1]]) <- marysville_2003_48[[1]][5,]
marysville_2003_48[[1]] <- marysville_2003_48[[1]][-c(1:5),]
marysville_2003_48[[1]] <- separate(marysville_2003_48[[1]], 2, into=c("Maximum", "Minimum", "Average"), sep=" ")
marysville_2003_43_54_df <- rbind(marysville_2003_43_54_df, marysville_2003_48[[1]])


marysville_2003_49_54 <- extract_tables(
  file='S:/DWR/VOL1/BayDeltaDRV/Tributaries/Yuba River/Yuba_Temperature_Compilation/Yuba_Temperature_Work/Yuba Compliance WY 2002-2003/2003annrpt_ocr.pdf',
  output = "data.frame",
  pages = c(49,50,51,52,53,54),
  guess=FALSE
)

for (i in 1:6){
  names(marysville_2003_49_54[[i]]) <- marysville_2003_49_54[[i]][4,]
  marysville_2003_49_54[[i]] <- marysville_2003_49_54[[i]][-c(1:4),]
  marysville_2003_49_54[[i]] <- separate(marysville_2003_49_54[[i]], 2, into=c("Maximum", "Minimum", "Average"), sep=" ")
  marysville_2003_43_54_df <- rbind(marysville_2003_43_54_df, marysville_2003_49_54[[i]])
}

marysville_2003_43_54_df <- marysville_2003_43_54_df[-c(235, 267),]

marysville_2003 <- NULL
marysville_2003 <- rbind(marysville_2003, marysville_2003_43_54_df)
marysville_2003$ WaterYear <- c(rep(2002, 92), rep(2003, 273))
marysville_2003$Month <- c(rep(10, 31), rep(11,30), rep(12,31), rep(1,31), rep(2,28), rep(3,31), rep(4,30), rep(5,31), rep(6,30), rep(7,31), rep(8,31), rep(9,30))
marysville_2003 <- marysville_2003 %>% rename(Day=Date,
                                              Max=Maximum,
                                              Min=Minimum,
                                              Mean=Average)
marysville_2003$Date <- as.Date(with(marysville_2003, paste(WaterYear, Month, Day,sep="-")), "%Y-%m-%d")
marysville_2003 <- within(marysville_2003, rm(Day, Month, WaterYear))
marysville_2003$Max <- as.numeric(marysville_2003$Max)
marysville_2003$Min <- as.numeric(marysville_2003$Min)
marysville_2003$Mean <- as.numeric(marysville_2003$Mean)
marysville_2003 <- marysville_2003[,c(4,1,2,3)]

marysville_2003[235,4] <- 55.96
marysville_2003[235,2] <- 59.91
marysville_2003[296,3] <- 54.79
marysville_2003[358,3] <- 57.95
marysville_2003[266,4] <- 57.88
marysville_2003[327,4] <- 57.42


marysville_2004_43_54 <- extract_tables(
  file='S:/DWR/VOL1/BayDeltaDRV/Tributaries/Yuba River/Yuba_Temperature_Compilation/Yuba_Temperature_Work/Yuba Compliance WY 2003-2004/2003_04_anncomprpt_ocr.pdf',
  output = "data.frame",
  pages = c(43,44,45,46,47,48,49,50,51,52,53,54),
  guess=FALSE
)

marysville_2004_43_54_df <- NULL

for (i in 1:12){
  names(marysville_2004_43_54[[i]]) <- marysville_2004_43_54[[i]][4,]
  marysville_2004_43_54[[i]] <- marysville_2004_43_54[[i]][-c(1:4),]
  marysville_2004_43_54[[i]] <- separate(marysville_2004_43_54[[i]], 2, into=c("Maximum", "Minimum"), sep=" ")
  marysville_2004_43_54_df <- rbind(marysville_2004_43_54_df, marysville_2004_43_54[[i]])
}

marysville_2004 <- NULL
marysville_2004 <- rbind(marysville_2004, marysville_2004_43_54_df)
marysville_2004$ WaterYear <- c(rep(2003, 92), rep(2004, 274))
marysville_2004$Month <- c(rep(10,31), rep(11,30), rep(12,31), rep(1,31), rep(2,29), rep(3,31), rep(4,30), rep(5,31), rep(6,30), rep(7,31), rep(8,31), rep(9,30))
marysville_2004 <- marysville_2004 %>% rename(Day=Date,
                                              Max=Maximum,
                                              Min=Minimum,
                                              Mean=Average)
marysville_2004$Date <- as.Date(with(marysville_2004, paste(WaterYear, Month, Day,sep="-")), "%Y-%m-%d")
marysville_2004 <- within(marysville_2004, rm(Day, Month, WaterYear))
marysville_2004$Max <- as.numeric(marysville_2004$Max)
marysville_2004$Min <- as.numeric(marysville_2004$Min)
marysville_2004$Mean <- as.numeric(marysville_2004$Mean)
marysville_2004 <- marysville_2004[,c(4,1,2,3)]

marysville_2005 <- NULL

for (i in 1:12){
  marysville_2005<- bind_rows(marysville_2005, read.xlsx(file='S:/DWR/VOL1/BayDeltaDRV/Tributaries/Yuba River/Yuba_Temperature_Compilation/Yuba_Temperature_Work/Yuba Compliance WY 2004-2005/YCWA Annual Operation Report WY04-05/Marysville Temperatures.xls', sheetIndex=i, header=TRUE, colClasses = "numeric"))
}
marysville_2005 <- select(marysville_2005, -c(NA.))

marysville_2005$ WaterYear <- c(rep(2004, 92), rep(2005, 273))
marysville_2005$Month <- c(rep(10,31), rep(11,30), rep(12,31), rep(1,31), rep(2,28), rep(3,31), rep(4,30), rep(5,31), rep(6,30), rep(7,31), rep(8,31), rep(9,30))
marysville_2005 <- marysville_2005 %>% rename(Day=Date,
                                              Max=Maximum,
                                              Min=Minimum,
                                              Mean=Average)
marysville_2005$Date <- as.Date(with(marysville_2005, paste(WaterYear, Month, Day,sep="-")), "%Y-%m-%d")
marysville_2005 <- within(marysville_2005, rm(Day, Month, WaterYear))
marysville_2005 <- marysville_2005[,c(4,1,2,3)]

marysville_2006 <- NULL

for (i in 2:13){
  marysville_2006<- bind_rows(marysville_2006, read.xlsx(file='S:/DWR/VOL1/BayDeltaDRV/Tributaries/Yuba River/Yuba_Temperature_Compilation/Yuba_Temperature_Work/Yuba Compliance WY 2005-2006/annual operations report/Marysville Temperatures.xls', sheetIndex=i, header=TRUE, colClasses = "numeric"))
}
marysville_2006 <- select(marysville_2006, -c(NA.))

marysville_2006$ WaterYear <- c(rep(2005, 92), rep(2006, 273))
marysville_2006$Month <- c(rep(10,31), rep(11,30), rep(12,31), rep(1,31), rep(2,28), rep(3,31), rep(4,30), rep(5,31), rep(6,30), rep(7,31), rep(8,31), rep(9,30))
marysville_2006 <- marysville_2006 %>% rename(Day=Date,
                                              Max=Maximum,
                                              Min=Minimum,
                                              Mean=Average)
marysville_2006$Date <- as.Date(with(marysville_2006, paste(WaterYear, Month, Day,sep="-")), "%Y-%m-%d")
marysville_2006 <- within(marysville_2006, rm(Day, Month, WaterYear))
marysville_2006 <- marysville_2006[,c(4,1,2,3)]

marysville_2007 <- NULL
for (i in 1:12){
  marysville_2007<- bind_rows(marysville_2007, read.xlsx(file='S:/DWR/VOL1/BayDeltaDRV/Tributaries/Yuba River/Yuba_Temperature_Compilation/Yuba_Temperature_Work/Yuba Compliance WY 2006-2007/2007 Annual Report/Temperatures @ Marysville.xls', 
                                                         sheetIndex=i, 
                                                         header=TRUE, 
                                                         colClasses = "numeric", 
                                                         startRow = 2,
                                                         colIndex = 5:8))
}

marysville_2007$ WaterYear <- c(rep(2006, 92), rep(2007, 273))
marysville_2007$Month <- c(rep(10,31), rep(11,30), rep(12,31), rep(1,31), rep(2,28), rep(3,31), rep(4,30), rep(5,31), rep(6,30), rep(7,31), rep(8,31), rep(9,30))
marysville_2007 <- marysville_2007 %>% rename(Day=Date, Max=Maximum, Min=Minimum, Mean=Average)
marysville_2007$Date <- as.Date(with(marysville_2007, paste(WaterYear, Month, Day,sep="-")), "%Y-%m-%d")
marysville_2007 <- within(marysville_2007, rm(Day, Month, WaterYear))
marysville_2007 <- marysville_2007[,c(4,1,2,3)]


marysville_2008_43_54 <- extract_tables(
  file='S:/DWR/VOL1/BayDeltaDRV/Tributaries/Yuba River/Yuba_Temperature_Compilation/Yuba_Temperature_Work/Yuba Compliance WY 2007-2008/2008 SWRCB Annual Rpt Final.pdf',
  output = "data.frame",
  pages = c(43,44,45,46,47,48,49,50,51,52,53,54),
  guess=FALSE
)

marysville_2008_43_54_df <- NULL

for (i in 1:12){
  names(marysville_2008_43_54[[i]]) <- marysville_2008_43_54[[i]][4,]
  marysville_2008_43_54[[i]] <- marysville_2008_43_54[[i]][-c(1:4),]
  marysville_2008_43_54[[i]] <- separate(marysville_2008_43_54[[i]], 2, into=c("Maximum", "Minimum", "Average"), sep=" ")
  marysville_2008_43_54_df <- rbind(marysville_2008_43_54_df, marysville_2008_43_54[[i]])
}

marysville_2008 <- NULL
marysville_2008 <- rbind(marysville_2008, marysville_2008_43_54_df)
marysville_2008$ WaterYear <- c(rep(2007, 92), rep(2008, 274))
marysville_2008$Month <- c(rep(10,31), rep(11,30), rep(12,31), rep(1,31), rep(2,29), rep(3,31), rep(4,30), rep(5,31), rep(6,30), rep(7,31), rep(8,31), rep(9,30))
marysville_2008 <- marysville_2008 %>% rename(Day=Date, Max=Maximum, Min=Minimum, Mean=Average)
marysville_2008$Date <- as.Date(with(marysville_2008, paste(WaterYear, Month, Day,sep="-")), "%Y-%m-%d")
marysville_2008 <- within(marysville_2008, rm(Day, Month, WaterYear))
marysville_2008$Max <- as.numeric(marysville_2008$Max)
marysville_2008$Min <- as.numeric(marysville_2008$Min)
marysville_2008$Mean <- as.numeric(marysville_2008$Mean)
marysville_2008 <- marysville_2008[,c(4,1,2,3)]
marysville_2009_43_54 <- extract_tables(
  file='S:/DWR/VOL1/BayDeltaDRV/Tributaries/Yuba River/Yuba_Temperature_Compilation/Yuba_Temperature_Work/Yuba Compliance WY 2008-2009/Annual Operations Report/Annual State Water Resources Control Board Report.pdf',
  output = "data.frame",
  pages = c(43,44,45,46,47,48,49,50,51,52,53,54),
  guess=TRUE
)

marysville_2009_43_54_df <- NULL

for (i in 1:12){
  marysville_2009_43_54_df <- bind_rows(marysville_2009_43_54_df, marysville_2009_43_54[[i]])
}

marysville_2009 <- NULL
marysville_2009 <- rbind(marysville_2009, marysville_2009_43_54_df)
marysville_2009$ WaterYear <- c(rep(2008, 92), rep(2009, 273))
marysville_2009$Month <- c(rep(10,31), rep(11,30), rep(12,31), rep(1,31), rep(2,28), rep(3,31), rep(4,30), rep(5,31), rep(6,30), rep(7,31), rep(8,31), rep(9,30))
marysville_2009 <- marysville_2009 %>% rename(Day=Date, Max=Maximum, Min=Minimum, Mean=Average)
marysville_2009$Date <- as.Date(with(marysville_2009, paste(WaterYear, Month, Day,sep="-")), "%Y-%m-%d")
marysville_2009 <- within(marysville_2009, rm(Day, Month, WaterYear))
marysville_2009 <- marysville_2009[,c(4,1,2,3)]

marysville_2010_43_54 <- extract_tables(
  file='S:/DWR/VOL1/BayDeltaDRV/Tributaries/Yuba River/Yuba_Temperature_Compilation/Yuba_Temperature_Work/Yuba Compliance WY 2009-2010/SWRCB D-1644 Annual Report Ending 9-30-10.pdf',
  output = "data.frame",
  pages = c(43,44,45,46,47,48,49,50,51,52,53,54),
  guess=TRUE
)

marysville_2010_43_54_df <- NULL

for (i in 1:12){
  marysville_2010_43_54_df <- bind_rows(marysville_2010_43_54_df, marysville_2010_43_54[[i]])
}

marysville_2010 <- NULL
marysville_2010 <- rbind(marysville_2010, marysville_2010_43_54_df)
marysville_2010$ WaterYear <- c(rep(2009, 92), rep(2010, 273))
marysville_2010$Month <- c(rep(10,31), rep(11,30), rep(12,31), rep(1,31), rep(2,28), rep(3,31), rep(4,30), rep(5,31), rep(6,30), rep(7,31), rep(8,31), rep(9,30))
marysville_2010 <- marysville_2010 %>% rename(Day=Date, Max=Maximum, Min=Minimum, Mean=Average)
marysville_2010$Date <- as.Date(with(marysville_2010, paste(WaterYear, Month, Day,sep="-")), "%Y-%m-%d")
marysville_2010 <- within(marysville_2010, rm(Day, Month, WaterYear))
marysville_2010 <- marysville_2010[,c(4,1,2,3)]

marysville_2011_42_53 <- extract_tables(
  file='S:/DWR/VOL1/BayDeltaDRV/Tributaries/Yuba River/Yuba_Temperature_Compilation/Yuba_Temperature_Work/Yuba Compliance WY 2010-2011/SWRCB 2011 Compliance Report final.pdf',
  output = "data.frame",
  pages = c(42,43,44,45,46,47,48,49,50,51,52,53,53),
  guess=TRUE
)

marysville_2011_42_53_df <- NULL

for (i in 1:12){
  marysville_2011_42_53_df <- bind_rows(marysville_2011_42_53_df, marysville_2011_42_53[[i]])
}

marysville_2011 <- NULL
marysville_2011 <- rbind(marysville_2011, marysville_2011_42_53_df)
marysville_2011$ WaterYear <- c(rep(2010, 92), rep(2011, 273))
marysville_2011$Month <- c(rep(10,31), rep(11,30), rep(12,31), rep(1,31), rep(2,28), rep(3,31), rep(4,30), rep(5,31), rep(6,30), rep(7,31), rep(8,31), rep(9,30))
marysville_2011 <- marysville_2011 %>% rename(Day=Date, Max=Maximum, Min=Minimum)
marysville_2011$Date <- as.Date(with(marysville_2011, paste(WaterYear, Month, Day,sep="-")), "%Y-%m-%d")
marysville_2011 <- within(marysville_2011, rm(Day, Month, WaterYear))
marysville_2011 <- marysville_2011[,c(4,1,2,3)]

marysville_2012_44_55 <- extract_tables(
  file='S:/DWR/VOL1/BayDeltaDRV/Tributaries/Yuba River/Yuba_Temperature_Compilation/Yuba_Temperature_Work/Yuba Compliance WY 2011-2012/SWRCB 2012 An Rpt.pdf',
  output = "data.frame",
  pages = c(44,45,46,47,48,49,50,51,52,53,54,55),
  guess=TRUE
)

marysville_2012_44_55_df <- NULL

for (i in 1:12){
  marysville_2012_44_55_df <- bind_rows(marysville_2012_44_55_df, marysville_2012_44_55[[i]])
}

marysville_2012 <- NULL
marysville_2012 <- rbind(marysville_2012, marysville_2012_44_55_df)
marysville_2012 <- drop_na(marysville_2012)
marysville_2012$ WaterYear <- c(rep(2011, 92), rep(2012, 274))
marysville_2012$Month <- c(rep(10,31), rep(11,30), rep(12,31), rep(1,31), rep(2,29), rep(3,31), rep(4,30), rep(5,31), rep(6,30), rep(7,31), rep(8,31), rep(9,30))
marysville_2012 <- marysville_2012 %>% rename(Day=Date, Max=Maximum, Min=Minimum)
marysville_2012$Date <- as.Date(with(marysville_2012, paste(WaterYear, Month, Day,sep="-")), "%Y-%m-%d")
marysville_2012 <- within(marysville_2012, rm(Day, Month, WaterYear))
marysville_2012 <- marysville_2012[,c(4,1,2,3)]


marysville_2013_43_54 <- extract_tables(
  file='S:/DWR/VOL1/BayDeltaDRV/Tributaries/Yuba River/Yuba_Temperature_Compilation/Yuba_Temperature_Work/Yuba Compliance WY 2012-2013/YCWA SWRCB 2013 Annual Report.pdf',
  output = "data.frame",
  pages = c(43,44,45,46,47,48,49,50,51,52,53,54),
  guess=TRUE
)

marysville_2013_43_54_df <- NULL

for (i in 1:12){
  marysville_2013_43_54_df <- bind_rows(marysville_2013_43_54_df, marysville_2013_43_54[[i]])
}

marysville_2013 <- NULL
marysville_2013 <- rbind(marysville_2013, marysville_2013_43_54_df)
marysville_2013$ WaterYear <- c(rep(2012, 92), rep(2013, 273))
marysville_2013$Month <- c(rep(10,31), rep(11,30), rep(12,31), rep(1,31), rep(2,28), rep(3,31), rep(4,30), rep(5,31), rep(6,30), rep(7,31), rep(8,31), rep(9,30))
marysville_2013 <- marysville_2013 %>% rename(Day=Date, Max=Maximum, Min=Minimum)
marysville_2013$Date <- as.Date(with(marysville_2013, paste(WaterYear, Month, Day,sep="-")), "%Y-%m-%d")
marysville_2013 <- within(marysville_2013, rm(Day, Month, WaterYear))
marysville_2013 <- marysville_2013[,c(4,1,2,3)]

marysville_2014_45_56 <- extract_tables(
  file='S:/DWR/VOL1/BayDeltaDRV/Tributaries/Yuba River/Yuba_Temperature_Compilation/Yuba_Temperature_Work/Yuba Compliance WY 2013-2014/SWRCB 2014 Annual Compliance Report.pdf',
  output = "data.frame",
  pages = c(45,46,47,48,49,50,51,52,53,54,55,56),
  guess=TRUE
)

marysville_2014_45_56_df <- NULL

for (i in 1:12){
  marysville_2014_45_56_df <- bind_rows(marysville_2014_45_56_df, marysville_2014_45_56[[i]])
}

marysville_2014 <- NULL
marysville_2014 <- rbind(marysville_2014, marysville_2014_45_56_df)
marysville_2014$ WaterYear <- c(rep(2013, 92), rep(2014, 273))
marysville_2014$Month <- c(rep(10,31), rep(11,30), rep(12,31), rep(1,31), rep(2,28), rep(3,31), rep(4,30), rep(5,31), rep(6,30), rep(7,31), rep(8,31), rep(9,30))
marysville_2014 <- marysville_2014 %>% rename(Day=Date)
marysville_2014$Date <- as.Date(with(marysville_2014, paste(WaterYear, Month, Day,sep="-")), "%Y-%m-%d")
marysville_2014 <- within(marysville_2014, rm(Day, Month, WaterYear))
marysville_2014 <- marysville_2014[,c(4,1,2,3)]


marysville_2015_43 <- extract_tables(
  file='S:/DWR/VOL1/BayDeltaDRV/Tributaries/Yuba River/Yuba_Temperature_Compilation/Yuba_Temperature_Work/Yuba Compliance WY 2014-2015/YCWA D-1644 2015 Annual Compliance Rep 12-29-15.pdf',
  output = "data.frame",
  pages = c(43),
  guess=FALSE
)

names(marysville_2015_43[[1]]) <- marysville_2015_43[[1]][4,]
marysville_2015_43[[1]] <- marysville_2015_43[[1]][-c(1:4),]
marysville_2015_43[[1]] <- marysville_2015_43[[1]][-32]
df_43 <- data.frame(matrix(unlist(marysville_2015_43[[1]]), nrow=length(marysville_2015_43[[1]]), byrow=T))
df_43 <- separate(df_43, 1, into=c("Date", "Max", "Min", "Mean"), sep=" ")
df_43$Date <- as.integer(df_43$Date)
df_43$Max <- as.numeric(df_43$Max)
df_43$Min <- as.numeric(df_43$Min)
df_43$Mean <- as.numeric(df_43$Mean)

marysville_2015_43_54_df <- NULL

marysville_2015_43_54_df <- bind_rows(marysville_2015_43_54_df, df_43)

marysville_2015_44_46 <- extract_tables(
  file='S:/DWR/VOL1/BayDeltaDRV/Tributaries/Yuba River/Yuba_Temperature_Compilation/Yuba_Temperature_Work/Yuba Compliance WY 2014-2015/YCWA D-1644 2015 Annual Compliance Rep 12-29-15.pdf',
  output = "data.frame",
  pages = c(44:46),
  guess=TRUE
)

for (i in 1:3){
  marysville_2015_43_54_df <- bind_rows(marysville_2015_43_54_df, marysville_2015_44_46[[i]])
}

marysville_2015_47_48 <- extract_tables(
  file='S:/DWR/VOL1/BayDeltaDRV/Tributaries/Yuba River/Yuba_Temperature_Compilation/Yuba_Temperature_Work/Yuba Compliance WY 2014-2015/YCWA D-1644 2015 Annual Compliance Rep 12-29-15.pdf',
  output = "data.frame",
  pages = c(47:48),
  guess=TRUE
)

for (i in 1:2){
  marysville_2015_47_48[[i]] <- marysville_2015_47_48[[i]] %>% rename(Date=X)
  marysville_2015_43_54_df <- bind_rows(marysville_2015_43_54_df, marysville_2015_47_48[[i]])
}


marysville_2015_49_54 <- extract_tables(
  file='S:/DWR/VOL1/BayDeltaDRV/Tributaries/Yuba River/Yuba_Temperature_Compilation/Yuba_Temperature_Work/Yuba Compliance WY 2014-2015/YCWA D-1644 2015 Annual Compliance Rep 12-29-15.pdf',
  output = "data.frame",
  pages = c(49:54),
  guess=TRUE
)


for (i in 1:6){
  marysville_2015_43_54_df <- bind_rows(marysville_2015_43_54_df, marysville_2015_49_54[[i]])
}

marysville_2015 <- NULL

marysville_2015 <- rbind(marysville_2015, marysville_2015_43_54_df)
marysville_2015$ WaterYear <- c(rep(2014, 92), rep(2015, 273))
marysville_2015$Month <- c(rep(10,31), rep(11,30), rep(12,31), rep(1,31), rep(2,28), rep(3,31), rep(4,30), rep(5,31), rep(6,30), rep(7,31), rep(8,31), rep(9,30))
marysville_2015 <- marysville_2015 %>% rename(Day=Date)
marysville_2015$Date <- as.Date(with(marysville_2015, paste(WaterYear, Month, Day,sep="-")), "%Y-%m-%d")
marysville_2015 <- within(marysville_2015, rm(Day, Month, WaterYear))
marysville_2015 <- marysville_2015[,c(4,1,2,3)]


marysville_2016_19_54 <- extract_tables(
  file='S:/DWR/VOL1/BayDeltaDRV/Tributaries/Yuba River/Yuba_Temperature_Compilation/Yuba_Temperature_Work/Yuba Compliance WY 2015-2016/2016 RD1644 Final.pdf',
  output = "data.frame",
  pages = c(21,24,27,30,33,36,39,42,45,48,51,54),
  guess=TRUE
)

marysville_2016_19_54_df <- NULL

for (i in 1:12){
  marysville_2016_19_54_df <- bind_rows(marysville_2016_19_54_df, marysville_2016_19_54[[i]])
}

marysville_2016 <- NULL
marysville_2016 <- rbind(marysville_2016, marysville_2016_19_54_df)
marysville_2016$ WaterYear <- c(rep(2015, 92), rep(2016, 274))
marysville_2016$Month <- c(rep(10,31), rep(11,30), rep(12,31), rep(1,31), rep(2,29), rep(3,31), rep(4,30), rep(5,31), rep(6,30), rep(7,31), rep(8,31), rep(9,30))
marysville_2016 <- marysville_2016 %>% rename(Day=Date)
marysville_2016$Date <- as.Date(with(marysville_2016, paste(WaterYear, Month, Day,sep="-")), "%Y-%m-%d")
marysville_2016 <- within(marysville_2016, rm(Day, Month, WaterYear))
marysville_2016 <- marysville_2016[,c(4,1,2,3)]

marysville_2017_19_54 <- extract_tables(
  file='S:/DWR/VOL1/BayDeltaDRV/Tributaries/Yuba River/Yuba_Temperature_Compilation/Yuba_Temperature_Work/Yuba Compliance WY 2016-2017/2017 RD1644 Final v2.pdf',
  output = "data.frame",
  pages = c(21,24,27,30,33,36,39,42,45,48,51,54),
  guess=TRUE
)

marysville_2017_19_54_df <- NULL

for (i in 1:12){
  marysville_2017_19_54_df <- bind_rows(marysville_2017_19_54_df, marysville_2017_19_54[[i]])
}

marysville_2017 <- NULL
marysville_2017 <- rbind(marysville_2017, marysville_2017_19_54_df)
marysville_2017$ WaterYear <- c(rep(2016, 92), rep(2017, 273))
marysville_2017$Month <- c(rep(10,31), rep(11,30), rep(12,31), rep(1,31), rep(2,28), rep(3,31), rep(4,30), rep(5,31), rep(6,30), rep(7,31), rep(8,31), rep(9,30))
marysville_2017 <- marysville_2017 %>% rename(Day=Date)
marysville_2017$Date <- as.Date(with(marysville_2017, paste(WaterYear, Month, Day,sep="-")), "%Y-%m-%d")
marysville_2017 <- within(marysville_2017, rm(Day, Month, WaterYear))
marysville_2017 <- marysville_2017[,c(4,1,2,3)]

marysville_2018_19_54 <- extract_tables(
  file='S:/DWR/VOL1/BayDeltaDRV/Tributaries/Yuba River/Yuba_Temperature_Compilation/Yuba_Temperature_Work/Yuba Compliance WY 2017-2018/2018 RD1644 Final Report.pdf',
  output = "data.frame",
  pages = c(21,24,27,30,33,36,39,42,45,48,51,54),
  guess=TRUE
)

marysville_2018_19_54[[7]][marysville_2018_19_54[[7]]=='N/A'] <- NA
marysville_2018_19_54[[7]]$Max <- as.numeric(marysville_2018_19_54[[7]]$Max)
marysville_2018_19_54[[7]]$Min <- as.numeric(marysville_2018_19_54[[7]]$Min)
marysville_2018_19_54[[7]]$Mean <- as.numeric(marysville_2018_19_54[[7]]$Mean)


marysville_2018_19_54_df <- NULL

for (i in 1:12){
  marysville_2018_19_54_df <- bind_rows(marysville_2018_19_54_df, marysville_2018_19_54[[i]])
}

marysville_2018 <- NULL
marysville_2018 <- rbind(marysville_2018, marysville_2018_19_54_df)
marysville_2018$ WaterYear <- c(rep(2017, 92), rep(2018, 273))
marysville_2018$Month <- c(rep(10,31), rep(11,30), rep(12,31), rep(1,31), rep(2,28), rep(3,31), rep(4,30), rep(5,31), rep(6,30), rep(7,31), rep(8,31), rep(9,30))
marysville_2018 <- marysville_2018 %>% rename(Day=Date)
marysville_2018$Date <- as.Date(with(marysville_2018, paste(WaterYear, Month, Day,sep="-")), "%Y-%m-%d")
marysville_2018 <- within(marysville_2018, rm(Day, Month, WaterYear))
marysville_2018 <- marysville_2018[,c(4,1,2,3)]

marysville_2019_19_54 <- extract_tables(
  file='S:/DWR/VOL1/BayDeltaDRV/Tributaries/Yuba River/Yuba_Temperature_Compilation/Yuba_Temperature_Work/2019 RD1644 Final Report.pdf',
  output = "data.frame",
  pages = c(21,24,27,30,33,36,39,42,45,48,51,54),
  guess=TRUE
)

marysville_2019_19_54_df <- NULL

for (i in 1:12){
  marysville_2019_19_54_df <- bind_rows(marysville_2019_19_54_df, marysville_2019_19_54[[i]])
}

marysville_2019 <- NULL
marysville_2019 <- rbind(marysville_2019, marysville_2019_19_54_df)
marysville_2019$ WaterYear <- c(rep(2018, 92), rep(2019, 273))
marysville_2019$Month <- c(rep(10,31), rep(11,30), rep(12,31), rep(1,31), rep(2,28), rep(3,31), rep(4,30), rep(5,31), rep(6,30), rep(7,31), rep(8,31), rep(9,30))
marysville_2019 <- marysville_2019 %>% rename(Day=Date)
marysville_2019$Date <- as.Date(with(marysville_2019, paste(WaterYear, Month, Day,sep="-")), "%Y-%m-%d")
marysville_2019 <- within(marysville_2019, rm(Day, Month, WaterYear))
marysville_2019 <- marysville_2019[,c(4,1,2,3)]

marysville_data <- bind_rows(marysville_2001, 
                            marysville_2002,
                            marysville_2003, 
                            marysville_2004, 
                            marysville_2005,
                            marysville_2006,
                            marysville_2007,
                            marysville_2008,
                            marysville_2009,
                            marysville_2010,
                            marysville_2011,
                            marysville_2012,
                            marysville_2013,
                            marysville_2014,
                            marysville_2015,
                            marysville_2016,
                            marysville_2017,
                            marysville_2018,
                            marysville_2019)

marysville_data[843, 3] <- 56.16
marysville_full <- marysville_data %>% pad
write.csv(marysville_full, "S:/DWR/VOL1/BayDeltaDRV/Tributaries/Yuba River/Yuba_Temperature_Compilation/Yuba_Temperature_Work/Complete Time Series/Marysville.csv")
