library(tidyverse)

weather <- read_csv("data-raw/weather.csv")

weather <- 
  weather %>% 
  transmute(
    location = recode(location, Bubat = "Buah Batu"),
    time = parse_datetime(as.character(WIB), locale = locale(tz = "Asia/Jakarta")),
    temperature = `T2m(oC)`,
    pressure = `mslp()`,
    windspeed = sqrt(`U10(m/s)`^2 + `V10(m/s)`^2)
  )

save(weather, file = "data/weather.rda", compress = "bzip2", compression_level = 9)
