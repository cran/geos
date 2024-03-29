% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/geos-make.R
\name{geos_make_point}
\alias{geos_make_point}
\alias{geos_make_linestring}
\alias{geos_make_polygon}
\alias{geos_make_collection}
\title{Create geometries from vectors of coordinates}
\usage{
geos_make_point(x, y, z = NA_real_, crs = NULL)

geos_make_linestring(x, y, z = NA_real_, feature_id = 1L, crs = NULL)

geos_make_polygon(
  x,
  y,
  z = NA_real_,
  feature_id = 1L,
  ring_id = 1L,
  crs = NULL
)

geos_make_collection(geom, type_id = "geometrycollection", feature_id = 1L)
}
\arguments{
\item{x, y, z}{Vectors of coordinate values}

\item{crs}{An object that can be interpreted as a CRS. See \code{\link[wk:wk_crs]{wk::wk_crs()}}.}

\item{feature_id, ring_id}{Vectors for which a change in sequential values
indicates a new feature or ring. Use \code{\link[=factor]{factor()}} to convert from a character
vector.}

\item{geom}{A \link[=as_geos_geometry]{GEOS geometry vector}}

\item{type_id}{The numeric type identifier for which an
empty should be returned, an object from which
one can be extracted using \code{\link[=as_geos_type_id]{as_geos_type_id()}}
(default to calling \code{\link[=geos_type_id]{geos_type_id()}}). This is most
usefully a character vector with the geometry type
(e.g., point, linestring, polygon).}
}
\value{
A \link[=as_geos_geometry]{GEOS geometry vector}
}
\description{
These functions transform raw coordinates into point, line, polygon,
features, or nest a vector of geometries into a MULTI* type or
GEOMETRYCOLLECTION. See \code{\link[wk:wk_vertices]{wk::wk_coords()}}, \code{\link[=geos_unnest]{geos_unnest()}}, or
\code{\link[wk:wk_flatten]{wk::wk_flatten()}} to perform inverse operations; see \code{\link[wk:xy]{wk::xy()}},
\code{\link[wk:wk_linestring]{wk::wk_linestring()}}, \code{\link[wk:wk_linestring]{wk::wk_polygon()}}, or \code{\link[wk:wk_linestring]{wk::wk_collection()}} for
generic versions that work with non-GEOS types.
}
\examples{
geos_make_point(1:3, 1:3)
geos_make_linestring(1:3, 1:3)
geos_make_polygon(c(0, 1, 0), c(0, 0, 1))
geos_make_collection("POINT (1 1)")

}
