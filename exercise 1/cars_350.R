library(tidyverse)
library(ggplot2)
library(rsample)
library(caret)
library(modelr)
library(parallel)
library(foreach)

cars = read_csv('../ECO395M/data/sclass.csv')

cars_350 = cars %>% filter(trim == '350')

summary(cars_350)

# plot the data
ggplot(data = cars_350) + 
  geom_point(mapping = aes(x = mileage, y = price), color='darkgrey')

# test train split
cars_350_split =  initial_split(cars_350, prop=0.9)
cars_350_train = training(cars_350_split)
cars_350_test  = testing(cars_350_split)

k_grid = c(2, 4, 6, 8, 10, 15, 20, 25, 30, 35, 40, 45,
           50, 60, 70, 80, 90, 100, 125, 150, 175, 200, 250, 300)

k_grid = seq(2,200, by=1)

cv_grid = foreach(k = k_grid, .combine='rbind') %dopar% {
  knn = knnreg(price ~ mileage, data=cars_350_train, k=k)
  rms = rmse(knn, cars_350_test)
  c(k=k, err=rms)
} %>% as.data.frame

head(cv_grid)

ggplot(cv_grid) + 
  geom_point(aes(x=k, y=err)) + 
  scale_x_log10()

cv_grid_final = cv_grid %>% filter(err == min(cv_grid$err))
cv_grid_final$k

knn = knnreg(price ~ mileage, data=cars_350_train, k=cv_grid_final$k)

cars_350_test = cars_350_test %>%
  mutate(price_pred = predict(knn, cars_350_test))

p_test = ggplot(data = cars_350_test) + 
  geom_point(mapping = aes(x = mileage, y = price), alpha=0.2)
p_test

# now add the predictions
p_test + geom_line(aes(x = mileage, y = price_pred), color='red', size=1.5)

