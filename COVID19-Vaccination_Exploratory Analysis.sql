
/*--------------------------------Covid 19 Vaccination Descriptive Analysis-------------------------------------------*/
	-- 1)Vaccination StartDate of each Country
	-- 2)Global Vaccination Report - Cummulative Distribution Relative to Population
	-- 3)Top 10 Country with most citizens partially Vaccinated
	-- 4)Top 10 Country with most citizens Fully Vaccinated
	-- 5)Top 10 Countries with most Doses Administered
	-- 6)Daily Share of Vaccinations: 7 Day Moving Average per country
	-- 7)Relationship between Socioeconomics ( GDP per Capita ,Human Developement Index) and Covid 19 Vaccine distribtuion
	-- 8) Government Policy Responce - Stringency Index

--1)Vaccination StartDate of each Country

select location as 'Country' , min(cast(date as date)) as 'Vaccination Start date'
from CovidVaccine where location is not null and location NOT IN ('World', 'European Union', 'International') and total_vaccinations is not null 
and cast(total_vaccinations as float) > 0
group by location
order by location

--2)Global Vaccination Report - Cummulative Distribution Relative to Population

CREATE VIEW GlobalVaccinationReport as
	select vac.location as 'Country',dea.population as 'Population',max(vac.people_vaccinated) as 'Partially Vaccinated',max(vac.people_fully_vaccinated) as 'Fully Vaccinated',
	max(vac.total_vaccinations) as 'Total Vaccine Administered',
	round((max(vac.people_vaccinated )/dea.population)*100,2)  as 'Share of People Partially Vaccinated',
	round((max(vac.people_fully_vaccinated)/dea.population)*100,2) as 'Share of People Fully Vaccinated'
	from CovidVaccine vac 
	join CovidDeath dea
	on vac.location = dea.location
	where vac.continent is not null  and total_vaccinations >0
	group by vac.location,dea.population

  select * 
  from GlobalVaccinationReport 
  order by [Share of People Fully Vaccinated] Desc

--3)Top 10 Country with most citizens partially Vaccinated
select top 10 Country
from GlobalVaccinationReport
order by [Share of People Partially Vaccinated] desc

--4)Top 10 Country with most citizens Fully Vaccinated
select top 10 Country,*
from GlobalVaccinationReport
order by [Share of People Fully Vaccinated] desc

select top 10 Country,[Population],[Fully Vaccinated],[Share of People Fully Vaccinated]
from GlobalVaccinationReport 
order by [Share of People Fully Vaccinated] desc

--5)Top 10 Countries with most Doses Administered


select  Country,[Population],[Fully Vaccinated],[Share of People Fully Vaccinated]
from GlobalVaccinationReport
where Country in (										-- Sub-Query
					select top 10 country
					from GlobalVaccinationReport
					order by  [Total Vaccine Administered] desc
				)
order by [Total Vaccine Administered] desc

--6)Daily Share of Vaccinations: 7 Day Moving Average per country

	--Method 1 : Using Temp Table 

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

	select * from #VaccinationNumbers where location in ('India','United States','China','Brazil')
	order by location,date desc

	select location as 'Country',date as 'Date',
		  ROUND( AVG(PartialVaccination) over (partition by location order by date rows between 6 preceding and current row),2) as '7 Day Rolling Average of Partial Vaccination ',
		  ROUND( AVG(FullVaccination) over (partition by location order by date rows between 6 preceding and current row),2) as '7 Day Rolling Average of Full Vaccination '
	from #VaccinationNumbers
	where location in ('India','United States','China','Brazil')
	order by location,date desc

	--Method 2 : Using View

	CREATE VIEW MovingAverageVaccinations AS
		select location,date, cast(people_vaccinated as float) - (lag(people_vaccinated,1) over (partition by location order by date) ) as 'PartialVaccinated',
			   cast(people_fully_vaccinated as float) - (lag(people_fully_vaccinated,1) over (partition by location  order by date) ) as 'FullyVaccinated',
			   total_vaccinations
		from CovidVaccine
		where continent is not null

select location as 'Country',date as 'Date',
		  ROUND( AVG(PartialVaccinated) over (partition by location order by date rows between 6 preceding and current row),2) as '7 Day Rolling Average of Partial Vaccination ',
		  ROUND( AVG(FullyVaccinated) over (partition by location order by date rows between 6 preceding and current row),2) as '7 Day Rolling Average of Full Vaccination '
	from MovingAverageVaccinations
	where location in ('India','United States','China','Brazil')
	order by location,date desc


--7)Relationaship between Socioeconomics ( GDP per Capita ,Human Developement Index) and Covid 19 Vaccine distribtuion

	CREATE VIEW GDPFebrary AS
		select location,gdp_per_capita as 'GDP per Capita', human_development_index as 'Human Developement Index (HDI)' , people_vaccinated_per_hundred as 'People Vaccinated per Hundred - Febrary 2021'
		from CovidVaccine
		where location in ('Austria', 'Austria','Belgium','Bulgaria','Canada','Chile','Czechia','Denmark','Estonia','France','Germany','Indonesia','Israel','Italy','Latvia','Lithuania','Malta','Mexico',
		'Norway','Poland','Romania','Slovenia','Switzerland','United Kingdom','United States')
		and CAST(date as date)='2021-02-01'
		--order by location

	CREATE VIEW GDPAugust AS
		select location,gdp_per_capita as 'GDP per Capita', human_development_index as 'Human Developement Index (HDI)' , people_vaccinated_per_hundred as 'People Vaccinated per Hundred - August 2021'
		from CovidVaccine
		where location in ('Austria', 'Austria','Belgium','Bulgaria','Canada','Chile','Czechia','Denmark','Estonia','France','Germany','Indonesia','Israel','Italy','Latvia','Lithuania','Malta','Mexico',
		'Norway','Poland','Romania','Slovenia','Switzerland','United Kingdom','United States')
		and CAST(date as date)='2021-08-01'
		--order by location

select Feb.location as 'Country',Feb.[GDP per Capita],Feb.[Human Developement Index (HDI)],Feb.[People Vaccinated per Hundred - Febrary 2021],Aug.[People Vaccinated per Hundred - August 2021]
from GDPFebrary Feb
join GDPAugust Aug
on Feb.location=Aug.Location
Order by Feb.location


/*
--8) Stringency Index  :  Analysis depicts all countries policy measures in responce to COVID - Observed over time

Stringency Index:	A composite measure based on nine response indicators including school closures, workplace closures, and travel bans, rescaled to a 
					value from 0 to 100 (100 = strictest). 
					The nine metrics used to calculate the Stringency Index are: school closures; workplace closures; 
					cancellation of public events; restrictions on public gatherings; closures of public transport; 
					stay-at-home requirements; public information campaigns; restrictions on internal movements; 
					and international travel controls.*/

select  cases.location,cases.date,vac.stringency_index,cases.new_cases_per_million
from CovidDeath cases
join CovidVaccine vac
on cases.location=vac.location
and cases.date=vac.date
where cases.location  in ('India')
order by date,location
