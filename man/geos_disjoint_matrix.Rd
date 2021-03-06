% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/geos-strtree.R
\name{geos_disjoint_matrix}
\alias{geos_disjoint_matrix}
\alias{geos_touches_matrix}
\alias{geos_intersects_matrix}
\alias{geos_crosses_matrix}
\alias{geos_within_matrix}
\alias{geos_contains_matrix}
\alias{geos_contains_properly_matrix}
\alias{geos_overlaps_matrix}
\alias{geos_equals_matrix}
\alias{geos_equals_exact_matrix}
\alias{geos_covers_matrix}
\alias{geos_covered_by_matrix}
\alias{geos_disjoint_any}
\alias{geos_touches_any}
\alias{geos_intersects_any}
\alias{geos_crosses_any}
\alias{geos_within_any}
\alias{geos_contains_any}
\alias{geos_contains_properly_any}
\alias{geos_overlaps_any}
\alias{geos_equals_any}
\alias{geos_equals_exact_any}
\alias{geos_covers_any}
\alias{geos_covered_by_any}
\title{Matrix predicates}
\usage{
geos_disjoint_matrix(geom, tree)

geos_touches_matrix(geom, tree)

geos_intersects_matrix(geom, tree)

geos_crosses_matrix(geom, tree)

geos_within_matrix(geom, tree)

geos_contains_matrix(geom, tree)

geos_contains_properly_matrix(geom, tree)

geos_overlaps_matrix(geom, tree)

geos_equals_matrix(geom, tree)

geos_equals_exact_matrix(geom, tree, tolerance = .Machine$double.eps^2)

geos_covers_matrix(geom, tree)

geos_covered_by_matrix(geom, tree)

geos_disjoint_any(geom, tree)

geos_touches_any(geom, tree)

geos_intersects_any(geom, tree)

geos_crosses_any(geom, tree)

geos_within_any(geom, tree)

geos_contains_any(geom, tree)

geos_contains_properly_any(geom, tree)

geos_overlaps_any(geom, tree)

geos_equals_any(geom, tree)

geos_equals_exact_any(geom, tree, tolerance = .Machine$double.eps^2)

geos_covers_any(geom, tree)

geos_covered_by_any(geom, tree)
}
\arguments{
\item{geom}{A \link[=as_geos_geometry]{GEOS geometry vector}}

\item{tree}{A \code{\link[=geos_strtree]{geos_strtree()}}}

\item{tolerance}{The maximum separation of vertices that should
be considered equal.}
}
\value{
A \code{list()} of integer vectors containing the indices of \code{tree}
for which the predicate would return TRUE.
}
\description{
Matrix predicates
}
