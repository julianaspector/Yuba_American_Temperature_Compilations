library(dataRetrieval)
library(dplyr)
library(padr)

NWIS_temperature <- function(station, stationNo, parameterCd, startDate, endDate, statCd){
  station <- readNWISdv(siteNumbers=stationNo, parameterCd=parameterCd, startDate=startDate, 
                        endDate=endDate, statCd=statCd)
  
  station <- station %>% select("Date", "X_00010_00001")%>%
    rename("Maximum"="X_00010_00001")
  
  station$Maximum <- station$Maximum * (9/5) + 32
  
  return(station)
  
}
# below Folsom Dam
FOL <- NWIS_temperature(station="FOL", 
                        stationNo="11446220", 
                        parameterCd = "00010", 
                        startDate = "",
                        endDate = "2019-09-30",
                        statCd = "00001")

# below Watt Avenue bridge

AWB <- NWIS_temperature(station="AWB", 
                        stationNo="11446980", 
                        parameterCd = "00010", 
                        startDate = "",
                        endDate = "2019-09-30",
                        statCd = "00001")

# at Fair Oaks Blvd

AFO <- NWIS_temperature(station="AFO", 
                        stationNo="11446500", 
                        parameterCd = "00010", 
                        startDate = "",
                        endDate = "2019-09-30",
                        statCd = "00001")

# at William Pond Park

AWP <- NWIS_temperature(station="AWP", 
                        stationNo="11446700", 
                        parameterCd = "00010", 
                        startDate = "",
                        endDate = "2019-09-30",
                        statCd = "00001")

find_narows <- function(new_df, df){
  new_df <- df[rowSums(is.na(df)) > 0,]
  return(new_df)
}

FOL <- FOL %>% pad()
AFO <- AFO %>% pad()
AWB <- AWB %>% pad()
AWP <- AWP %>% pad()

fol_na <- find_narows(fol_na, FOL)
fol_na$consec <- cumsum(!c(TRUE, diff(fol_na$Date) == 1))
fol_na_split <- split(fol_na, fol_na$consec)

afo_na <- find_narows(afo_na, AFO)
afo_na$consec <- cumsum(!c(TRUE, diff(afo_na$Date) == 1))
afo_na_split <- split(afo_na, afo_na$consec)

awp_na <- find_narows(awp_na, AWP)
awp_na$consec <- cumsum(!c(TRUE, diff(awp_na$Date) == 1))
awp_na_split <- split(awp_na, awp_na$consec)

awb_na <- find_narows(awb_na, AWB)
awb_na$consec <- cumsum(!c(TRUE, diff(awb_na$Date) == 1))
awb_na_split <- split(awb_na, awb_na$consec)

write.csv(FOL, 'S:/DWR/VOL1/BayDeltaDRV/Tributaries/American River/American River Temperature Compilation/Time Series Data/FOL.csv')
write.csv(AFO, 'S:/DWR/VOL1/BayDeltaDRV/Tributaries/American River/American River Temperature Compilation/Time Series Data/AFO.csv')
write.csv(AWB, 'S:/DWR/VOL1/BayDeltaDRV/Tributaries/American River/American River Temperature Compilation/Time Series Data/AWB.csv')
write.csv(AWP,'S:/DWR/VOL1/BayDeltaDRV/Tributaries/American River/American River Temperature Compilation/Time Series Data/AWP.csv')