
/*********************SQL Skills Showcased***************************/
				
	--  1)Aggregate Functions
	--  2)Window Functions
	--  3)Common Table Expression
	--  4)Temporary Tables
	--  5)Views
	--  6)Stored Procedures
	--  7)Cursors
	--  8)Handling NULL Values
	--  9)FORMAT(),CAST(), ROUND()

/*-----------------------------Global Tracker------------------------------------*/

	-- 1)Total Cases,Total Deaths,Mortality Rate (Case Fatality Ratio) - Worldwide
	-- 2)Total Cases,Total Deaths,Mortality Rate (Case Fatality Ratio) - Contitnent Wide
	-- 3)7-Day moving average of covid cases - Worldwide
	-- 4)7-Day moving average of covid deaths - Worldwide
	-- 5)Cummulative Number of covid cases over Time - Worldwide
	-- 6)Cummulative Number of covid cases over Time - Worldwide

/*----------------------------Analysis By Country-----------------------------------------------*/

	-- 1)Date of First Case Reported for each country
	-- 2)Cummulative number of new Cases by day
	-- 3)Cummulative number of new Deaths by day
	-- 4)7-Day moving average of covid cases
	-- 5)7-Day moving average of covid Deaths
	-- 6)Mortality Rate by Country
	-- 7)Total Cases Vs Total Deaths (All Countries) - Observing Change With Time
	-- 8)Total Cases Vs Total Deaths (USA) - Observing Change With Time
	-- 9)Total Cases Vs Total Deaths (INDIA) - Observing Change With Time
	-- 10)Case Summary For each Country - Total Cases,Total Deaths, Percentage distribution by Population, Mortality Rate(Case Fatality Ratio)
	-- 11)Case Summary - USA
	-- 12)Case Summary - INDIA
	-- 13)Highest to Lowest Death Count
	-- 14)TOP 10 countries with most affected by COVID
	-- 15)Top 10 countries with most deaths due to COVID

/*----------------------------Global Data Distribution -----------------------------------*/

	-- 1)Percentage distribution of covid cases  Worldwide ( TotalCase by Country / Global Cases)
	-- 2)Mortlity Rate ( TotalDeath by Country / Global Deaths)


/*----------------------------Creating Temporary Table for the Session--------------------------------*/


	--1)  #GlobalTotalNewCases   

		--Create Temp Table for stroing new cases worldwide for each day

			Drop Table if exists #GlobalTotalNewCases
			create table #GlobalTotalNewCases
			(
				Date datetime,
				TotalNewCases float,
				TotalNewDeaths float
			)

		--Insert into Temporary Table

			insert into #GlobalTotalNewCases
			select date,coalesce(sum(new_Cases),0),coalesce(sum(new_deaths),0)
			from CovidDeath
			where continent is not null
			group by date
			order by date

	--2)  #VaccinationNumbers  

		DROP TABLE IF exists #VaccinationNumbers
		CREATE TABLE #VaccinationNumbers
		(
			location nvarchar(200),
			date datetime,
			PartialVaccination float,
			FullVaccination float,
			Total_vaccination float
		)

		insert into #VaccinationNumbers 
		select location,date, cast(people_vaccinated as float) - (lag(people_vaccinated,1) over (partition by location order by date) ) as 'PartialVaccinated',
			   cast(people_fully_vaccinated as float) - (lag(people_fully_vaccinated,1) over (partition by location  order by date) ) as 'FullyVaccinated',
			   total_vaccinations
		from CovidVaccine
		where continent is not null

--------------------------------------------------------------------------------------------------------------------------------------------------------------------


-- GLOBAL NUMBERS

--1)Total Cases/Deaths Worldwide and Global Mortality Rate (Death Percentage)

	select format(sum(totalnewcases),'N0') as 'Global COVID-19 Cases',format(sum(TotalNewDeaths),'N0') as 'Global COVID-19 Deaths',
	format((sum(TotalNewDeaths)/sum(totalnewcases)),'P') as 'Global Mortality Rate'
	from #GlobalTotalNewCases 

