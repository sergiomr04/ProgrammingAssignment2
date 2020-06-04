## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(m = matrix()) {

  ## Initialize the inverse property
  ## clear the data before store
  i <- NULL
  
  ## Method to set the matrix
  ##set the value of the matrix like the vector example
  set <- function( matrix ) {
    m <<- matrix
    i <<- NULL
  }
  
  ## Method the get the matrix
  ## is the same that use get<-function()m
  get <- function() {
    ## Return the matrix
    ## get the value of the matrix notice that get() is now a function
    m
  }
  
  ## Method to set the inverse of the matrix
  ## set the value of the inverse matrix notice that setInverse is a function
  setInverse <- function(inverse) {
    i <<- inverse
  }
  
  ## Method to get the inverse of the matrix
  ##get the value of the inverse matrix now a function
  getInverse <- function() {
    ## Return the inverse property
    i
  }
  
  ## Return a list of the methods
  ##all is storage in a list m
  list(set = set, get = get,
       setInverse = setInverse,
       getInverse = getInverse)
  
  
}


## Write a short comment describing this function
##This function will take the object (list of functions) returned by makeCacheMatrix(). 
##First, it call getinverse(). If there is an inverse matrix stored in the object, 
##i.e. i is not NULL, then it will return i as the result. If no inverse matrix 
##is stored in the object, it will call get() and get the matrix stored in the object. 
##Then an inverse matrix is calculated and stored back into the object by calling setinverse() 
##and then return the inverse matrix.

cacheSolve <- function(x, ...) {
    
  ## Return a matrix that is the inverse of 'x'
  m <- x$getInverse()
  
  ## Just return the inverse if its already set
  if( !is.null(m) ) {
    message("cached inverse matrix found, getting the matrix...")
    return(m)
  }
  
  ## Get the matrix from our object
  data <- x$get()
  
  ## Calculate the inverse using matrix multiplication
  m <- solve(data)
  
  ## Set the inverse to the object
  x$setInverse(m)
  
  ## Return the matrix
  m
  
  
  
}
