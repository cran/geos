
#' Read and write well-known text
#'
#' @param geom A [GEOS geometry vector][as_geos_geometry]
#' @param wkb A `list()` of `raw()` vectors (or `NULL` representing
#'   an `NA` value).
#' @param wkt a `character()` vector of well-known text
#' @param geojson A `character()` vector fo GeoJSON features
#' @param include_z,include_srid Include the values of the Z and M coordinates and/or
#'   SRID in the output?
#'   Use `FALSE` to omit, `TRUE` to include, or `NA` to
#'   include only if present. Note that using `TRUE` may result
#'   in an error if there is no value present in the original.
#' @param trim Trim unnecessary zeroes in the output?
#' @param precision The number of significant digits to include iin WKT
#'   output.
#' @param endian 0 for big endian or 1 for little endian.
#' @param flavor One of "extended" (i.e., EWKB) or "iso".
#' @param indent The number of spaces to use when indenting a formatted
#'   version of the output. Use -1 to indicate no formatting.
#' @inheritParams geos_segment_intersection
#' @param hex A hexidecimal representation of well-known binary
#' @param fix_structure Set the reader to automatically repair structural errors
#'   in the input (currently just unclosed rings) while reading.
#' @inheritParams as_geos_geometry
#'
#' @export
#'
#' @examples
#' geos_read_wkt("POINT (30 10)")
#' geos_write_wkt(geos_read_wkt("POINT (30 10)"))
#'
geos_read_wkt <- function(wkt, fix_structure = FALSE, crs = NULL) {
  new_geos_geometry(.Call(geos_c_read_wkt, as.character(wkt), as.logical(fix_structure)[1]), crs = crs)
}

#' @rdname geos_read_wkt
#' @export
geos_write_wkt <- function(geom, include_z = TRUE, precision = 16, trim = TRUE) {
  .Call(
    geos_c_write_wkt,
    sanitize_geos_geometry(geom),
    sanitize_logical_scalar(include_z),
    sanitize_integer_scalar(precision),
    sanitize_logical_scalar(trim)
  )
}

#' @rdname geos_read_wkt
#' @export
geos_read_geojson <- function(geojson, crs = NULL) {
  new_geos_geometry(.Call(geos_c_read_geojson, as.character(geojson)), crs = crs)
}

#' @rdname geos_read_wkt
#' @export
geos_write_geojson <- function(geom, indent = -1) {
  .Call(
    geos_c_write_geojson,
    sanitize_geos_geometry(geom),
    sanitize_integer_scalar(indent)
  )
}

#' @rdname geos_read_wkt
#' @export
geos_read_wkb <- function(wkb, fix_structure = FALSE, crs = NULL) {
  new_geos_geometry(.Call(geos_c_read_wkb, as.list(wkb), as.logical(fix_structure)[1]), crs = crs)
}

#' @rdname geos_read_wkt
#' @export
geos_write_wkb <- function(geom, include_z = TRUE, include_srid = FALSE, endian = 1,
                           flavor = c("extended", "iso")) {
  flavor <- match.arg(flavor)

  structure(
    .Call(
      geos_c_write_wkb,
      sanitize_geos_geometry(geom),
      sanitize_logical_scalar(include_z),
      sanitize_logical_scalar(include_srid),
      sanitize_integer_scalar(endian),
      match(flavor, c("extended", "iso"))
    ),
    class = "blob"
  )
}

#' @rdname geos_read_wkt
#' @export
geos_read_hex <- function(hex, fix_structure = FALSE, crs = NULL) {
  new_geos_geometry(.Call(geos_c_read_hex, as.character(hex), as.logical(fix_structure)[1]), crs = crs)
}

#' @rdname geos_read_wkt
#' @export
geos_write_hex <- function(geom, include_z = TRUE, include_srid = FALSE, endian = 1,
                           flavor = c("extended", "iso")) {
  flavor <- match.arg(flavor)

  .Call(
    geos_c_write_hex,
    sanitize_geos_geometry(geom),
    sanitize_logical_scalar(include_z),
    sanitize_logical_scalar(include_srid),
    sanitize_integer_scalar(endian),
    match(flavor, c("extended", "iso"))
  )
}

#' @rdname geos_read_wkt
#' @export
geos_read_xy <- function(point) {
  point <- geos_assert_list_of_numeric(point, 2, "point")
  geos_make_point(point[[1]], point[[2]])
}

#' @rdname geos_read_wkt
#' @export
geos_write_xy <- function(geom) {
  .Call(geos_c_write_xy, sanitize_geos_geometry(geom))
}