-- 2)Total Cases,Total Deaths,Mortality Rate (Case Fatality Ratio) - Contitnent Wide

	select continent as 'Continent' ,sum(new_Cases) as 'Total Covid-19 Cases',sum(new_deaths) as 'Total Covid-19 Deaths' , format(sum(new_deaths)/sum(new_Cases), 'P') as 'Mortality Rate'
	from CovidDeath
	where continent is not null
	group by continent
	order by [Total Covid-19 Cases] Desc
	

 --3)7-Day moving average of covid cases

	--Create Temp Table for stroing new cases worldwide for each day

		Drop Table if exists #GlobalTotalNewCases
		create table #GlobalTotalNewCases
		(
			Date datetime,
			TotalNewCases float,
			TotalNewDeaths float
		)

	--Insert into Temporary Table

		insert into #GlobalTotalNewCases
		select date,coalesce(sum(new_Cases),0),coalesce(sum(new_deaths),0)
		from CovidDeath
		where continent is not null
		group by date
		order by date
					   
		select format(cast(date as date),'yyyy-MM-dd') as 'Date',format(TotalNewCases, 'N0') as 'New Cases',
		format(avg(TotalNewCases)over (order by date rows between 6 preceding and current row),'N0')  as '7-day Moving Average'
		from #GlobalTotalNewCases
		order by [Date] desc

--4)7-Day moving average of covid deaths
	select format(cast(date as date),'yyyy-MM-dd') as 'Date',format(TotalNewDeaths, 'N0') as 'New Deaths',
	format(avg(TotalNewDeaths)over (order by date rows between 6 preceding and current row),'N0')  as '7-day Moving Average'
	from #GlobalTotalNewCases
	order by [Date] desc

--5)Cummulative Number Of Confirmed cases Worldwide
	select format(cast(date as date),'yyyy-MM-dd') as Date,TotalNewCases as 'Total Confirmed Cases', sum(totalnewcases)  over (order by date) as 'Cummulative Number '
	from #GlobalTotalNewCases
	order by date desc

--6)Cummulative Number Of Deaths Worldwide		
	select format(cast(date as date),'yyyy-MM-dd') as Date,TotalNewDeaths as 'Total Deaths ', sum(TotalNewDeaths)  over (order by date) as 'Cummulative Number '
	from #GlobalTotalNewCases
	order by date desc
	
/*--------------------------------Analysis By Country-----------------------------------------------*/

--1)Date of First Case Reported
	select location as 'Country', format(min(cast(date as date)), 'MMM-dd-yyyy') as 'Date First Case Reported' 
	from  CovidDeath where location NOT IN ('World', 'European Union', 'International')
	group by location
	order by location

--2)Cummulative number of  covid cases by day 

	select location as Country,format(cast(date as date),'yyyy-MM-dd') as Date,New_Cases as 'New Cases',
	sum(new_Cases) over (partition by location order by date) as 'Cummulative Cases'
	from coviddeath
	where continent is not null
	order by location,date 

--3)Cummulative number of Deaths by day

	select location as Country,format(cast(date as date),'yyyy-MM-dd') as Date,coalesce (new_Deaths,0) as 'New Deaths',
	sum(coalesce(cast(new_deaths as float),0)) over (partition by location order by date) as 'Cummulative Deaths'
	from coviddeath
	where continent is not null
	order by location,date 

--4)7-Day moving average of new covid cases

	select location as 'Country', format(cast(date as date),'yyyy-MM-dd') as 'Date',format(new_Cases, 'N0') as 'New Cases',
	avg(new_Cases)over (partition by location order by date rows between 6 preceding and current row) as '7-day Moving Average'
	from coviddeath
	where continent is not null
	order by location,date

