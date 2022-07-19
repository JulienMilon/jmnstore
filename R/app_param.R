#' init necessary parameter compilation to launch an app with authentification + account management
#'
#' @param thumbnail_img Path of the image in thumbnail
#' @param thumbnail_title Title of the thumbnail
#' @param thumbnail_small_describe
#' @param categorie
#' @param modal_img
#' @param modal_title
#'
#' @return an error if provided information are incorrect a init function to launch in the app server part if success
#' @export


app_param <- function(
    thumbnail_img = NULL,
    thumbnail_title = NULL,
    thumbnail_small_describe = NULL,
    categorie = NULL,
    modal_img_cover = NULL,
    modal_title = NULL,
    modal_description = NULL,
    modal_list_img = NULL

){

  # tests
  if (is.null(thumbnail_img)){stop("An image path is neccesary : www/...")}
  if (is.null(thumbnail_title)){stop("A title is neccesary")}
  if (is.null(thumbnail_small_describe)){stop("A small description is neccesary")}
  #if (is.null(categorie)){stop("At least one category is neccesary : c()")}
  if (is.null(modal_img_cover)){stop("An image path is neccesary : www/...")}
  if (is.null(modal_description)){stop("A description is neccesary")}


  if (is.null(modal_title)){modal_title = thumbnail_title}



  # compilation petit r
  app <- list(NULL)
  app$thumbnail_img <- thumbnail_img
  app$thumbnail_title <- thumbnail_title
  app$thumbnail_small_describe <- thumbnail_small_describe
  app$categorie <- categorie
  app$modal_img_cover <- modal_img_cover
  app$modal_title <- modal_title
  app$modal_description <- modal_description
  #app$modal_list_img <- modal_list_img


  return(app)

}
