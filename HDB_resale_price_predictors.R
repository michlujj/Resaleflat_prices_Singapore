### HDB resale price 2017 to 2023 Exploratory data analysis

# to clear R environment
rm(list= ls())

library(tidyverse)
library(dplyr)

# to import dataset
df <- read.csv('C:/Users/miche/Desktop/machine_learning/Resale_flat_prices_sg.csv')

head(df)

# to check for missing values in each column
sapply(df, function(x) sum(is.na(x)))

# to check for duplicated values in dataset
duplicated(df)
sum(duplicated(df))

# to check total no.of observation and variable types
glimpse(df)

# to remove all duplicated values using distinct method
df <- df %>%
  distinct()

glimpse(df) # 287 duplicated values have been removed

# to see the distribution of resale price via histogram
hist(df$resale_price) # most prices are at the lower end

class(df$month)

# to convert variable to month and year repective
library(zoo)

df$month <- as.Date(as.yearmon(df$month))
df$month

# check that variable has been converted to date
class(df$month)

# to extract 'Month' and Year into new columns
df$Month <- format(df$month, "%m")

df$year <- format(df$month, "%Y")

head(df) #to view new columns created

# to remove original 'month' column after extracting relevant information
df <- select(df, -c(month))

glimpse(df)

unique(df$flat_type)

# to see count of no. of rooms in flat type
df %>% group_by(flat_type) %>% summarise(count=n())

# plot of Flat type vs Resale Price
ggplot(df, aes(flat_type, y=resale_price, fill=flat_type)) +
  geom_boxplot() + 
 scale_x_discrete(guide = guide_axis(n.dodge=2)) +
  ggtitle('Flat type Vs Resale Price')

# or

ggplot(df, aes(flat_type, y=resale_price, color=flat_type)) +
  geom_boxplot() + 
  scale_x_discrete(guide = guide_axis(angle=70)) + # rotate the words 70 degrees
  ggtitle('Flat type Vs Price, 2017 to 2023')


df %>% group_by(flat_model) %>% summarise(count=n()) %>% as.data.frame()

ggplot(df, aes(flat_model, y=resale_price)) +
  geom_boxplot() + 
  scale_x_discrete(guide = guide_axis(angle=70)) + # rotate the words 70 degrees
  ggtitle('Flat model Vs Price, 2017 to 2023')


# to print the average resale price by flat model
df %>% group_by(flat_model) %>% summarise(avg_price= mean(resale_price)) %>% as.data.frame()

# graph of Flat model Vs Price, 2017 to 2023
# Most expensive = Type S2
# Cheapest = 2 room
ggplot(df, aes(x=flat_model, y=resale_price))+
  geom_boxplot()+
  scale_x_discrete(guide = guide_axis(angle=70)) + 
  ggtitle('Flat model vs Price, 2017 to 2023')


# to plot floor area by resale price
ggplot(df, aes(floor_area_sqm, y=resale_price, color='purple')) +
  geom_point() +
  ggtitle('Floor area (sqm) Vs Price, 2017 to 2023')

# graph of Resale price by Town area
ggplot(df, aes(x=resale_price, y=town)) +
  geom_bar(stat="identity") +
  ggtitle('Resale price by Town, 2017 - 2023')

# print a dataframe of Resale price by Town
avgprice_df <- df %>% group_by(town) %>% summarise(avg_price=mean(resale_price)) %>% as.data.frame()
avgprice_df

# to sort Resale price by ascending
# Bukit Timah is the most expensive, Bishan the 2nd
avgprice_df[order(avgprice_df$avg_price),]


# HDB Resale price by Year
ggplot(df, aes(x=year, y=resale_price, fill=year)) +
  geom_boxplot() +
  ggtitle('Resale price by Year')

# a sharp increase in resale price is observed from 2021 to 2023
avgprice_year_df <- df %>% group_by(year) %>% summarise(avg_price=mean(resale_price)) %>% as.data.frame()
avgprice_year_df 

unique(df$year)

# to filter out information from 2023
df2 <- filter(df, year==2023)

head(df2)

#Exploratory data analysis for 2023
# Resale price by Town for 2023
ggplot(df2, aes(x=resale_price, y=town))+
  geom_bar(stat="identity") +
  ggtitle('Resale Price by Town, 2023')

# Resale price by flat model, 2023
ggplot(df2, aes(x=flat_model, y=resale_price)) +
  geom_boxplot()+
  scale_x_discrete(guide = guide_axis(angle=70)) + 
  ggtitle('Resale Price by flat model, 2023')

# Resale price by flat type
ggplot(df2, aes(x=flat_type, y=resale_price, fill=flat_type))+
  geom_boxplot()+
  scale_x_discrete(guide = guide_axis(n.dodge=2)) +
  ggtitle('Resale Price by flat type, 2023')

# to check the data types for df2
glimpse(df2)

# to conver 'month' and 'year' into numerics
df2$Month = as.numeric(df2$Month)
df2$year = as.numeric(df2$year)

# to select out numeric column from df2
df2 %>% dplyr::select(where(is.numeric))

ggplot(df2, aes(x=floor_area_sqm, y=resale_price))+
  geom_point(color='steelblue') +
  ggtitle('Floor Area Vs Resale price, 2023')







































