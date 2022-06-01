#' application UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_application_ui <- function(id, r, app){
  ns <- NS(id)
  tagList(
    div(class="col",
        div(class="card h-100 text-center justify-content-center",
            img(src=app$img,
                class="card-img-top text-center",
                style="height:15em;"# width:10em;"
            ),
            div(class="card-body",
              h5(class="card-title", textOutput(ns("app_title"))),
              div(class="card-text", textOutput(ns("app_small_describe")))
            )
        )

    )

  )
}

#' application Server Functions
#'
#' @noRd
mod_application_server <- function(id, r, i18n_r, app, input_app_global){ #, result_auth
  moduleServer(
    id,
    function(input, output, session) {
      ns <- session$ns

      #print(app$small_describe)

      observeEvent(input_app_global[["selected_language"]], {
        print("Change Language")

        output$app_title <- renderText({ i18n_r()$t(app$title) })
        output$app_small_describe <- renderText({ i18n_r()$t(app$small_describe)})
      })


  })
}

## To be copied in the UI
# mod_application_ui("application_1")

## To be copied in the server
# mod_application_server("application_1")
