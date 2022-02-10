library(tidyverse)
library(mosaic)
library(ggmap)
library(airportr)
library(aptheme)
library(ggrepel) 
airport = read_csv('../ECO395M/data/ABIA.csv')

airport = airport %>% mutate(TotalDelay = ArrDelay+DepDelay)
  
all_airports_origin = unique(airport$Origin)
all_airports_dest = unique(airport$Origin)

all_unique_airports = unique(append(all_airports_origin, all_airports_dest))

airpot_from_aus = airport %>%  filter(Origin == 'AUS')
airport_to_aus = airport %>% filter(Dest == 'AUS')
count = c()
lat = c()
long = c()

for(i in 1:length(all_unique_airports)){
    c = append(c, nrow(airport_to_aus %>% filter(Origin == all_unique_airports[i]))[1])
    lat = append(lat, airport_location(all_unique_airports[i], input_type = 'IATA')$Latitude)
    long = append(long, airport_location(all_unique_airports[i], input_type = 'IATA')$Longitude)
}

c = c[2:54]

df_unique_airports = data.frame(all_unique_airports,count = array(unlist(c)), lat, long)

map = get_map("usa", zoom=4)

mapPointsDA <- ggmap(map) + geom_point(aes(x = long, y = lat, size = sqrt(count)), data = df_unique_airports, alpha = .5, color = "52CBF3") 
mapPointsLegendDA <- mapPointsDA + scale_size_area(breaks = sqrt(c(1, 5, 10, 50, 100, 500)), labels = c(1, 5, 10, 50, 100, 500))
map_final <- mapPointsLegendDA + geom_label_repel(data = df_unique_airports %>% arrange(desc(count)) %>% head(5), nudge_x = 0.002, nudge_y = -0.015,
                                     aes(x = long, y = lat, label = all_unique_airports))
map_final

