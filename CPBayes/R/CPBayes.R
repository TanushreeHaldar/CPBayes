#' CPBayes: An R-package implemeting a Bayesian meta analysis method for studying cross-phenotype
#' genetic associations. 
#' 
#' Simultaneous analysis of genetic associations with multiple phenotypes may reveal shared
#' genetic susceptibility across traits (pleiotropy). CPBayes is a Bayesian meta analysis
#' approach for studying cross-phenotype genetic associations. It uses summary-level data
#' across multiple phenotypes to simultaneously measure the evidence of aggregate-level
#' pleiotropic association and estimate an optimal subset of traits associated with the
#' risk locus. CPBayes is based on a spike and slab prior and is implemented by Markov
#' chain Monte Carlo (MCMC) technique Gibbs sampling. 
#' 
#' The package consists of three main functions:
#' \code{\link{cpbayes_uncor}}, \code{\link{cpbayes_cor}}, \code{\link{post_summaries}}
#' 
#' @section Functions:
#' \describe{
#' \item{\code{\link{cpbayes_uncor}}}{This function implements CPBayes for uncorrelated
#'  summary statistics. The summary statistics across traits/studies are uncorrelated when
#'   the studies have no overlapping subject.}
#' \item{\code{\link{cpbayes_cor}}}{This function implements CPBayes for correlated summary
#'  statistics. The summary statistics across traits/studies are correlated when the studies
#'   have overlapping subjects or the phenotypes were measured in a cohort study.}
#' \item{\code{\link{post_summaries}}}{This function summarizes the MCMC data produced by the
#'  main two functions \code{\link{cpbayes_uncor}} or \code{\link{cpbayes_cor}} listed above.
#'   It computes additional summaries to provide a better insight into a pleiotropic signal.
#'    It works in the same way for both \code{\link{cpbayes_uncor}} and \code{\link{cpbayes_cor}}.}
#' }
#' 
#' @docType package
#' 
#' @name CPBayes
#' 
#' @importFrom MASS mvrnorm
NULL