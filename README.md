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
    1) Global COVID Explorer 
    2) Country COVID Profiles
    3) Government Policy Responces
    4) Relationship between Macro-Socioeconomics Determinants and COVID-19 Vaccine Distribution
    5) Inference
    

## Dataset Overview
- Data Source: ourworldindata.org Links: https://covid.ourworldindata.org/data/owid-covid-data.xlsx https://github.com/owid/covid-19-data/tree/master/public/data
- Rows: 160000 Columns: 59

## Data Preparation
- Handling of NULL Values
- Datatype for columns containing numerical data was converted to Float as they were imported as nvarchar

## ToolsUsed
- RDBMS: Microsoft SQL Server Management Studio
- Tableau Public

## Exploratory Analysis
**1) Global COVID Tracker**

        - Total Cases / Total Deaths / Mortality Rate (Case Fatality Ratio) : Global        
         
        - Total Cases / Total Deaths / Mortality Rate  (Case Fatality Ratio) : For each Continent      
           
        - Total Cases / Total Deaths / Mortality Rate  (Case Fatality Ratio) : For each Country
         
        - Distribution of Covid Cases worldwide 	
         
        - Global Mortality Distribution   
                       
        - Cummulative number of new cases and new deaths over time        
         
        - 7 Day Moving Average of daily new cases and new deaths      
           
        - Date Of First Case Reported For Each Country
         
        - Date First Death was reported in each country     
            
        - Case Summary of Each Country : Total Cases, Total Deaths, Percent Population Infected, Percent Population Dead, Mortality Rate	
         
        - TOP 10 countries most affected by COVID	
         
        - Top 10 countries with most deaths due to COVID 
         
        - Countries Sorted as Highest to Loweset Case Count	
        
        - Countries Sorted as Highest to Loweset Death Count
        
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
			     
        **Inference** : Higher gross domestic product per capita is positively associated with higher COVID-19 vaccine distribution, and
        	      this relationship becomes more robust over time

 