--5)7-Day moving average of new covid Deaths

	select location as 'Country', format(cast(date as date),'yyyy-MM-dd') as 'Date',format(coalesce(cast(new_deaths as float),0), 'N0') as 'New Deaths',
	avg(coalesce(cast(new_deaths as float),0))over (partition by location order by date rows between 6 preceding and current row) as '7-day Moving Average'
	from coviddeath
	where continent is not null
	order by location,date

--6) Mortality Rate ( Total Cases Vs Total Deaths - By Country)

	select location as 'Country',population as 'Population',max(total_cases) as 'Confirmed Cases' , MAX(cast(total_deaths as float)) as 'Confirmed Deaths',
	(MAX(cast(total_deaths as float))/max(total_cases))*100 as 'Mortality Rate' 
	from coviddeath
	where continent is not null
	group by location,population
	order by 'Mortality Rate' desc

  --Creating VIEW for Visualization

    CREATE VIEW MortalityRate AS

	select location as 'Country',population as 'Population',max(total_cases) as 'Confirmed Cases' , MAX(cast(total_deaths as float)) as 'Confirmed Deaths',
	(MAX(cast(total_deaths as float))/max(total_cases))*100 as 'Mortality Rate' 
	from coviddeath
	where continent is not null
	group by location,population

		
--7) Mortality Rate ( Total Cases Vs Total Deaths - All Countries - Observing Change With Time)
    CREATE VIEW MortalityRate AS
	select location as 'Country',cast(date as date) as 'Date',population as 'Population',total_cases as 'Confirmed Cases' , coalesce(total_deaths,0)  as 'Confirmed Deaths'
 	,(cast(total_cases as float)/(population))*100 as 'Percent Population Infected',
	 (cast(total_deaths as float)/(population))*100 as 'Percent Population Dead',
	coalesce((cast(total_deaths as float)/(total_cases)),0)*100 as 'Mortality Rate'
	from coviddeath
	where continent is not null
	--order by location,date desc 
	
	select Country,Date,Population,[Confirmed cases],[Confirmed Deaths], round([Percent Population Infected],3) as 'Percent Population Infected',
	coalesce(round([Percent Population Dead],3),0) as 'Percent Population Dead',round([mortality Rate],3) as 'Mortality Rate'
	from MortalityRate
	order by Country,Date desc

--8)Mortality Rate ( Total Cases Vs Total Deaths - USA - Observing Change With Time)
	select * 
	from MortalityRate
	where Country like '%united states%'
	order by Country,Date desc

--9)Mortality Rate ( Total Cases Vs Total Deaths - India - Observing Change With Time)
	select * 
	from MortalityRate
	where Country like '%india%'
	order by Country,Date desc

--10)Case Summary For each Country - Total Cases,Total Deaths, Percentage distribution by Population, Mortality Rate(Case Fatality Ratio)
	
	CREATE VIEW PercentCalculation AS
	select location as 'Country',population as 'Population',max(total_cases) as 'Total Cases' , MAX(cast(total_deaths as float)) as 'Total Deaths',
	(MAX(cast(total_cases as float))/population)*100 as 'Percent Population Infected' ,
	(MAX(cast(total_deaths as float))/population)*100 as 'Percent Population Dead' ,
	(MAX(cast(total_deaths as float))/(MAX(cast(total_cases as float))))*100 as 'Mortality Rate'
	from coviddeath
	where continent is not null
	group by location,population
	--order by location
	
   --Case Summary - All Countires
	Select * 
	from PercentCalculation
	order by country,Population

--11)Case Summary (USA)
	select *
	from PercentCalculation
	where Country like '%united states%'
	order by Country

--12)Case Summary (India)
	select *
	from PercentCalculation
	where Country like '%india%'
	order by Country

--13)Countries sorted with highest to Lowest Death 
	select  *
	from PercentCalculation
	order by 'Total Deaths' desc

--14)Top 10 contry with most infections
	select top 10 Country, [Total Cases]
	from PercentCalculation
	order by 'Total Cases' Desc 

