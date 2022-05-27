#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function(input, output, session) {


  Sys.getenv()
  Sys.setlocale("LC_ALL", "fr_FR.UTF-8")
  Sys.setenv(no_proxy="localhost,127.0.0.1")



  r <- list(NULL)

  r$app_title <- "jmnstore"

  r$theme <- bslib::bs_theme(
    version=5,
    bootswatch = "flatly",
    bg = "#E8E8E8",
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
