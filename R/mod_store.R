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
    div(class="container-fluid p-0", style="width:100%;",
        div(class="col-12 position-relative", style="width:100%;",
            img(src="www/boxeuse_dark.jpg",
                #class="px-1",
                style="height:40em; width:100%;"
                ),
            div( class="position-absolute absolute-bottom justify-content-start",style="width:100%; bottom:2em;",
                 div(class="col-sm-4 offset-md-2", style="color:#B95833;",
                   h1(class="fw-bold","jmilon-tech Store"),
                   tags$p(class="fw-bold fs-4", "Espace rassemblant l’ensemble des interfaces,développées par ma personne Julien MILON,autour des data sciences dans le sports mais aussi la santé. ")
                 )
            )
        )
    )

  )
}

#' store Server Functions
#'
#' @noRd
mod_store_server <- function(id, r){ #, result_auth
  moduleServer(
    id,
    function(input, output, session) {
    ns <- session$ns

  })
}

## To be copied in the UI
# mod_store_ui("store_1")

## To be copied in the server
# mod_store_server("store_1")
