# Exploratory Analysis on COVID 19 Data Set

Thank you for visiting the repository of Data Analysis and Visualization of COVID-19 Dataset.

This data exploration project is Descriptive Analysis and Visualization of COVID-19 dataset containing data about COVID-19 cases, deaths, vaccinations, socio economic factors from Jan 1,2020 to Feb 5,2022.

I have built global profile along with induvidual country profiles which will allow you to explore the statistic on the Coronavirus pandemic for each country.

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
    1) [Global COVID Explorer ](https://github.com/grajie/COVID-19-Exploratory-Analysis-with-SQL/blob/main/COVID19-Exploratory%20Analysis.sql)
    2) [Country COVID Profiles](https://github.com/grajie/COVID-19-Exploratory-Analysis-with-SQL/blob/main/COVID19-Exploratory%20Analysis.sql)
    3) [Government Policy Responces](https://github.com/grajie/COVID-19-Exploratory-Analysis-with-SQL/blob/main/COVID19-Exploratory%20Analysis.sql)
    4) [Relationship between Macro-Socioeconomics Determinants and COVID-19 Vaccine Distribution](https://github.com/grajie/COVID-19-Exploratory-Analysis-with-SQL/blob/main/COVID19-Exploratory%20Analysis.sql)
    5) Inference
    

## Dataset Overview
- Data Source: ourworldindata.org Links: https://covid.ourworldindata.org/data/owid-covid-data.xlsx

## Data Preparation
- Handling of NULL Values
- Datatype for columns containing numerical data was converted to Float as they were imported as nvarchar

## ToolsUsed
- RDBMS: Microsoft SQL Server Management Studio
- Tableau Public

## Exploratory Analysis
**1-Global COVID Tracker**

[- Total Cases/ Total Deaths / Mortality Rate (Case Fatality Ratio) : Global](https://github.com/grajie/COVID-19-Exploratory-Analysis-with-SQL/blob/main/COVID19-Exploratory%20Analysis.sql#L95-L97)
[- Total Cases / Total Deaths / Mortality Rate  (Case Fatality Ratio) : For each Continent](https://github.com/grajie/COVID-19-Exploratory-Analysis-with-SQL/blob/main/COVID19-Exploratory%20Analysis.sql#L101-L107)     
   
[- Total Cases / Total Deaths / Mortality Rate  (Case Fatality Ratio) : For each Country](https://github.com/grajie/COVID-19-Exploratory-Analysis-with-SQL/blob/main/COVID19-Exploratory%20Analysis.sql#L241-L254)
 
[- Distribution of Covid Cases worldwide](https://github.com/grajie/COVID-19-Exploratory-Analysis-with-SQL/blob/main/COVID19-Exploratory%20Analysis.sql#L340-L391)
 
[- Global Mortality Distribution](https://github.com/grajie/COVID-19-Exploratory-Analysis-with-SQL/blob/main/COVID19-Exploratory%20Analysis.sql#L286-L336)   
       
[- Cummulative number of new cases and new deaths over time](https://github.com/grajie/COVID-19-Exploratory-Analysis-with-SQL/blob/main/COVID19-Exploratory%20Analysis.sql#L142-L150)
 
[- 7 Day Moving Average of daily new cases and new deaths](https://github.com/grajie/COVID-19-Exploratory-Analysis-with-SQL/blob/main/COVID19-Exploratory%20Analysis.sql#L110-L140)      
   
[- Date Of First Case Reported For Each Country](https://github.com/grajie/COVID-19-Exploratory-Analysis-with-SQL/blob/main/COVID19-Exploratory%20Analysis.sql#L155-L158)
     
[- Case Summary of Each Country : Total Cases, Total Deaths, Percent Population Infected, Percent Population Dead, Mortality Rate](https://github.com/grajie/COVID-19-Exploratory-Analysis-with-SQL/blob/main/COVID19-Exploratory%20Analysis.sql#L239-L266)	
 
[- TOP 10 countries most affected by COVID](https://github.com/grajie/COVID-19-Exploratory-Analysis-with-SQL/blob/main/COVID19-Exploratory%20Analysis.sql#L273-L276)	
 
- Top 10 countries with most deaths due to COVID(https://github.com/grajie/COVID-19-Exploratory-Analysis-with-SQL/blob/main/COVID19-Exploratory%20Analysis.sql#L278-L281) 
 
- Countries Sorted as Highest to Loweset Case Count(https://github.com/grajie/COVID-19-Exploratory-Analysis-with-SQL/blob/main/COVID19-Exploratory%20Analysis.sql#L268-L271)	

- Countries Sorted as Highest to Loweset Death Count(https://github.com/grajie/COVID-19-Exploratory-Analysis-with-SQL/blob/main/COVID19-Exploratory%20Analysis.sql#L272-L275)

- Global Vaccination Report : Cummulative Distribution Relative to Population
 
- Top 10 Country with most citizens partially Vaccinated

- Top 10 Country with most citizens Fully Vaccinated

- Top 10 Countries with most Doses Administered

- Daily Share of Vaccinations: 7 Day Moving Average per country

      
**2) Country COVID Profiles**
		
        - Cummulative number of New Cases by day         
         
        - Cummulative number of New Deaths by day	 
         
        - 7-Day moving average of Covid Cases	 
         
        - 7-Day moving average of Covid Deaths      	
         
        - Percent Distribution by Population (New Cases) : Observing changes over Time      	
         
        - Percent Distribution by Population (New Deaths) : Observing changes over Time      	 
         
        - Mortaltity Rate (Case Fatality Ratio) : Observing changes over Time      	
         
        - Case Summary
	
**3) Government Policy Responce**
		
        -  Stringency Index : Analysis depicts all countries policy measures in responce to COVID - Observed over time
        
        		      This is a composite measure based on nine response indicators including school closures, workplace
			      closures, and travel bans, rescaled to a value from 0 to 100 (100 = strictest).
		                
**4) Relationship between Macro-Socioeconomics Determinants and COVID-19 Vaccine Distribution**
		
        - GDP per Capita , Human Development Index(HDI) Vs Covid 19 Vaccination Distribution       
        		     
			     Exploring the relationship between COVID-19 vaccine distribution and two macro-socioeconomics measures, 
			     including human development index and gross domestic product 
			     
        - Inference : Higher gross domestic product per capita is positively associated with higher COVID-19 vaccine distribution, and
        	      this relationship becomes more robust over time

 

