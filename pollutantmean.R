#---
# This is the Work Assignment for Week 2

# Part 1
# Purpose: calculates the mean of a pollutant (sulfate or nitrate) across a specified list of
# monitors.
#
# Args:   directory 
#         pollutant
#         id
pollutantmean <- function(directory, pollutant, id = 1:332) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    
    ## 'pollutant' is a character vector of length 1 indicating
    ## the name of the pollutant for which we will calculate the
    ## mean; either "sulfate" or "nitrate".
    
    ## 'id' is an integer vector indicating the monitor ID numbers
    ## to be used
    
    ## Return the mean of the pollutant across all monitors list
    ## in the 'id' vector (ignoring NA values)
    
    
    # sample results
    #source("pollutantmean.R")
    #pollutantmean("specdata", "sulfate", 1:10)
    ## [1] 4.064
    #pollutantmean("specdata", "nitrate", 70:72)
    ## [1] 1.706
    #pollutantmean("specdata", "nitrate", 23)
    ## [1] 1.281
    
    # check if the directory parameter is not null
    if (directory == "") 
        return(print("Invalid directory parameter; please name-it"))
    

    # check if the directory exist
    if ( is.na(file.info(directory)[1,"isdir"]))
        return( print(paste("Invalid directory parameter'",directory,
                            "' (it doesn't exist);Please look for a valid directory underneeth",sep="")))
    
    # validate the second parameter
    valid_args <- c("sulfate","nitrate")
    continue <- FALSE
  
    for (i in 1:length(valid_args)) {
        if ( pollutant == valid_args[i]) {
             continue <- TRUE
         }
    }
    
    if (! continue ) {
        print (paste("Invalid pollutant parameter: '", pollutant, "'", sep=""))
        print("Please use one of the following:")
        print(valid_args)
    }
    
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
    
    # now read all the data in one dataframe
    daf <- do.call("rbind", lapply(filenames, read.csv, header=TRUE))
    # compute and return the mean
    mean(daf[,pollutant], na.rm = T)
}