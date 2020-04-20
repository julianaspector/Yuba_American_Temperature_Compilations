find_narows <- function(new_df, df){
  new_df <- df[rowSums(is.na(df)) > 0,]
  return(new_df)
}