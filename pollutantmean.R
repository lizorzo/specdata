pollutantmean <- function(directory, pollutant, id = 1:332) {

  ## creates a numeric vector
  dataset = numeric()
  
  ## guarantee that all csv files will be read
  for (i in id) {
    
    ## paste() converts its arguments to character strings, and concatenates them (separating them by the string given by sep )
    ## formatC() formatts numbers. Example: if i = 7, as flag is setted to 0 and width to 3, the result will be 007
    readData = read.csv(paste(directory, "/", formatC(i, width = 3, flag = "0"), ".csv", sep = ""))
    
    ## populates vector 
    dataset = c(dataset, readData[[pollutant]])
  }
  ## return rounded mean value
  round(mean(dataset, na.rm = TRUE), digits=3)
}