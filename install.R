if (!require("pacman")) {
  install.packages("pacman") 
}

# For packages from CRAN --------------------------------------------------

pacman::p_load(char = c("tidyverse", "sf", "viridis", "corrplot", "waffle", "gghighlight", "visdat", "skimr", "gganimate", "gifski", "plotly", "shiny", "flexdashboard", "scales", "htmlwidgets", "magick", "grid"))

# For packages from GitHub ------------------------------------------------

pacman::p_load_gh(char = "cttobin/ggthemr")
