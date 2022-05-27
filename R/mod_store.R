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
