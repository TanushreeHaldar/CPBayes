##============================ Some supporting functions for functions for users ===========================##

## Check primary variables
checkPrimaryVar <-  function(VAR, nameVAR)
{
  # Check whether VAR is a vector
  if(!is.vector(VAR))
  {
    if(is.matrix(VAR) && any(dim(VAR)==1))
    {
      VAR <- as.vector(VAR)
      warning( paste(nameVAR, "is a matrix!"), call. = FALSE)
    }
    else
      stop(paste(nameVAR, "must be a vector."), call. = FALSE)
  }
  # Check whether VAR is a numeric vector
  if(!is.numeric(VAR))
    stop(paste(nameVAR, "must be a numeric vector."), call. = FALSE)
  # Check whether there is any NA
  if(any(is.na(VAR)))
    stop(paste(nameVAR, "for one or more phenotypes are missing!"), call. = FALSE)
  # Check whether there is more than one non-missing arguments
  if(length(VAR) <= 1)
    stop(paste("Number of elements in the", nameVAR, "vector must be more than 1!"), call. = FALSE)
  return(VAR)
}

## Check input variable 'Phenotypes'
checkPhen <-  function(Phenotypes, BetaHat)
{
  # Check whether argument 3 is a vector
  if(!is.vector(Phenotypes))
    stop("Phenotypes must be a vector.", call. = FALSE)
  # Check whether argument 3 is a character vector
  if(!is.character(Phenotypes))
    stop("Phenotypes must be a character vector.", call. = FALSE)
  # Check whether there is duplicate phenotyes
  if(length(Phenotypes) > length(unique(Phenotypes)))
    stop("Two or more phenotypes have the same name!", call. = FALSE)
  # Check whether argument 3 is a vector of length more than 1
  if(length(Phenotypes) != length(BetaHat))
    stop("BetaHat and Phenotypes vectors must have the same number of elements!", call. = FALSE)
}

## Check input variable 
checkVarName <- function(variantName)
{
  # Check whether argument 4 is a vector
  if(!is.vector(variantName))
    stop("Variant must be a vector.", call. = FALSE)
  # Check whether argument 4 is a vector of length 1
  if(length(variantName) > 1)
    stop("Variant must be a vector of length 1.", call. = FALSE)
  # Check whether argument 4 is NA
  if(is.na(variantName))
  {
    warning("Variant is NA!", call. = FALSE)
    variantName <- as.character(variantName)
  }
  # Check whether argument 4 is not NA but numeric
  if(!is.na(variantName) && !is.character(variantName))
  {
    warning("Variant is not a character vactor!", call. = FALSE)
    variantName <- as.character(variantName)
  }
    return(variantName)
}

checkCorln <- function(Corln, BetaHat)
{
  # Check whether Corln is a data.frame
  if(is.data.frame(Corln))
    stop("Corln must be a matrix not a data.frame. Use as.matrix() to convert the data.frame into matrix.", call. = FALSE)
  # Check whether Corln is a matrix
  if(!is.matrix(Corln))
    stop("Corln must be a matrix.", call. = FALSE)
  # Check whether Corln is numeric
  if(!is.numeric(Corln))
    stop("Corln must be a numeric matrix.", call. = FALSE)
  # Check whether there is any
  if(any(is.na(Corln)))
    stop("One or more entries of Corln are missing!", call. = FALSE)
  # Check for Corln, whether number of rows = number of columns 
  if(dim(Corln)[1] != dim(Corln)[2])
    stop("Number of rows and columns of Corln are different!", call. = FALSE)
  # Check whether number of rows of corln matrix is same as no. of entries in BetaHat
  if(dim(Corln)[1] != length(BetaHat))
    stop("Number of rows of Corln and length of BetaHat do not match!", call. = FALSE)
  # Save as matrix
    Cor <- as.matrix(Corln)
  # Check whether a symmetric matrix
  if(!isSymmetric(Cor))
    stop("Corln is not symmetric!", call. = FALSE)
  # Check whether a negative definite matrix
  if(det(Cor) < 0)
    stop("Corln is negative definite!", call. = FALSE)
  # Check whether diagonal elements are 1
  if(dist(rbind(diag(Cor), rep(1, dim(Cor)[1]))) != 0)
    stop("Diagonal elements of Corln are not 1!", call. = FALSE)
  # Check whether a singular matrix
  if(det(Cor) == 0)
    warning("Corln is a singular matrix!", call. = FALSE)
    
  return(Cor)
}

print_result <- function(input)
{
  #cat("RESULT ::", "\n")
  #gvar <- paste(" genetic_variant", input$genetic_variant, sep = " : ")
  #cat(gvar, "\t")
  BF <- input$log10_BF
  BF <- round(BF, digits = 2)
  BF <- paste("log10_BF", BF, sep = ": ")
  cat(BF, "\n")
  #ppna <- paste("PPNA", input$PPNA, sep = " : ")
  #cat(ppna, "\n")
  cat("subset:", " ")
  if(length(input$subset) != 0)
    cat(input$subset, "\n")
  else
    cat("None\n")
}

