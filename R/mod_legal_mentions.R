#' legal_mentions UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_legal_mentions_ui <- function(id, r){
  ns <- NS(id)
  tagList(
    h4("Test")

  )
}

#' legal_mentions Server Functions
#'
#' @noRd
mod_legal_mentions_server <- function(id, r){ #, result_auth
  moduleServer(
    id,
    function(input, output, session) {
      ns <- session$ns

  })
}

## To be copied in the UI
# mod_legal_mentions_ui("legal_mentions_1")

## To be copied in the server
# mod_legal_mentions_server("legal_mentions_1")
