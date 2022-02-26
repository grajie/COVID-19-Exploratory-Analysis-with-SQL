# Exploratory Analysis on COVID 19 Data Set

Thank you for visiting the repository of Data Analysis and Visualization of COVID-19 Dataset.

This data exploration project is descriptive analysis of COVID-19 dataset containing data about COVID-19 cases, deaths, vaccinations, socio economic factors from Jan 1,2020 to Feb 5,2022. I have built global profile along with 10 most visited country profiles which will allow you to explore the statistic on the Coronavirus pandemic for each listed country.

This project is purely based on SQL Server, employing its innate capabilities:
- User-defined Procedures
- Temp Tables
- CTE
- Views 

## Table of Contents
- Dataset Overview
- Data Preparation
- Tools Used
- Exploratory Analysis
    1) Global COVID Explorer 
    2) Country COVID Profiles
    3) Inference
    

**Dataset Overview**
- Data Source: ourworldindata.org Links: https://covid.ourworldindata.org/data/owid-covid-data.xlsx https://github.com/owid/covid-19-data/tree/master/public/data
- Rows: 160000 Columns: 59

**Data Preparation**
- Handling of NULL Values
- Datatype for columns containing numerical data was converted to Float as they were imported as nvarchar

**ToolsUsed**
- RDBMS: Microsoft SQL Server Management Studio
- Tableau Public

**Exploratory Analysis**
1) Global COVID Tracker

        - Total Cases / Total Deaths / Mortality Rate (Case Fatality Ratio) : Global
        
        - Total Cases / Total Deaths / Mortality Rate  (Case Fatality Ratio) : For each Continent
        
        - Total Cases / Total Deaths / Mortality Rate  (Case Fatality Ratio) : For each Country
        
        - Cummulative number of new cases and new deaths over time
        
        - 7 Day Moving Average of daily new cases and new deaths
        
        - Date Of First Case Reported For Each Country

        - Date First Death was reported in each country
        
2) Country COVID Profiles

        - Cummulative number of New Cases by day
	      - Cummulative number of New Deaths by day
	      - 7-Day moving average of Covid Cases
      	- 7-Day moving average of Covid Deaths
      	- Percent Populaion Infected , Percent Populaiton Dead 





