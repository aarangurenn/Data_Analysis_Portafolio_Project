
-- use name_of-data_set;

desc Covid_vaccinations;
desc Covid_death;


select*
from Covid_vaccinations
order by 3,4;

select*
from Covid_death
order by 3,4;

select 
	location,
    total_cases,
    new_cases,
    total_deaths,
    population
from Covid_death
order by 1,2
;

-- total cases vs total deaths

select 
	location,
    max(total_cases) as total_cases,
	max(total_deaths) as total_deaths
    
from Covid_death
group by location
order by 1,2
;

-- likelihood of dying in your country

select 
	location,
    date,
    total_cases,
    total_deaths,
	concat(round((total_deaths/total_cases)*100,2),' %') Deth_Porcentage
from Covid_death
where location = 'mexico'
order by 1,2
;

-- looking total cases vs population 

select 
	location,
    date,
    total_cases,
    population,
    concat(round((total_cases/population)*100,2),' %') Case_Porcentage
from Covid_death
where location = 'Mexico'
order by 1,2;


-- looking at countries with highest infection rates compare to poulation 

select 
	location,
    population,
    max(total_cases)as highest_infection_count,
	concat(round(max((total_cases/population))*100,2), ' %') Case_Porcentage
from Covid_death
group by location, population
order by Case_Porcentage desc
;

-- showing the highest counties death cout per population 

select 
	location,
    max(total_deaths) total_death_count
from Covid_death
where continent <> ''
group by location, population
order by total_death_count desc
;
 

-- by continent 

select 
	location,
    max(total_deaths) total_death_count_by_continent
from Covid_death
where continent = ''
group by location
order by total_death_count_by_continent desc
;

select 
	continent,
    max(total_deaths) total_death_count_by_continent
from Coviddeaths
where continent <> ''
group by continent
order by total_death_count_by_continent desc
;


-- global numbers

with t1 as (select 
	location,
    max(total_deaths) total_death_count
from Covid_death
where continent <> ''
group by location, population
order by total_death_count desc)
select 
	sum(total_death_count) as Total_world_deaths
from t1
;
 
select 
	sum(new_cases) as total_cases, 
	sum(new_deaths) as total_deaths, 
    (sum(new_deaths)/sum(new_cases)) * 100 as death_percentage
from Covid_death
where continent <> ''
order by 1,2;

-- looking at total vaccination vs population

select*
from Covid_death cd
join Covid_vaccinations cv on cd.location = cv.location
and cd.date = cv.date
order by 3,4;


with t1 as (select 
cv.continent,
cv.location,
cv.date,
cd.population as population,
cv.new_vaccinations as  new_vaccination,
sum(cv.new_vaccinations) over (partition by cv.location order by cd.location, cd.date) as sum_vaccination
from Covid_vaccinations cv
join Covid_death cd on cd.location = cv.location
and cd.date = cv.date
where cv.continent <> ''
order by 2,3)

select
	t1.continent,
    t1.location,
    t1.date,
    t1.population,
    t1.new_vaccination,
    t1.sum_vaccination,
    (t1.sum_vaccination/ t1.population)*100 as percentage
from t1
;

-- create view 

create or replace view test as (select 
cv.continent,
cv.location,
cv.date,
cd.population as population,
cv.new_vaccinations as  new_vaccination,
sum(cv.new_vaccinations) over (partition by cv.location order by cd.location, cd.date) as sum_vaccination
from Covidvaccinations cv
join Coviddeaths cd on cd.location = cv.location
and cd.date = cv.date
where cv.continent <> ''
order by 2,3);

-- teporary table

create temporary table test as (select 
cv.continent,
cv.location,
cv.date,
cd.population as population,
cv.new_vaccinations as  new_vaccination,
sum(cv.new_vaccinations) over (partition by cv.location order by cd.location, cd.date) as sum_vaccination
from Covidvaccinations cv
join Coviddeaths cd on cd.location = cv.location
and cd.date = cv.date
where cv.continent <> ''
order by 2,3);

select *
from test;

