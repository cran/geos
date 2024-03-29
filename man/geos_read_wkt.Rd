% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/geos-io.R
\name{geos_read_wkt}
\alias{geos_read_wkt}
\alias{geos_write_wkt}
\alias{geos_read_geojson}
\alias{geos_write_geojson}
\alias{geos_read_wkb}
\alias{geos_write_wkb}
\alias{geos_read_hex}
\alias{geos_write_hex}
\alias{geos_read_xy}
\alias{geos_write_xy}
\title{Read and write well-known text}
\usage{
geos_read_wkt(wkt, fix_structure = FALSE, crs = NULL)

geos_write_wkt(geom, include_z = TRUE, precision = 16, trim = TRUE)

geos_read_geojson(geojson, crs = NULL)

geos_write_geojson(geom, indent = -1)

geos_read_wkb(wkb, fix_structure = FALSE, crs = NULL)

geos_write_wkb(
  geom,
  include_z = TRUE,
  include_srid = FALSE,
  endian = 1,
  flavor = c("extended", "iso")
)

geos_read_hex(hex, fix_structure = FALSE, crs = NULL)

geos_write_hex(
  geom,
  include_z = TRUE,
  include_srid = FALSE,
  endian = 1,
  flavor = c("extended", "iso")
)

geos_read_xy(point)

geos_write_xy(geom)
}
\arguments{
\item{wkt}{a \code{character()} vector of well-known text}

\item{fix_structure}{Set the reader to automatically repair structural errors
in the input (currently just unclosed rings) while reading.}

\item{crs}{An object that can be interpreted as a CRS. See \code{\link[wk:wk_crs]{wk::wk_crs()}}.}

\item{geom}{A \link[=as_geos_geometry]{GEOS geometry vector}}

\item{include_z, include_srid}{Include the values of the Z and M coordinates and/or
SRID in the output?
Use \code{FALSE} to omit, \code{TRUE} to include, or \code{NA} to
include only if present. Note that using \code{TRUE} may result
in an error if there is no value present in the original.}

\item{precision}{The number of significant digits to include iin WKT
output.}

\item{trim}{Trim unnecessary zeroes in the output?}

\item{geojson}{A \code{character()} vector fo GeoJSON features}

\item{indent}{The number of spaces to use when indenting a formatted
version of the output. Use -1 to indicate no formatting.}

\item{wkb}{A \code{list()} of \code{raw()} vectors (or \code{NULL} representing
an \code{NA} value).}

\item{endian}{0 for big endian or 1 for little endian.}

\item{flavor}{One of "extended" (i.e., EWKB) or "iso".}

\item{hex}{A hexidecimal representation of well-known binary}

\item{point}{A \code{list()} representing points in the form \code{list(x, y)}.}
}
\description{
Read and write well-known text
}
\examples{
geos_read_wkt("POINT (30 10)")
geos_write_wkt(geos_read_wkt("POINT (30 10)"))

}
