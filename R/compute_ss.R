#' @title Compute sufficient statistics from input data
#' @param X an n by p matrix of covariates
#' @param y an n vector
#' @param standardize logical flag (default=TRUE) for whether to standardize columns of X to unit variance prior to fitting.
#' @return a list of sufficient statistics
#' @importFrom methods as
#' @export
compute_ss = function(X, y, standardize = TRUE){
  y = y - mean(y)
  is.sparse = !(is.matrix(X))
  X = set_X_attributes(as.matrix(X), center=TRUE, scale = standardize)
  X = t((t(X) - attr(X, 'scaled:center'))/attr(X, 'scaled:scale'))
  XtX = crossprod(X)
  if(is.sparse){
    XtX = as(XtX,"dgCMatrix")
  }
  Xty = c(y %*% X)
  n = length(y)
  yty = sum(y^2)

  return(list(XtX = XtX, Xty = Xty, yty = yty, n = n))
}