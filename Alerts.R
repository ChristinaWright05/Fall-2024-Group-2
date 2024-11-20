library(dplyr)
library(ggplot2)
library(lubridate)
library(readr)

ridership_2023 <- read_csv("~/Desktop/School/Software tools for Data Analysis/Project/GSE_2023.csv")
ridership_2024 <- read_csv("~/Desktop/School/Software tools for Data Analysis/Project/GSE_2024.csv")
service_alerts <- read_csv("~/Desktop/School/Software tools for Data Analysis/Project/MBTA_Service_Alerts.csv")

ridership <- bind_rows(ridership_2023, ridership_2024)

ridership <- ridership %>%
  mutate(service_date = as.Date(service_date),
         gated_entries = ifelse(gated_entries < 0, NA, gated_entries))  

service_alerts <- service_alerts %>%
  mutate(notif_start = as.Date(notif_start),  
         month = floor_date(notif_start, "month"))  

# Top Alert Frequency
top_alert_types <- service_alerts %>%
  count(effect_name) %>%
  arrange(desc(n)) %>%
  slice(1:5) %>%
  pull(effect_name)

# Only Top Alerts
filtered_alerts <- service_alerts %>%
  filter(effect_name %in% top_alert_types)

# Top Alert Count
monthly_alerts <- filtered_alerts %>%
  group_by(month, effect_name) %>%
  summarise(alert_count = n(), .groups = "drop")

# PAST 3 Years
start_date <- as.Date("2021-01-01")
monthly_alerts <- monthly_alerts %>% filter(month >= start_date)

#VIZ
ggplot(monthly_alerts, aes(x = month, y = alert_count, fill = effect_name)) +
  geom_bar(stat = "identity", position = "stack") +
  labs(title = "Monthly Frequency of All Top Alert Types (Last 3 Years)",
       x = "Month",
       y = "Alert Frequency",
       fill = "Alert Type") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))


#This chart shows that Delay alerts are by far the most frequent, 
#making them a key area for the MBTA to address. The high frequency of delays 
#suggests that focusing on reducing these disruptions could significantly 
#improve rider experience. Other alerts like Detour, Elevator Closure,
#and Track Change, though less frequent, also impact riders, particularly 
#in accessibility and route consistency. To optimize service, MBTA could analyze
#these alerts by line or station, differentiate between planned and unplanned 
#disruptions, and prioritize maintenance to prevent unexpected outages. For the
#coming year, targeted efforts on reducing delays, enhancing communication, and
#ensuring accessibility would likely yield the most positive impacts for riders.
