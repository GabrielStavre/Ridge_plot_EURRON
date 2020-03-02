#############################################
## Make Ridge plot using EURRON daily data ##
#############################################


# Set working directory
#setwd("~/Documents/Plots/Ridge_plots/EUR_RON/GitHub version")


# Housekeeping
rm(list = ls())


# Define libraries
library(ggplot2)
library(readxl)
library(ggridges)
library(viridis)


# Load data
DB_D <- read_xlsx("CURSZ_update_20191128.xlsx", sheet = "DB_D")


# Build plot
last_value <- DB_D$EUR_RON[length(DB_D$EUR_RON)]
ggplot(DB_D, aes(x = EUR_RON, y = as.factor(Year), fill = ..x..)) +
  geom_density_ridges_gradient(scale = 5, rel_min_height = 0.01) +
  scale_fill_viridis(name = "Appreciation/ Depreciation", option = "A") + 
  scale_x_continuous(limits = c(1,5), breaks = c(round(seq(-5,7,by = 0.5),1),round(last_value,2))) +
  geom_vline(xintercept = last_value, linetype = "dashed", color = "darkred", size=0.5) +
  theme_ridges() +
  labs(title = "EURRON exchange rate, at daily frequency",
       caption = "Source: National Bank of Romania",
       x = "1*EUR=x*RON",
       y = "Year") +
  theme(plot.caption = element_text(hjust = 0)) +
  theme(legend.position = "none") +
  theme(plot.title = element_text(size = 28),
        plot.subtitle = element_text(size = 28, face = "italic"),
        plot.caption = element_text(size = 18, face = "italic"),
        axis.text.x = element_text(size = 16),
        axis.text.y = element_text(size = 20),
        axis.title.x = element_text(size = 18),
        axis.title.y = element_text(size = 18))