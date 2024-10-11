#' nord palette colors ramped to a specified length
#'
#' @param n Number of colors to display
#'
#' @param palette Choose from 'nord_palettes' list
#'
#' @param alpha transparency
#'
#' @param reverse If TRUE, the direction of the colours is reversed.
#'
#' @importFrom grDevices colorRampPalette
#'
#' @examples
#' library(hud_palettes)
#' image(volcano, col = hud_col("stronger", 20))
#' @export
hud_col <- function(palette = "hud_brand", n, alpha = 1, reverse = FALSE) {

  pal <- hud_palettes[[palette]]

  if (is.null(pal))
    stop("Palette not found.")

  if(missing(n)) {
    n <- length(pal)
  }

  if (reverse) {
    pal <- rev(pal)
  }

  pal <- colorRampPalette(pal, alpha)(n)

  return(pal)

}

#' nord palette with ramped colours
#'
#' @param palette Choose from 'nord_palettes' list
#'
#' @param alpha transparency
#'
#' @param reverse If TRUE, the direction of the colours is reversed.
#'
#' @importFrom grDevices colorRampPalette
hud_pal <- function(palette = "hud_brand", alpha = 1, reverse = FALSE) {

 function(n) {
   nord(palette, n, alpha, reverse)
 }

}


#' nord color scale for ggplot2
#'
#' @rdname scale_colour_hud
#'
#' @param palette Choose from 'hud_palettes' list
#'
#' @param reverse logical, Reverse the order of the colours?
#'
#' @param alpha transparency
#'
#' @param discrete whether to use a discrete colour palette
#'
#' @param ... additional arguments to pass to scale_color_gradient
#'
#' @inheritParams viridis::scale_color_viridis
#'
#' @importFrom ggplot2 scale_colour_manual
#'
#' @examples
#' library(ggplot2)
#' library(hud_palettes)
#'
#' ggplot(diamonds) +
#'  geom_point(aes(x = carat, y = price, color = cut)) +
#'  scale_colour_hud("kuratea")
#'
#' @export
#'
#' @importFrom ggplot2 discrete_scale scale_color_gradientn
scale_colour_hud <- function(palette = "valley", discrete = TRUE, alpha = 1, reverse = FALSE, ...) {

  if (discrete) {
    discrete_scale("colour", "hud_col", hud_pal(palette, alpha = alpha, reverse = reverse), ...)
  }
  else {
    scale_color_gradientn(colours = hud_col(palette, 256, alpha = alpha, reverse = reverse), ...)
  }
}

#' @rdname scale_colour_hud
#' @export
scale_colour_hud <- scale_colour_hud


#' #' hud fill scale for ggplot2
#'
#' @param palette Choose from 'nord_palettes' list
#'
#' @inheritParams viridis::scale_fill_viridis
#' @inheritParams hud_pal
#'
#' @param discrete whether to use a discrete colour palette
#'
#' @param ... additional arguments to pass to scale_color_gradientn
#'
#' @importFrom ggplot2 scale_fill_manual discrete_scale scale_fill_gradientn
#'
#' @examples
#' library(ggplot2)
#' library(nord)
#'
#' ggplot(diamonds) +
#'   geom_bar(aes(x = cut, fill = clarity)) +
#'   scale_fill_nord("stronger")
#' @export
scale_fill_nord <- function(palette = "valley", discrete = TRUE, alpha = 1, reverse = FALSE, ...) {

   if (discrete) {
    discrete_scale("fill", "hud_col", hud_pal(palette, alpha = alpha, reverse = reverse), ...)
  }
  else {
    scale_fill_gradientn(colours = hud_col(palette, 256, alpha = alpha, reverse = reverse), ...)
  }
}


