ucscDb <- dbConnect(MySQL(),user="genome",host="genome-mysql.cse.ucsc.edu")
result <- dbGetQUery(ucscDb,"show databases;")
dbDisconnect(ucscDb)
result