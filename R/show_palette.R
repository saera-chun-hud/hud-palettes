#' Display a colour palette
#'
#' Given a character vector (hex RGB values), display palette in graphics window.
#'
#' @param palette vector of character hex RGB values
#' @export
#' @examples
#' library(hud_palettes)
#' hud_show_palette("kuratea")
hud_show_palette <- function(palette) {

   name <- palette

   palette <- hud_col(palette)

   n <- length(palette)

   if (length(palette > 0)) {

    graphics::image(1:n, 1, as.matrix(1:n), col = palette,
          xlab = "", ylab = "", xaxt = "n", yaxt = "n",
          bty = "n")
    graphics::title(main = name)

  }
}
