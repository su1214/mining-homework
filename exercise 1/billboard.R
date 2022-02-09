library(mosaic)
library(tidyverse)

billboard = read_csv('../ECO395M/data/billboard.csv')

billboard1 = billboard %>% 
  filter(year >= 1958) %>%
  group_by(song_id, song, performer) %>%
  summarize(count = n(), .groups = 'drop') %>%
  arrange(desc(count)) %>% head(10)  %>% select(song, performer, count)

billboard3 = c()

for (i in 1959:2020){
  billboard2 = billboard %>%
    filter(year == i) %>%
    group_by(song_id)
    billboard3[i-1958] = nrow(distinct(billboard2, song_id))
}

years = seq(1959, 2020, by=1)

df = data.frame(years = years, unique_songs = billboard3)

ggplot(df) + geom_line(aes(x=years, y=unique_songs))

billboard4 = billboard %>%
  group_by(song_id, performer) %>%
  summarize(count = n(), .groups='drop') %>%
  filter(count >= 10) %>%
  group_by(performer) %>%
  summarize(count = n()) %>%
  filter(count >= 30)

ggplot(billboard4) + 
  geom_col(aes(x=performer, y=count)) +
  coord_flip()