--15)Top 10 contry with most Deaths
	select top 10 Country, [Total Deaths]
	from PercentCalculation
	order by 'Total Deaths' Desc 

	
/*--------------------------------Global Data Comparison -----------------------------------*/

--1)Mortlity Rate 

	---- Using CTE

	DECLARE @totalDeaths float
	set @totalDeaths = 0
	exec WorldCovidDeaths  @totalDeaths output;
	with cte as
	(
		select location, max(coalesce(total_deaths,0))  as totdeath
		from coviddeath
		where continent is not null
		group by location
	)
	select location as 'Country',totdeath as 'Total Deaths',(cast(totdeath as float)/@totalDeaths)*100 as 'Mortality Distribution'
	from cte
	order by 'Mortality Distribution' desc


	---- Using STORED PROCEDURE and TEMP TABLES

	--Procedure to get total covid death worldwide


	create procedure WorldCovidDeaths(@totalDeath float OUT)
		as
			select @totalDeath = (select max(coalesce(total_deaths,0)) as GlobalDeaths from coviddeath )


	--Create Temporary Table and insert the total deaths country wise
	Drop Table if exists #GlobalDeaths
		create table #GlobalDeaths
		(
			location nvarchar(200),
			TotalDeath float,
		)

		insert into #GlobalDeaths  select location, max(coalesce(total_deaths,0))  as 'Total Deaths'
								   from coviddeath
								   where continent is not null
								   group by location
								   order by location

	--Calculate and Display Global Mortality Distribution (wrt Global Numbers)
	DECLARE @totalDeaths float
	set @totalDeaths = 0
	exec WorldCovidDeaths  @totalDeaths output
	print @totalDeaths
	select location as 'Country',totaldeath as 'Total Deaths' , (cast(totaldeath as float)/@totalDeaths)*100 as 'Mortality Distribution'
	from #GlobalDeaths
	order by 'Mortality Distribution' desc



--2)Percentage distribution of covid cases

	----Using STORED PROCEDURE and CURSOR----------------

	--Procedure to get total covid cases worldwide
	create procedure WorldCovidCases(@totalinf float OUT)
		as
			select @totalinf = (select max(coalesce(total_cases,0)) as worldinfpopulation from coviddeath )

	--Procedure for Distribution Caluculation
	create procedure distribute
		 as
			DECLARE @Location nvarchar(200)
			DECLARE @Total_cases float

			--Call Procedure WorldCovidCases() and get #TotalWorldwideInfections

			DECLARE @totalWrldinf	 float
			set @totalWrldinf = 0
			exec WorldCovidCases @totalWrldinf output

			--CURSOR to Store and Calculate Global Distribution Contrywise
			DECLARE cursor_rows CURSOR FOR select location, max(coalesce(total_cases,0))  as 'Total Confirmed Cases'
										   from coviddeath
										   where continent is not null
										   group by location
										   order by location;
			OPEN cursor_rows
			FETCH NEXT FROM cursor_rows INTO   @Location,  @Total_cases
			WHILE @@FETCH_STATUS = 0  
				 BEGIN
					insert into #GlobalDistribution 
								select distinct location,(@Total_cases/@totalWrldinf )*100 
								from 
								CovidDeath
								where location=@Location and total_cases=@Total_cases and continent is not null
					FETCH NEXT FROM cursor_rows INTO   @Location,  @Total_cases;
				 END 
			CLOSE cursor_rows
			DEALLOCATE cursor_rows

	--Create Temporaray Table to store Global Distribution 
	Drop Table if exists #GlobalDistribution
		create table #GlobalDistribution
		(
			location nvarchar(200),
			PercentDistribution float,
		)
 
	--Call Distribute() procedure
	EXEC distribute
	select location as Country , PercentDistribution as 'Distribution Of COVID Cases Worldwide' from #GlobalDistribution order by 2 desc


