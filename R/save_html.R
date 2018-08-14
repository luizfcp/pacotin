#' Save HTML Objects/Image
#'
#' The param Must be written between " " / O parametro Deve ser escrito entre " "
#' @param filename Nome do arquivo; O qual um objeto foi atribuido.
#' @param file Nome do arquivo + .png ou .jpg
#' @keywords html
#' @export
#' @examples
#' arquivo <- head(iris) %>% regulartable() 
#' save_html("arquivo", "C:/Users/fulano/Desktop/arquivo.png")
save_html <- function(filename, file) {
  
  # create an Rmd file ----
  rmd_name <- tempfile(fileext = ".Rmd")
  cat(paste0("```{r echo=FALSE}\n", filename, "\n```"), file = rmd_name)
  
  # render as an html file ----
  html_name <- tempfile(fileext = ".html")
  rmarkdown::render(rmd_name, output_format = "html_document", output_file = html_name )
  
  # get a png from the html file with webshot ----
  webshot::webshot(html_name, zoom = 2, file = file, 
                   selector = "body > div.container-fluid.main-container > div.tabwid > table")

  ## [credit] https://stackoverflow.com/questions/50225669/how-to-save-flextable-as-png-in-r
  
}

##Ex:

# arquivo <- head(iris) %>% regulartable() 
# save_html("arquivo", "C:/Users/fulano/Desktop/arquivo.png")
