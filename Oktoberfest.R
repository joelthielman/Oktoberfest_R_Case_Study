library(tidyverse)
setwd("~/Portfolio/Oktoberfest")

df = read.csv("oktoberfest_in_total_1985_2022_clean.csv")

summary(df$total_visitors_millions)
summary(df$beer_consumed_liters_millions)
summary(df$average_visitors_per_day_thousands)

df %>%
  select(year, beer_price_euros, chicken_price_euros)

df %>%
  select(year, beer_consumed_liters_millions, chicken_consumed_units_thousands)

ylim.prim = c(0:800)
ylim.sec = c(0, 14)

scaleFactor = max(df$beer_consumed_liters_millions) / max(df$beer_price_euros)
scaleFactor2 = max(df$chicken_consumed_units_thousands) / max(df$chicken_price_euros)


ggplot(df, aes(year)) +
  geom_col(aes(y = beer_consumed_liters_millions), alpha = 0.5) +
  geom_line(aes(y = beer_price_euros * scaleFactor), color = "darkgreen", linewidth = 1.2) +
  scale_y_continuous(breaks = 0:8, name = "Beer consumed (millions of liters)",
                     sec.axis = sec_axis(~./scaleFactor, breaks = 0:14, name = "Price (euros)")) +
  scale_x_continuous(name = "Year", breaks = 1985:2022) +
  theme(axis.line.y.right = element_line(color = "darkgreen"), 
        axis.ticks.y.right = element_line(color = "darkgreen"),
        axis.text.y.right = element_text(color = "darkgreen"), 
        axis.title.y.right = element_text(color = "darkgreen", size = 48/.pt),
        axis.title.y.left = element_text(size = 48/.pt),
        axis.title.x = element_text(size = 48/.pt),
        plot.title = element_text(size = 64/.pt)) +
        ggtitle("Munich Oktoberfest 1985-2022
                Beer Price and Consumption")


ggplot(df, aes(year)) +
  geom_col(aes(y = chicken_consumed_units_thousands), alpha = 0.5) +
  geom_line(aes(y = chicken_price_euros * scaleFactor2), color = "brown", linewidth = 1.2) +
  scale_y_continuous(breaks = c(0,100,200,300,400,500,600,700,800), name = "Chicken consumed (thousands of units)",
                     sec.axis = sec_axis(~./scaleFactor2, breaks = 0:14, name = "Price (euros)")) +
  scale_x_continuous("Year", breaks = 1985:2022) +
  theme(axis.line.y.right = element_line(color = "brown"), 
        axis.ticks.y.right = element_line(color = "brown"),
        axis.text.y.right = element_text(color = "brown"), 
        axis.title.y.right = element_text(color = "brown", size = 48/.pt),
        axis.title.y.left = element_text(size = 48/.pt),
        axis.title.x = element_text(size = 48/.pt),
        plot.title = element_text(size = 64/.pt)) +
        ggtitle("Munich Oktoberfest 1985-2022
                Chicken Price and Consumption")


ggplot(df, aes(x = year, y = beer_consumed_per_person_liters)) +
        geom_col(fill = "goldenrod") +
        labs(title = "Munich Oktoberfest 1985-2022
                     Beer Consumed Per Person (liters)",
              y = "Beer Consumed Per Person (liters)",
              x = "Year") +
        scale_y_continuous(breaks = c(0,0.25,0.5,0.75,1,1.25,1.5)) +
        scale_x_continuous(breaks = c(1985:2022)) +
        theme(plot.title = element_text(size = 64/.pt),
              axis.title.x = element_text(size = 48/.pt),
              axis.title.y = element_text(size = 48/.pt))
