corr <- function(directory, threshold = 0) {

  ## creates a numeric vector
  results_corr = numeric()
  
  #vector of files (created by dir() function) that will be analyzed
  v_files = dir(path=directory)
  
  for (i in 1:length(v_files)) {
    
    ## paste() converts its arguments to character strings, and concatenates them (separating them by the string given by sep )
    ## formatC() formatts numbers. Example: if i = 7, as flag is setted to 0 and width to 3, the result will be 007
    newRead = read.csv(paste(directory, "/", formatC(i, width = 3, flag = "0"), ".csv", sep = ""))
    
    if(nrow(na.omit(newRead)) > threshold){
      ## complete.obs discards the entire row if an NA is present
      results_corr = c(results_corr, cor(newRead$sulfate, newRead$nitrate, use="complete.obs"))
    }
  }
  round(results_corr, digits=4)
}