#' app_global UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_app_global_ui <- function(id, r){
  ns <- NS(id)

  #logo en haut a gauche
  navbar_brand_html <- tags$span(class="navbar-brand primary",

                                  tags$span(tags$a(
                                    img(src="www/jmilon-tech_blanc.svg",
                                        class="px-1",
                                        style="height:2.1em;"),
                                 #   href = "https://www.sesan.fr/",
                                    target = "_blank"
                                  ))
  )




  shiny::bootstrapPage(
    title = r$app_title,
    theme = r$theme,
    tags$head(tags$link(rel="shortcut icon", href="favicon.png")),
    tags$style(".btn-group {width: 100%;}"),
    shinydisconnect::disconnectMessage(
      text = paste0("Votre session ", r$app_title," a expir\u00e9"),
      refresh = "Rouvrir une session",
      background = bslib::bs_get_variables(r$theme, "primary"),
      colour = "white",
      refreshColour = bslib::bs_get_variables(r$theme, "success"),
      overlayColour = bslib::bs_get_variables(r$theme, "primary"),
      overlayOpacity = 0.4,
      width = "full",
      top = "center",
      size = 20,
      css = ""),

    tags$head(
      tags$style(".navbar:not(.fixed-bottom):not(.navbar-fixed-bottom):not(.navbar-fixed-bottom) {
     margin-bottom: 0px;}")
    ),

    tags$head(
      tags$style(".container, .container-fluid, .container-xxl, .container-xl, .container-lg, .container-md, .container-sm {
     padding-left: 0px;
     padding-right: 0px;}")
    ),



    navbarPage(navbar_brand_html, #collapsible = TRUE, inverse = FALSE,

               tabPanel("Store", mod_store_ui(ns("store"), r)), #result_auth,

               tabPanel("Mentions légales", mod_legal_mentions_ui(ns("legal_mentions"), r)), #result_auth,

               #bslib::nav_spacer(),
               # bslib::nav_item(tags$button(
               #   type="button",
               #   id=ns("deconnexion_nav"),
               #   class="btn btn-danger action-button m-0 p-0",
               #   style="width:2em;height:2em;",
               #   icon("power-off")))
    ),
    #authentifier::toolOutput(ns("adm_tool"))
  )


}

#' app_global Server Functions
#'
#' @noRd
mod_app_global_server <- function(id, r){ #, result_auth
  moduleServer(
    id,
    function(input, output, session) {
      ns <- session$ns

      #authentifier::renderTool("adm_tool", result_auth = result_auth, r=r)

      # Deconnexion
      observeEvent(input$deconnexion_nav, {
        session$close()
      })

      mod_store_server("store", r) #, result_auth
      mod_legal_mentions_server("legal_mentions", r) #, result_auth


  })
}

## To be copied in the UI
# mod_app_global_ui("app_global_1")

## To be copied in the server
# mod_app_global_server("app_global_1")
