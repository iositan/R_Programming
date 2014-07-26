# this is my work

# install rCharts
#  first, install devtools
# then load-it
require(devtools)
install_github('rCharts','ramnathv')

library(rCharts)
names(iris) = gsub("\\.","",names(iris))
rPlot(SepalLength ~ SepalWidth | Species, data = iris, color = 'Species', type='point')


hair_eye = as.data.frame(HairEyeColor)
rPlot(Freq ~ Hair | Eye, color = 'Eye', data = hair_eye, type = 'bar')

r1 <- rPlot(mpg ~ wt | am + vs, data = mtcars, type = "point", color = "gear")
r1$print("chart1")

#---- Week 1 Quizes
#quiz 1
# Q 4
x<- 4
class(x)
# Q 5
x <- c(4,T)
class(x)
# Q 6
x<- c(1,3,5) ; y <- c(3,2,10) ; ma <- cbind(x,y) ; str(ma)
class(ma) ; typeof(ma)
# q 8
x <- list(2,"a","b",TRUE) ; re <- x[[2]]
typeof(re) ; class(re) ; str(re)
# Q 9
x <-  1:4 ; y <- 2:3
re <- x + y ; re ; typeof(re) ; class(re) ; str(re)
# Q 10
x <- c(17,14,4,5,13,12,10) 
x[x>10] == 4 ;x
x <- c(17,14,4,5,13,12,10) 
x[x>=10] <- 4 ;x
x <- c(17,14,4,5,13,12,10) 
x [x>=11] <- 4 ; x
x <- c(17,14,4,5,13,12,10) 
x[x<10] <- 4 ; x
# Q 11
colnames(hw1_data)
# Q 12
head(hw1_data,2)
# Q 13
nrow(hw1_data)
# Q 14
tail(hw1_data,2)
# Q 15
hw1_data[47,"Ozone"]
# Q 16
sum(is.na(hw1_data[,"Ozone"]))
# Q 17
mean(hw1_data[,"Ozone"], na.rm=T)
# Q 18
hw1_data[hw1_data[,"Ozone"] > 31 ,"Solar.R"]
hw1_data[hw1_data[,"Temp"] > 90, "Solar.R"]
mean(hw1_data[hw1_data[,"Ozone"] > 31 & hw1_data[,"Temp"] > 90, "Solar.R"], na.rm=T)
# Q 19
mean( hw1_data[hw1_data[,"Month"] == 6,"Temp"], na.rm=T)
# Q 20
max(  hw1_data[hw1_data[,"Month"] ==  5, "Ozone"] , na.rm=T)



#Q 4
x <- 4L ; class(x)
# Q 10
x <- c(3,5,1,10,12,6) ; x [x>6]  <- 0 ;x
x <- c(3,5,1,10,12,6) ; x [x<=5]  <- 0 ;x
x <- c(3,5,1,10,12,6) ; x [x<6]  == 0 ;x
x <- c(3,5,1,10,12,6) ; x [x==0]  <- 6 ;x

library(datasets) ; data(airquality)
cor(airquality)

#------
x <- vector(mode="numeric") ; x ; typeof(x) ; class(x)

x <- 1:20 ; x
options(width=80)


x <- c(0.5,0.6) ; x
x <- c(T,F) ; x
x <- c("a","b") ;x
x <- 9:29 ; x
x <- c(1+01,2+4i) ; x

#-----
#  Mixing objects  T == 1, F == 0
y <- c (1.7, "c") ; y
y <- c(T,2) ; y
y <- c("a", T) ; y

#----- 
#  explicit coercion
x <- 0:6 ; x ; class(x)
as.numeric(x)
as.logical(x)
as.complex(x)


m <- matrix(1:6, nrow = 2, ncol = 3) ; m
dim(m) <- c(2,5) ; class(m)

x <- list(1, "a", TRUE, 1 + 4i) ; x
y <- list("c","d") ; z <- list(x,y) ;
y
z

#====
x <- c(1,2,NA,10,3,NA,12) ; x ; is.na(x)
# count the missing values
sum(is.na(x))
x <- data.frame(foo = 1:4, bar = c(T, T, F, F))
x ; row.names(x); names(x)

