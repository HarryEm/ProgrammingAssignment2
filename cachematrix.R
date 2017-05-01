## Put comments here that give an overall description of what your
## functions do

## This function sets the value of the matrix, gets the value, 
## sets the inverse, and gets the inverse

makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setinverse <- function(solve) m <<- solve
        getinverse <- function() m
        list(set = set, get = get, 
                setinverse = setinverse,
                getinverse = getinverse)
}


## This function takes a vector and looks it up in the cache, if
## it is there it returns the precalculated inverse, if not it
## calculates the inverse and returns

cacheSolve <- function(x, ...) {
        m <- x$getinverse
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- solve(data, ...)
        x$setinverse(m)
        m
        ## Return a matrix that is the inverse of 'x'
}
