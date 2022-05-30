#' store UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_store_ui <- function(id, r){
  ns <- NS(id)

  tagList(
    #usei18n(r$i18n),
    div(class="container-fluid p-0", style="width:100%;",
        div(class="col-12 position-relative", style="width:100%;",
            img(src="www/boxeuse_dark.jpg",
                #class="px-1",
                style="height:40em; width:100%;"
                ),
            div( class="position-absolute absolute-bottom justify-content-start",style="width:100%; bottom:2em;",
                 div(class="col-sm-4 offset-md-2", style="color:#B95833;",
                   #h1(class="fw-bold",r$i18n$at("Hello")),
                   h1(class="fw-bold",r$vitrine_title),
                   tags$b(class="fw-bold fs-4", textOutput(ns("vitrine_small_description")))#r$vitrine_small_description
                 )
            )
        )
    )

  )
}

#' store Server Functions
#'
#' @noRd
mod_store_server <- function(id, r, i18n_r){ #, result_auth
  moduleServer(
    id,
    function(input, output, session) {
    ns <- session$ns


    #observe({
    #  print(i18n_r()$t("Espace rassemblant l'ensemble des interfaces développées par moi-même Julien MILON autour des Data Sciences dans le Sport mais aussi la Santé."))
    #})
    #print(r$vitrine_small_description)
    output$vitrine_small_description <- renderText({ i18n_r()$t(r$vitrine_small_description) })
    #shiny::observeEvent(
    #  ignoreInit = TRUE, autoDestroy=TRUE, once = TRUE,
    #  input$"modif_chantier-exit", {
    #    close()
    #  })


  })
}

## To be copied in the UI
# mod_store_ui("store_1")

## To be copied in the server
# mod_store_server("store_1")
