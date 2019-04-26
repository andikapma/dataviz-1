if (!require("pacman")) {
  install.packages("pacman") 
}
pacman::p_load(char = c("tidyverse", "sf", "viridis", "corrplot", "waffle", "gghighlight", "visdat", "skimr", "plotly", "shiny", "flexdashboard"))
pacman::p_load_gh(char = "cttobin/ggthemr")
