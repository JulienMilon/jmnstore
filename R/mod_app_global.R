#' app_global UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session, Internal parameters for {shiny}.
#' @param r Dataset. containing app global parameters, theme, app information (img, title)
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
                                        class="px-1 pb-1",
                                        style="height:2em;"),
                                 #   href = "https://www.sesan.fr/",
                                    target = "_blank"
                                  ))
  )


  i18n <- golem::get_golem_options(which = "translator")
  i18n$set_translation_language("English")


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
     padding-right: 0px;}

     .modal-body {
            position: relative;
            overflow-y: auto;
            margin: 0 ;
            padding: 0;
      }
      .modal-content{
            padding: 0;
            margin: 0;
      }"
                 )
    ),


    usei18n(i18n),

    navbarPage(navbar_brand_html, #collapsible = TRUE, inverse = FALSE,

               tabPanel("Store", mod_store_ui(ns("store"), r)), #result_auth,

               tabPanel("Mentions l\u00e9gales", mod_legal_mentions_ui(ns("legal_mentions"), r)), #result_auth,

               bslib::nav_spacer(),
                bslib::nav_item(
                  div(class="d-inline-block me-4 align-items-center",style="width:10rem; height:2em;",
                      selectInput(ns('selected_language'),
                              NULL,
                              choices = i18n$get_languages(),
                              selected = i18n$get_key_translation())
                      )

                    )
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


      i18n <- golem::get_golem_options(which = "translator")
      i18n$set_translation_language("English")

      i18n_r <- reactive({
        i18n
      })


      observeEvent(input[["selected_language"]], {
        shiny.i18n::update_lang(session, input[["selected_language"]])
        i18n_r()$set_translation_language(input[["selected_language"]])
      })


      # Deconnexion
      observeEvent(input$deconnexion_nav, {
        session$close()
      })

      #mod_store_server("store", r, i18n_r = i18n_r) #, result_auth
      mod_store_server("store", r, i18n_r = i18n_r, input_app_global=input) #, result_auth , i18n_r = i18n_r
      mod_legal_mentions_server("legal_mentions", r) #, result_auth


  })
}

## To be copied in the UI
# mod_app_global_ui("app_global_1")

## To be copied in the server
# mod_app_global_server("app_global_1")
