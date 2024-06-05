tb <- readxl::read_xlsx(
  "/Users/jaredhileman/Downloads/Time Response Data Master.xlsx"
)

tb <- tidyr::fill(tb, c("Site", "Insect", "Insecticide"), .direction = "down")
tb$Insecticide[tb$Insecticide == "acetone" | tb$Insecticide == "Acetone"] <- "acetone"

controlData <- dplyr::filter(tb, Insecticide == "acetone")
experimentalData <- dplyr::filter(tb, Insecticide != "acetone")

experimentalData <- tidyr::fill(
  experimentalData, c("Concentration (ug/ml)", "Replicate")
  )
mortality <- tb

usethis::use_data(controlData, overwrite = TRUE)
usethis::use_data(experimentalData, overwrite = TRUE)
usethis::use_data(mortality, overwrite = TRUE)
