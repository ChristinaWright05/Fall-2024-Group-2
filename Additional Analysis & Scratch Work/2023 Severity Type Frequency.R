library(tidyverse)

mbta2023 <- read_csv("C:/Users/Brian/OneDrive/Desktop/MSAE/Software for Data Analysis/Archive 2020-2023/MBTA_Alerts_2023.csv")

str(mbta2023)

severity_type <- unique(mbta2023$severity_level)

severity_counts <- mbta2023 %>%
  count(severity_level, name = "frequency")


ggplot(severity_counts, aes(x = severity_type, y = frequency,  fill= severity_type))+
  geom_bar(stat = "Identity", fill = "skyblue", color = "white") +
  labs( title = "Count of Severity Type 2023", x = "Severity Type", y = "Count")+
  scale_y_continuous(labels = scales::label_number()) +
  theme_minimal()
