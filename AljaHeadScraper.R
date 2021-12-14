library(rvest)
library(tidyverse)

aljurl <- read_html(paste0("https://www.aljazeera.com/"))

headlinks <- aljurl %>% 
  html_nodes(".u-clickable-card__link") %>% 
  html_attr("href")

links <- data.frame(
  date = Sys.Date(),
  headline_links = headlinks
)

write.csv(links,file = paste0("data/Headlinks.csv"))
