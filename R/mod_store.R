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
                 div(class="col-4 offset-2", style="color:#B95833;",
                   #h1(class="fw-bold",r$i18n$at("Hello")),
                   h1(class="fw-bold",r$showcase_title),
                   tags$b(class="fw-bold fs-4", textOutput(ns("showcase_small_description")))#r$vitrine_small_description
                 )
            )
        ),
        br(),
        div(class="row row-cols-2 row-cols-sm-3 row-cols-md-4 row-cols-lg-5 g-4 mx-3",

             mod_application_ui(ns("app1"), r, app = r$app1),
             mod_application_ui(ns("app2"), r, app = r$app1),
             mod_application_ui(ns("app3"), r, app = r$app1),
             mod_application_ui(ns("app4"), r, app = r$app1),
             mod_application_ui(ns("app5"), r, app = r$app1)
            ),
        br(),
        br()
    )

  )
}

#' store Server Functions
#'
#' @noRd
mod_store_server <- function(id, r, i18n_r, input_app_global){ #, result_auth
  moduleServer(
    id,
    function(input, output, session) {
    ns <- session$ns


    #observe({
    #  print(i18n_r()$t("Espace rassemblant l'ensemble des interfaces développées par moi-même Julien MILON autour des Data Sciences dans le Sport mais aussi la Santé."))
    #})
    #print(r$vitrine_small_description)

    #output$vitrine_small_description <- renderText({ i18n_r()$t(r$vitrine_small_description) })

    #shiny::observeEvent(
    #  ignoreInit = TRUE, autoDestroy=TRUE, once = TRUE,
    #  input$"modif_chantier-exit", {
    #    close()
    #  })

    observeEvent(input_app_global[["selected_language"]], {
      #print(input_modhover[["selected_language"]])
      output$showcase_small_description <- renderText({ i18n_r()$t(r$showcase_small_description) })

    })

    mod_application_server("app1", r, i18n_r = i18n_r, app = r$app1, input_app_global = input_app_global)
    mod_application_server("app2", r, i18n_r = i18n_r, app = r$app1, input_app_global = input_app_global)
    mod_application_server("app3", r, i18n_r = i18n_r, app = r$app1, input_app_global = input_app_global)
    mod_application_server("app4", r, i18n_r = i18n_r, app = r$app1, input_app_global = input_app_global)
    mod_application_server("app5", r, i18n_r = i18n_r, app = r$app1, input_app_global = input_app_global)

  })
}

## To be copied in the UI
# mod_store_ui("store_1")

## To be copied in the server
# mod_store_server("store_1")
