### https://stackoverflow.com/questions/23130604/plot-coordinates-on-map
### https://stackoverflow.com/questions/20937682/r-trying-to-find-latitude-longitude-data-for-cities-in-europe-and-getting-geocod
### https://stackoverflow.com/questions/36175529/getting-over-query-limit-after-one-request-with-geocode

### LIMITAÇÕES: API do google e endereços não podem conter acentos e ç

library(devtools)
devtools::install_github("dkahle/ggmap")
library(ggmap)
library(ggplot2)

#pegar API do google maps
#register_google(key = "numero_da_chave") ### substituir numero_da_chave pela chave da API do google https://developers.google.com/maps/documentation/geocoding/get-api-key#key
# tem que habilitar a API https://console.developers.google.com/flows/enableapi?apiid=geocoding_backend&reusekey=true

ender <- read.csv("input", stringsAsFactors = FALSE) ### input é o endereço do csv
geo <- geocode(as.character(ender$ender))

map1 <- get_map(location = c(lon = mean(geo$lon), lat = mean(geo$lat)), zoom = 10, maptype = 'terrain') 

ggmap(map1) +
  geom_point(data = geo, aes(x = lon, y = lat, fill = "red"), size = 5, shape = 21) +
  guides(fill=FALSE, alpha=FALSE, size=FALSE)