
fill_missing_data <- function(df, row, rowL, max, min, mean){
  df[row,] <- df %>% slice(rowL) %>%  
  replace_na(list(Max=max, Min=min, Mean=mean))
  return(df)
}
