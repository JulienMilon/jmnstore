#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function(input, output, session) {


  Sys.getenv()
  #Sys.setlocale("LC_ALL", "fr_FR.UTF-8")
  Sys.setenv(no_proxy="localhost,127.0.0.1")



  r <- list(NULL)

  r$app_title <- "jmnstore"


  ### Global text showcase part ====
  r$showcase_title <- "jmilon-tech Store"
  r$showcase_small_description <- "Espace rassemblant l'ensemble des interfaces, développées par moi-même Julien MILON, autour des Data Sciences dans le Sport mais aussi la Santé."

  ### App part ====

      ### App number 1
          ### Thumbnail
  r$app1 <- app_param(thumbnail_img = "www/vignette_img.png",
                 thumbnail_title = "Application Test V-FR",
                 thumbnail_small_describe = "Test Petite description V-FR",
                 #categorie = c(1,2),
                 modal_img_cover = "www/chest_robot.jpg",
                 #modal_title = "Application 1 FR"
                 modal_description = "Ceci est la description de l'application test V-FR, ceci est la description de l'application test V-FR, ceci est la description de l'application test V-FR,  ceci est la description de l'application test V-FR."#,
                 #modal_list_img =c()
  )
  #r$app1$thumbnail_title <- "Application 1 FR"
  #r$app1$thumbnail_small_describe <- "Test pour appli 1 FR"

  #r$app1$categorie <- c(1,2)

  #r$app1$modal_img <- "www/chest_robot.jpg"
  #r$app1$modal_title <-"Application 1 FR"




  ### Theme ====
  r$theme <- bslib::bs_theme(
    version=5,
    bootswatch = "flatly",
    bg = "#D5D5D5",
    fg = "#575757",
    primary = "#293173",
    secondary = "#757575",
    success = "#b95833",
    light = "#f4f4f4",
    #info = "#2e4da5",
    dark = "#14322c",
    #warning = "#894090",
    danger = "#b95833"#,
    #base_font = bslib::font_google("Quicksand"),
    #code_font = bslib::font_google("Quicksand"),
    #heading_font = bslib::font_google("Comfortaa")
  )


  # Initialization of authentication process
  #output$page <- shiny::renderUI(secureOutput("secure", r))
  #result <- authentifier::renderSecure("secure", r)

  # observe the result of authentication
  #observe({
  #  #print(result$success())
  #  if (result$success()==1){
      output$page <- shiny::renderUI(mod_app_global_ui("myapp", r=r)) #, result_auth=result
      mod_app_global_server("myapp", r=r) #, result_auth=result
  #  }
  #})
  # close the connection when end of session or stop (mandatory in dev and prod)
  #disconnect_close(r)#, result_auth=result



}
