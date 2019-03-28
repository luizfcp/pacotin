#' Salva uma tabela gerada com o pacote flextable, 
#' exportando como uma figura png
#'
#' O link usado de referência para criar a função é
#' https://stackoverflow.com/a/49049701/9990992
#' 
#' @import htmltools
#' @import webshot
#' @import magick
#' @param x tabela gerada pelo pacote flextable
#' @param png_file nome que o arquivo sera salvo
#' @export
#' @examples
#' flextable(mtcars) %>% insert_screenshot()
#' flextable(mtcars) %>% insert_screenshot('my-screenshot.png')
insert_screenshot = function(x, png_file = "image.png") {
  htmltools::save_html(htmltools_value(x), 'temp.html')
  img = webshot::webshot('temp.html', png_file, zoom = 2)
  unlink('temp.html')
  magick::image_write(magick::image_trim(magick::image_read(str_c(img))), path = png_file)
}