NWIS_temperature <- function(station, stationNo, parameterCd, startDate, endDate, statCd){
  station <- readNWISdv(siteNumbers=stationNo, parameterCd=parameterCd, startDate=startDate, 
                        endDate=endDate, statCd=statCd)
  
  station <- station %>% select("Date", "X_00010_00001")%>%
    rename("Maximum"="X_00010_00001")
  
  station$Maximum <- station$Maximum * (9/5) + 32
  
  return(station)
  
}