#==== 
# dput-get
y <- data.frame(a=1,b="a") ; y;  dput(y)
dput(y, file="y.R")
new.y <- dget("y.R")
new.y

#------ 
# dump / source
x <- "foo" ; y <- data.frame(a = 1, b = "a"); x ;y
dump(c("x","y"), file="data.R")
rm(x,y)
source("data.R")
x ; y

for (i in 1:10) {
  print(i)
}



x <- c("a", "b", "c", "d")
for(i in 1:4) {
  print(x[i])
}
for(i in seq_along(x)) {
  print(x[i])
}
for(letter in x) {
  print(letter)
}
for(i in 1:4) print(x[i])

x <- matrix(1:6, 2, 3)
for(i in seq_len(nrow(x))) {
  for(j in seq_len(ncol(x))) {
    print(x[i, j])
  }
}

#----
# Functions (with functions.R)
x <- 1:20
above10(x)
above(x,12)
above(x)

columnean(airquality)

args(paste)


#----
# Scoping !!
lm
search()

cube <- make.power(3) ; cube(3)
square <- make.power(2) ; square(3)

ls(environment(cube))
get("n", environment(cube))
get("pow", environment(cube))

ls(environment(square))
get("n", environment(square))
get("pow", environment(square))


y <- 10
f <- function(x) {
    y <- 2
    y^2 + g(x)
}
g <- function(x) {
    x*y
}

f(3)


#----
# vectorized
x <- 1:4; y <- 6:9
x + y
x > 2
x >= 2
y == 8
x * y
x / y

x <- matrix(1:4, 2, 2); y <- matrix(rep(10, 4), 2, 2) ; x ; y
x * y ## element-wise multiplication
x / y
x %*% y ## true matrix multiplication


#-----
# Date time
x<- as.Date("1970-01-01") ; x
unclass(x)
unclass(as.Date("1970-01-02"))

x <- Sys.time() ; x
p <- as.POSIXlt(x)
names(unclass(p))
p$sec

x <- Sys.time() ; x ##Already in POSIXct format
unclass(x)

datestring <- c("January 10, 2012 10:40", "December 9, 2011 09:10")
x <- strptime(datestring, "%B %d, %Y %H:%M") ; x
class(x)

#------
# Programming Week 2

#-------
# Q 1
cube(3)

# q 2
x <- 1
if(x>5) {
    x <- 0
} ; x
?`if`


# Q3
z <- 10
f(3)


# Q 4
x <- 5
y <- if (x < 3) {
    NA
} else {
    10
} ; y

# Q 5



a <- available.packages()
head(rownames(a),3)
typeof(a)
str(a)

install.packages("devtools", "slidify")

source("http://bioconductor.org/biocLite.R")
biocLite()
biocLite(c("GenomicFeatures","AnnotationDbi"))


#----
# Data Scrientist Rtools
find.package("devtools")
install.packages("devtools")
library(devtools)
find_rtools()


#--- Work
pol <- "nitrate"
valid_args <- c("nitrate","sulfate")
valid_args.length()


source("pollutantmean.R")
pollutantmean("specdata","sulfate",1:10)
pollutantmean("specdata","nitrate",70:72)
pollutantmean("specdata","nitrate",23)
pollutantmean("specdata","sulfate",c(1,2,3,4,5,6,7,8,9,10))


getwd()
is.na(file.info("specdata")[1,"isdir"])

sum(complete.cases(read.csv("specdata\\002.csv")))


source("complete.R")
complete("specdata",1)
complete("specdata",c(2,4,8,10,12))
complete("specdata",30:25)
complete("specdata",3)




rbind(daf,1:10)


n = c(2, 3, 5) 
s = c("aa", "bb", "cc")
b = c(TRUE, FALSE, TRUE) 
df = data.frame(n, s, b) 

source("complete.R")
source("corr.R")
cr <- corr("specdata", 150)
head(cr)
summary(cr)
cr <- corr("specdata", 400)
head(cr)
summary(cr)
cr <- corr("specdata",5000)
summary(cr)
length(cr)
cr <- corr("specdata")
summary(cr)
length(cr)



