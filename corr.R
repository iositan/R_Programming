corr <- function(directory, threshold = 0) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    
    ## 'threshold' is a numeric vector of length 1 indicating the
    ## number of completely observed observations (on all
    ## variables) required to compute the correlation between
    ## nitrate and sulfate; the default is 0
    
    ## Return a numeric vector of correlations
    
    # check if the directory parameter is not null
    if (directory == "") 
        return(print("Invalid directory parameter; please name-it"))
    
    
    # check if the directory exist
    if ( is.na(file.info(directory)[1,"isdir"]))
        return( print(paste("Invalid directory parameter'",directory,
                            "' (it doesn't exist);Please look for a valid directory underneeth",sep="")))
    
    # use the previous function!!
    # assuming we have all the files by default
    daf <- complete(directory)
    filter <- daf[,"nobs"] > threshold
    #filter
    filenames <- list.files(directory)[filter]
    if (length(filenames) > 0 ) {
        df <- do.call("rbind", lapply(paste(directory,"\\",filenames,sep=""),  function(f) { 
         inner <- read.csv(f) 
         cor(inner$sulfate,inner$nitrate,use="complete.obs")
        } ) )
        ve <- df[,1]
    } else {
        ve <- vector(mode="numeric", length=0)
    }
}