add2 <- function(x,y) {
  x+y
}

above10 <- function(x) {
  use <- x > 10
  x[use]
}

above <- function(x, n = 10) {
  use <- x > n
  x[use]
}

columnean <- function(y, removeNA = T) {
  # no of columns
  nc <- ncol(y)
  # an empty vector
  means <- numeric(nc)
  for (i in 1:nc) {
    means[i] <- mean(y[,i], na.rm=removeNA)
  }
  means
}

lm <- function(x) { x * x }


make.power <- function(n) {
    pow <- function(x) {
        x^n
    }
    pow
}

#----
# Week 2

# Q 1
cube <- function(x, n) {
x^3
}


# Q 3
f <- function(x) {
    g <- function(y) {
        y + z
    }
    z <- 4
    x + g(x)
}


# Q 5
h <- function(x, y=NULL, d = 3L) {
    z <- cbind(x, d)
    if ( !is.null(y))
        z <- z + y
    else
        z <- z + f
    g <- x + y / z
    if (d == 3L)
        return(g)
    g <- g + 10
    g
}