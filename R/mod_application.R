#' application UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#' @param r Dataset. containing app global parameters, theme, app information (img, title)
#' @param i18n_r Dataset. Translation system
#' @param input_app_global List. Input list of mod_app_global_ui for Language selector input
#' @param app Dataset. Application information (Titles, descriptions, images)
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_application_ui <- function(id, r, app){
  ns <- NS(id)
  tagList(

    div(class="col",
        tags$button(id=ns("thumbnail"),type="button",class="card h-100 text-center justify-content-center bg-light shadow action-button", #"data-toggle"="modal", ou tags$button
                img(src=app$thumbnail_img,
                    class="card-img-top text-center",
                    style="height:15em;"# width:10em;"
                ),
                div(class="card-body justify-content-center",
                  h5(class="card-title", textOutput(ns("app_title"))),
                  div(class="card-text", textOutput(ns("app_small_describe"))),
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
        #print("Change Language")

        output$app_title <- renderText({ i18n_r()$t(app$thumbnail_title) })
        output$app_small_describe <- renderText({ i18n_r()$t(app$thumbnail_small_describe)})
      })



      observeEvent(input$thumbnail, {

        shiny::showModal(modalDialog(
          easyClose=FALSE,
          footer = NULL,
          size = "xl",
          tagList(

            div(class="d-flex justify-content-center w-100 position-relative",
                img(src=app$modal_img_cover,
                    class="card-img-top text-center",
                    style="height:25em;"# width:10em;"
                ),
                div(class="position-absolute align-top", style="top:1em; width:100%;",
                        tags$div(class="d-flex flex-row-reverse",
                          tags$button(id=ns("exit_modal1"),type="button", class="btn-close btn-close-white action-button me-3", "data-bs-dismiss"="modal",'aria-label'="Close"))
                    ),

            ),
            div(class="col 11 mx-4",
                h5(i18n_r()$t(app$modal_title)),
                div(i18n_r()$t(app$modal_description)),
            ),


            ### bouton de fermeture
            #div(class="d-flex justify-content-end",
            #    tags$div(tags$button(id=ns("exit_modal1"),type="button", class="btn-close action-button", "data-bs-dismiss"="modal",'aria-label'="Close"))),
            # modal title
            br(),
          )
          #title = i18n_r()$t(app$thumbnail_title) ,
        ))
      })



      shinyjs::onclick("test",
                       function(){
                         print("A")
                       })

  })
}

## To be copied in the UI
# mod_application_ui("application_1")

## To be copied in the server
# mod_application_server("application_1")
