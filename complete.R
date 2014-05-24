complete <- function(directory, id = 1:332) {
  
  ## creates a numeric vector
  nobs = numeric()
  
  ## guarantee that all 332 csv files will be read
  for (i in id) {
    
    ## paste() converts its arguments to character strings, and concatenates them (separating them by the string given by sep )
    ## formatC() formatts numbers. Example: if i = 7, as flag is setted to 0 and width to 3, the result will be 007
    readData = read.csv(paste(directory, "/", formatC(i, width = 3, flag = "0"), ".csv", sep = ""))
    
    ## populates vector with the number of rows of complete cases (with no missing values: NA)
    nobs = c(nobs, nrow(na.omit(readData)))
    
  }
  
  ## bind vector of ids and vector of nobs in a data frame
  data.frame(id,nobs)
}