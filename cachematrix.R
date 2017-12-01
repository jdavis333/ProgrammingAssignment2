## These functions compute the inverse of a matrix and cache the result.


## The first function creates a list of functions to set/get the data matrix and
set/get its inverse.

makeCacheMatrix <- function(x = matrix()) {

        inv <- NULL

        set <- function(y) {

                x <<- y

                inv <<- NULL

        }

        get <- function() x

        setinv <- function(inverse) inv <<- inverse

        getinv <- function() inv
        list(set = set, get = get,

             setinv = setinv,

             getinv = getinv)

}

## The second function calls functions from function

makeCacheMatrix() to 
##     a) compute the inverse and cache the result if it has not already been computed or 
##     b) retrive the inverse from the cache if it has been computed.
 
cacheSolve <- function(x, ...) {

        inv <- x$getinv()

        if(!is.null(inv)) {

                message("getting cached data")

                return(inv)

        }

        data <- x$get()

        inv <- solve(data, ...)

        x$setinv(inv)

        inv
}
