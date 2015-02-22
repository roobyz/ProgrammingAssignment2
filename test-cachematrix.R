## Testing function
##
## This function validates that my caching inverse functions work as expected.
testinv = function(x){
    # x: a square matrix that can be inverted.
    
    temp = makeCacheMatrix(x)
    
    # capture the size of the matrix
    size <- dim(x)[1]
    
    # print the input matrix, if small enough
    if ( size <= 5 ) {
        message("Input Matrix:")
        print(x)
        message("")
    }
    
    # print the inverse matrix calculation timing
    message("Calculated Inverse Matrix:")
    tstart = Sys.time()
    im <- cacheSolve(temp)
    print(Sys.time() - tstart)
    
    # print the inverse matrix, if small enough
    if ( size <= 5 ) print(im)
    message("")
    
    # print the cached inverse matrix retrieval timing
    message("Cached Inverse Matrix:")
    tstart = Sys.time()
    im <- cacheSolve(temp)
    print(Sys.time() - tstart)
    
    # print the inverse matrix again, to ensure it matches the original
    if ( size <= 5 ) print(im)
}

# test matrix with a known expected inverse to ensure calculation is correct.
mm <- matrix(c(1,0,1,0,2,1,1,1,1), 3, 3)
#mm <- matrix(c(1,0,1,0,2,1,1,1,1,1,3,4,0,2,1,0), 4, 4)
#mm <- matrix(rnorm(10^4), 100, 100)
#mm <- matrix(rnorm(25), 5, 5)
testinv(mm)
