## cachematrix.R
##
## This function creates a special "matrix" object that can cache its inverse.
## Computing the inverse of a square matrix can be done with the solve function 
## in R. For example, if X is a square invertible matrix, then solve(X) returns
## its inverse.
makeCacheMatrix <- function(x = matrix()) {
    # define a null matrix inverse
    minv <- NULL
    
    # set the matrix
    set <- function(y) {
        # assign the matrix into an alternate environment
        x <<- y
        # define a null matrix inverse in the alternate environment
        minv <<- NULL
    }
    
    # get the matrix
    get <- function() x
    
    # set the matrix inverse into the alternate environment
    setminv <- function(inverse) {
        minv <<- inverse
    }
    
    # get the matrix inverse
    getminv <- function() minv
    
    list(set     = set,
         get     = get,
         setminv = setminv,
         getminv = getminv)
}

## This function computes the inverse of the special "matrix" returned by 
## makeCacheMatrix above. If the inverse has already been calculated (and the 
## matrix has not changed), then the cachesolve should retrieve the inverse 
## from the cache.
cacheSolve <- function(x, ...) {
    # Return a matrix that is the inverse of 'x' from the alternate environment
    minv <- x$getminv()
    
    # Check to see if the inverse has been precalculated.
    if(!is.null(minv)) {
        # return the precalculated inverse matrix.
        message("getting cached data")
        return(minv)
    }
    
    # assign the matrix to mdat
    mdat <- x$get()
    
    # calculate the matrix inverse using solve, which assumes a square matrix.
    minv <- solve(mdat, ...)
    
    # assign the value of the inverse to cache.
    x$setminv(minv)
    
    # return the final result
    minv
}
