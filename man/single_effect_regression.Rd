% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/single_effect_regression.R
\name{single_effect_regression}
\alias{single_effect_regression}
\title{Bayesian single-effect linear regression of Y on X}
\usage{
single_effect_regression(
  Y,
  X,
  V,
  residual_variance = 1,
  prior_weights = NULL,
  optimize_V = c("none", "optim", "uniroot", "EM", "simple"),
  check_null_threshold = 0
)
}
\arguments{
\item{Y}{an n vector}

\item{X}{an n by p matrix of covariates}

\item{V}{the prior variance}

\item{residual_variance}{the residual variance}

\item{prior_weights}{a p vector of prior weights}

\item{optimize_V}{boolean indicating whether to optimize V (by maximum likelihood)}

\item{check_null_threshold}{float a threshold on the log scale to compare likelihood between current estimate and zero the null}
}
\value{
a list with elements: \cr
\item{alpha}{vector of posterior inclusion probabilities. ie alpha[i] is posterior probability that
 that b[i] is non-zero}
\item{mu}{vector of posterior means (conditional on inclusion)}
\item{mu2}{vector of posterior second moments (conditional on inclusion)}
\item{lbf}{vector of log Bayes factors for each variable}
\item{lbf_model}{log Bayes factor for the single effect regression}
\item{V}{the prior variance (after optimization, if optimize_V is TRUE)}
\item{loglik}{The log-likelihood p(Y|X,V)}
}
\description{
Bayesian single-effect linear regression of Y on X
}
\details{
Performs single-effect linear regression of Y on X. That is, this function
fits the regression model Y= Xb + e, where elements of e are iid N(0,s2) and the
b is a p vector of effects to be estimated.
The assumption is that b has exactly one non-zero element, with all elements
equally likely to be non-zero. The prior on the non-zero element is N(0,var=V).
}
