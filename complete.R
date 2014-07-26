complete <- function(directory, id = 1:332) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    
    ## 'id' is an integer vector indicating the monitor ID numbers
    ## to be used
    
    ## Return a data frame of the form:
    ## id nobs
    ## 1  117
    ## 2  1041
    ## ...
    ## where 'id' is the monitor ID number and 'nobs' is the
    ## number of complete cases
    
    
    if (directory == "") 
        return(print("Invalid directory parameter; please name-it"))
    
    
    # check if the directory exist
    if ( is.na(file.info(directory)[1,"isdir"]))
        return( print(paste("Invalid directory parameter'",directory,
                            "' (it doesn't exist);Please look for a valid directory underneeth",sep="")))
    
    #create the list of file names, as per pamaters
    filenames <- NULL
    for ( i in 1:length(id)) {
        if ( id[i] < 10)
            file_id <- paste("00",id[i], sep="")
        else if ( id[i] >= 10 && id[i] < 100)
            file_id <- paste("0",id[i], sep="")
        else
            file_id = id[i]
        
        file <- paste(directory,"\\",file_id,".csv",sep="")
        #print(paste("Adding file",file))
        filenames <- c(filenames,file)
    }
    
    # create and return the data frame
    # now read all the data in one dataframe
    daf <- do.call("rbind", lapply(filenames,  function(f) sum(complete.cases(read.csv(f)))))
    
    daf <- cbind(id,daf)
    colnames(daf) <- c("id","nobs")
   
    dafr <- data.frame(daf)
    dafr
}