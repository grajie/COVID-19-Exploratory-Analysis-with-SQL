# Data Analysis on COVID 19 Data Set

Thank you for visiting the repository of Data Analysis and Visualization of COVID-19 Dataset.

This data exploration project is Descriptive Analysis and Visualization of COVID-19 dataset containing data about COVID-19 cases, deaths, vaccinations, socio economic factors from Jan 1,2020 to Feb 5,2022.

I have built global profile along with induvidual country profiles which will allow you to explore the statistic on the Coronavirus pandemic for each country.

This project is purely based on SQL Server, employing its innate capabilities:
- User-defined Procedures
- Temp Tables
- CTE
- Views 

## Table of Contents
- [Dataset Overview](#dataset-overview "Dataset Overview")
- [Data Preparation](#data-preparation "Data Preparation")
- [Tools Used](#tools-used "Tools Used")
- [Exploratory Analysis](#exploratory-analysis "Exploratory Analysis")
    1) Global COVID Explorer 
    2) Country COVID Profiles
    3) Government Policy Responces
    4) Relationship between Macro-Socioeconomics Determinants and COVID-19 Vaccine Distribution
    5) Inference
- [Tableau Vizualizations](https://public.tableau.com/app/profile/rajalakshmi.gnanasekaran#!/?newProfile=&activeTab=0)
    

## Dataset Overview
- Data Source: ourworldindata.org Links: https://covid.ourworldindata.org/data/owid-covid-data.xlsx

## Data Preparation
- Handling of NULL Values
- Datatype for columns containing numerical data was converted to Float as they were imported as nvarchar

## Tools Used
- RDBMS: Microsoft SQL Server Management Studio
- Tableau Public

## Exploratory Analysis
**1-Global COVID Tracker**

[- Total Cases/ Total Deaths / Mortality Rate (Case Fatality Ratio) : Global](https://github.com/grajie/COVID-19-Exploratory-Analysis-with-SQL/blob/main/COVID19-Exploratory%20Analysis.sql#L95-L99)

[- Total Cases / Total Deaths / Mortality Rate  (Case Fatality Ratio) : For each Continent](https://github.com/grajie/COVID-19-Exploratory-Analysis-with-SQL/blob/main/COVID19-Exploratory%20Analysis.sql#L101-L107)     
   
[- Total Cases / Total Deaths / Mortality Rate  (Case Fatality Ratio) : For each Country](https://github.com/grajie/COVID-19-Exploratory-Analysis-with-SQL/blob/main/COVID19-Exploratory%20Analysis.sql#L239-L254)
 
[- Distribution of Covid Cases worldwide](https://github.com/grajie/COVID-19-Exploratory-Analysis-with-SQL/blob/main/COVID19-Exploratory%20Analysis.sql#L344-L395)
 
[- Global Mortality Distribution](https://github.com/grajie/COVID-19-Exploratory-Analysis-with-SQL/blob/main/COVID19-Exploratory%20Analysis.sql#L290-L340)   
       
[- Cummulative number of new cases and new deaths over time](https://github.com/grajie/COVID-19-Exploratory-Analysis-with-SQL/blob/main/COVID19-Exploratory%20Analysis.sql#L142-L150)
 
[- 7 Day Moving Average of daily new cases and new deaths](https://github.com/grajie/COVID-19-Exploratory-Analysis-with-SQL/blob/main/COVID19-Exploratory%20Analysis.sql#L110-L140)      
   
[- Date Of First Case Reported For Each Country](https://github.com/grajie/COVID-19-Exploratory-Analysis-with-SQL/blob/main/COVID19-Exploratory%20Analysis.sql#L154-L158)
     
[- Case Summary of Each Country : Total Cases, Total Deaths, Percent Population Infected, Percent Population Dead, Mortality Rate](https://github.com/grajie/COVID-19-Exploratory-Analysis-with-SQL/blob/main/COVID19-Exploratory%20Analysis.sql#L239-L266)	
 
[- TOP 10 countries most affected by COVID](https://github.com/grajie/COVID-19-Exploratory-Analysis-with-SQL/blob/main/COVID19-Exploratory%20Analysis.sql#L277-L280)	
 
[- Top 10 countries with most deaths due to COVID](https://github.com/grajie/COVID-19-Exploratory-Analysis-with-SQL/blob/main/COVID19-Exploratory%20Analysis.sql#L282-L285) 
 
[- Countries Sorted as Highest to Loweset Case Count](https://github.com/grajie/COVID-19-Exploratory-Analysis-with-SQL/blob/main/COVID19-Exploratory%20Analysis.sql#L268-L275)	

[- Countries Sorted as Highest to Loweset Death Count](https://github.com/grajie/COVID-19-Exploratory-Analysis-with-SQL/blob/main/COVID19-Exploratory%20Analysis.sql#L273-L275)

[- Global Vaccination Report : Cummulative Distribution Relative to Population](https://github.com/grajie/COVID-19-Exploratory-Analysis-with-SQL/blob/main/COVID19-Vaccination_Exploratory%20Analysis.sql#L20-L35)
 
[- Top 10 Country with most citizens partially Vaccinated](https://github.com/grajie/COVID-19-Exploratory-Analysis-with-SQL/blob/main/COVID19-Vaccination_Exploratory%20Analysis.sql#L37-L40)

[- Top 10 Country with most citizens Fully Vaccinated](https://github.com/grajie/COVID-19-Exploratory-Analysis-with-SQL/blob/main/COVID19-Vaccination_Exploratory%20Analysis.sql#L42-L49)

[- Top 10 Countries with most Doses Administered](https://github.com/grajie/COVID-19-Exploratory-Analysis-with-SQL/blob/main/COVID19-Vaccination_Exploratory%20Analysis.sql#L54-L61)

[- Daily Share of Vaccinations: 7 Day Moving Average per country](https://github.com/grajie/COVID-19-Exploratory-Analysis-with-SQL/blob/main/COVID19-Vaccination_Exploratory%20Analysis.sql#L63-L108)

      
**2-Country COVID Profiles**

[- Cummulative number of New Cases by day](https://github.com/grajie/COVID-19-Exploratory-Analysis-with-SQL/blob/main/COVID19-Exploratory%20Analysis.sql#L160-L166)     
         
[- Cummulative number of New Deaths by day](https://github.com/grajie/COVID-19-Exploratory-Analysis-with-SQL/blob/main/COVID19-Exploratory%20Analysis.sql#L168-L174)
      
[- 7-Day moving average of Covid Cases](https://github.com/grajie/COVID-19-Exploratory-Analysis-with-SQL/blob/main/COVID19-Exploratory%20Analysis.sql#L176-L182)
         
[- 7-Day moving average of Covid Deaths](https://github.com/grajie/COVID-19-Exploratory-Analysis-with-SQL/blob/main/COVID19-Exploratory%20Analysis.sql#L184-L190)
         
[- Percent Distribution by Population (New Cases) : Observing changes over Time](https://github.com/grajie/COVID-19-Exploratory-Analysis-with-SQL/blob/main/COVID19-Exploratory%20Analysis.sql#L212-L225)
         
[- Percent Distribution by Population (New Deaths) : Observing changes over Time](https://github.com/grajie/COVID-19-Exploratory-Analysis-with-SQL/blob/main/COVID19-Exploratory%20Analysis.sql#L212-L225)
         
[- Mortaltity Rate (Case Fatality Ratio) : Observing changes over Time ](https://github.com/grajie/COVID-19-Exploratory-Analysis-with-SQL/blob/main/COVID19-Exploratory%20Analysis.sql#L227-L237)
         
[- Case Summary](https://github.com/grajie/COVID-19-Exploratory-Analysis-with-SQL/blob/main/COVID19-Exploratory%20Analysis.sql#L239-L266)
	
**3-Government Policy Responce**

[-  Stringency Index :](https://github.com/grajie/COVID-19-Exploratory-Analysis-with-SQL/blob/main/COVID19-Vaccination_Exploratory%20Analysis.sql#L137-L52) Analysis depicts all countries policy measures in responce to COVID - Observed over time
		      This is a composite measure based on nine response indicators including school closures, workplace
		      closures, and travel bans, rescaled to a value from 0 to 100 (100 = strictest).
		                
**4-Relationship between Macro-Socioeconomics Determinants and COVID-19 Vaccine Distribution**

[- GDP per Capita , Human Development Index(HDI) Vs Covid 19 Vaccination Distribution](https://github.com/grajie/COVID-19-Exploratory-Analysis-with-SQL/blob/main/COVID19-Vaccination_Exploratory%20Analysis.sql#L111-L133)       
		     Exploring the relationship between COVID-19 vaccine distribution and two macro-socioeconomics measures, 
		     including human development index and gross domestic product 
		     
- Inference : Higher gross domestic product per capita is positively associated with higher COVID-19 vaccine distribution, and
        	      this relationship becomes more robust over time
		      
## Tableau Visualization
- Used Tableau Desktop Server to connect to my local MS SQL Database Server and imported the SQL Views and Tables.
- Created Visual explanatory Dashboard and Story for the analysis and published in Tableau Public.
- Tableau Public : [Click Here](https://public.tableau.com/app/profile/rajalakshmi.gnanasekaran#!/?newProfile=&activeTab=0)
 

