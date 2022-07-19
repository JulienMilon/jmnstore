r <- list(NULL)

r$app_title <- "jmnstore"

### Global text showcase part ====
r$showcase_title <- "jmilon-tech Store"
r$showcase_small_description <- "Espace rassemblant l'ensemble des interfaces, développées par moi-même Julien MILON, autour des Data Sciences dans le Sport mais aussi la Santé."

### App part ====

### App number 1
### Thumbnail
r$app1 <- app_param(thumbnail_img = "www/Sans titre (2).png",
                    thumbnail_title = "Application Test V-FR",
                    thumbnail_small_describe = "Test Petite description V-FR",
                    #categorie = c(1,2),
                    modal_img_cover = "www/chest_robot.jpg",
                    #modal_title = "Application 1 FR"
                    modal_description = "Ceci est la description de l'application test V-FR, ceci est la description de l'application test V-FR, ceci est la description de l'application test V-FR,  ceci est la description de l'application test V-FR."#,
                    #modal_list_img =c()
)
#r$app1$thumbnail_title <- "Application 1 FR"
#r$app1$thumbnail_small_describe <- "Test pour appli 1 FR"

#r$app1$categorie <- c(1,2)

#r$app1$modal_img <- "www/chest_robot.jpg"
#r$app1$modal_title <-"Application 1 FR"

### Theme ====
r$theme <- bslib::bs_theme(
  version=5,
  bootswatch = "flatly",
  bg = "#D5D5D5",
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

# i18n <- golem::get_golem_options(which = "translator")
# i18n$set_translation_language("Français")
#
# i18n_r <- reactive({
#   i18n
# })
#
# input_app_global <- list(NULL)


# testServer(
#   mod_store_server,
#   # Add here your module params
#   args = list(r, i18n_r, input_app_global)
#   , {
#     ns <- session$ns
#     expect_true(
#       inherits(ns, "function")
#     )
#     expect_true(
#       grepl(id, ns(""))
#     )
#     expect_true(
#       grepl("test", ns("test"))
#     )
#     # Here are some examples of tests you can
#     # run on your module
#     # - Testing the setting of inputs
#     # session$setInputs(x = 1)
#     # expect_true(input$x == 1)
#     # - If ever your input updates a reactiveValues
#     # - Note that this reactiveValues must be passed
#     # - to the testServer function via args = list()
#     # expect_true(r$x == 1)
#     # - Testing output
#     # expect_true(inherits(output$tbl$html, "html"))
# })

# test_that("module ui works", {
#   ui <- mod_store_ui(id = "test", r=r)
#   golem::expect_shinytaglist(ui)
#   # Check that formals have not been removed
#   fmls <- formals(mod_store_ui)
#   for (i in c("id")){
#     expect_true(i %in% names(fmls))
#   }
# })
#
