library(mosaic)
library(tidyverse)

olympics = read_csv('../ECO395M/data/olympics_top20.csv')

olympics_female = olympics %>%
  filter(sex == 'F') %>%
  filter(sport == 'Athletics') %>%
  summarize(q95_temp = quantile(height, 0.95))

olympics2 = olympics %>%
  filter(sex == 'F') %>%
  group_by(event) %>%
  summarize(sd_height = sd(height, na.rm=TRUE))%>%
  filter(sd_height != 'NA')

max(olympics2$sd_height)

olympics3 = olympics %>%
  filter(sport == 'Swimming') %>%
  group_by(year) %>%
  summarize(mean_age = mean(age))

ggplot(olympics3) +
  geom_line(aes(x=year, y=mean_age))

olympics4 = olympics %>%
  filter(sport == 'Swimming') %>%
  group_by(year, sex) %>%
  summarize(mean_age = mean(age))

ggplot(olympics4) +
  geom_line(aes(x=year, y=mean_age)) +
  facet_wrap(~sex)
