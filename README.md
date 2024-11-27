# Fall-2024-Group-2
Repository for Fall 2024 Software Tools for Data Analysis Group Project
Group Members: Angelo Nicolosi, Brian Sok, Ryan Kantor, & Christina Wright

## Checkpoint 2 Summary
Since our last checkpoint, we have focused on the following areas
1. Organize our tasks within our team's project tracker (https://github.com/users/ChristinaWright05/projects/1/views/1)
2. Continue our exploratory data analysis, but try using Tableau (Links to Tableau Public below)
3. Begin outlining how we want our final analysis & report to be structured

## Report Outline

### Introduction
The current sentiment of Boston commuters on the Massachusetts Bay Transportation Authority (MBTA) is often quite negative. This past year, many lines have faced unexpected shutdowns, forcing commuters to seek out alternate forms of transportation. In a survey from Boston.com earlier this year, nearly 80% of commuters reported their daily commute on the MBTA as being a poor experience (https://www.boston.com/community/readers-say/green-line-january-2024-commute-readers-say/). As a team of analysts, we are going to dive into the ridership and performance data to provide the MBTA with key insights and recommendations on how they can improve the experience of their customers and regain trust for their commutes.

For this analysis, our primary stakeholder is the Massachusetts Department of Transportation, and more specifically the Massachusetts Bay Transportation Authority (MBTA). The decision to be made here is where should the government invest in performance improvements of the T system to make the largest impact on their commuters.

### Data Summary
To conduct this analysis, we will be using two main categories of data, both publically available on the MBTA's Blue Book Open Data Portal (https://mbta-massdot.opendata.arcgis.com). First, we will look at the ridership data - specifically the MBTA historical gate station entries (https://mbta-massdot.opendata.arcgis.com/datasets/7859894afb5641ce91a2bb03599fdf5b/about). Then, we will analyze this against the service alerts (https://mbta-massdot.opendata.arcgis.com/datasets/90ed9092bd7a4285b296d5ff938edf29_0/explore). 

To better use this data, we first cleaned it and then filtered and aggregated it on monthly levels (with the exception of keeping service alerts on the alert level too). These data sources are now on our github:
1. Monthly_Ridership.csv --> monthly gated entry numbers
2. Monthly_ServiceAlerts.csv --> monthly serive alert numbers
3. Alerts_Ridership_BySubwayLine.csv --> merged data set of both gated entries & alerts
4. ServiceAlerts_AlertLevel_BySubwayLine.csv --> alert level data with alert metadata

The code for preparing these datasets for analysis is contained in the file CheckPoint2_WorkingDocument_EDA_Plots.Rmd on this branch.

### Data Analytics
So far we have been able to conduct some exploratory data analysis of our ridership and alerts data. For now, as our work is in progress, these visualizations and analyses are split between .Rmd files and Tableau workbooks on Tableau Public. The .Rmd file on this branch (CheckPoint2_WorkingDocument_EDA_Plots.Rmd) is most up to date and includes all other individual commits. Within this file we have gathered insights around the serverity of alert types, which alert types are most frequent, and how ridership has varied across the subway lines. To help us further understand our data, we have also created a few Tableau Public dashboards, which we will ultimately combine for our final product:
1. Severity of Alerts by Subway Line: https://public.tableau.com/app/profile/ryan.kantor/viz/AnalysisbySubwayLine/Dashboard1
2. Frequency of Alerts & Location Analysis: https://public.tableau.com/app/profile/angelo.nicolosi/viz/LocationTimeAnalysis/Dashboard1
3. Relationships Between Ridership & Alerts: https://public.tableau.com/app/profile/christina.wright4148/viz/MBTARidershipAlertsTableau/RidershipAlertsSeverity?publish=yes

### Conclusion

### Recommendations
The goal of this analysis will be to find the most impactful service alerts, whether that be type of service issue, particular line of the issue, or circumstances around the issues (i.e. were these unexpected or planned service delays/outages). From there we can provide recommendations to the MBTA on where to focus in the coming year.

