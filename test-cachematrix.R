## Testing function
##
## This function validates that my caching inverse functions work as expected.
## Test a random matrix & check identity matrix to ensure the function works.
testinv = function(x){
    # x... a square matrix that can be inverted.
    
    # max size of matrix for display purposes. you may calculate larger sizes,
    # however they will not display unless you increase the maxsize.
    maxsize <- 10
    temp = makeCacheMatrix(x)
    
    # capture the size of the matrix
    size <- dim(x)[1]
    
    # print the input matrix, if small enough
    if ( size <= maxsize ) {
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
    if ( size <= maxsize ) print(im)
    message("")
    
    # print the cached inverse matrix retrieval timing
    message("Cached Inverse Matrix:")
    tstart = Sys.time()
    im <- cacheSolve(temp)
    print(Sys.time() - tstart)
    
    # print the inverse matrix again, to ensure it matches the original
    # note that the identity matrix (diagonal of ones) will result
    # only if the inverse is calculated correctly.
    if ( size <= maxsize ) {
        print(im)
        # calculate the identity matrix to ensure the function worked.
        id <- round(x %*% im)
        message("")
        message("Identity Matrix using cached matrix:")
        print(id)
    }
}

#mm <- matrix(c(1,0,1,1,2,1,2,1,1,0,2,1,0,2,1,0), 4, 4)
mm <- matrix(rnorm(10^2), 10, 10)
#mm <- matrix(rnorm(25), 5, 5)
testinv(mm)
