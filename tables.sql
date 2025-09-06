create database covid_deaths_vaccination;

DROP table IF EXISTS covid_death;

create table covid_death (
iso_code varchar(255),
continent varchar(255),
location varchar(255),
date date,
total_cases bigint,
new_cases bigint,
new_cases_smoothed dec(10,3),
total_deaths bigint,
new_deaths bigint,
new_deaths_smoothed dec(10,3),
total_cases_per_million dec(10,3),
new_cases_per_million dec(10,3),
new_cases_smoothed_per_million dec(10,3),
total_deaths_per_million dec(10,3),
new_deaths_per_million dec(10,3),
new_deaths_smoothed_per_million dec(10,3),
reproduction_rate dec(10,3),
icu_patients int,
icu_patients_per_million dec(10,3), 
hosp_patients int,
hosp_patients_per_million dec(10,3),
weekly_icu_admissions dec(10,3), 
weekly_icu_admissions_per_million dec(10,3),
weekly_hosp_admissions dec(10,3),
weekly_hosp_admissions_per_million dec(10,3),
new_tests bigint,
total_tests bigint,
total_tests_per_thousand dec(10,3),
new_tests_per_thousand dec(10,3),
new_tests_smoothed dec(10,3),
new_tests_smoothed_per_thousand dec(10,3),
positive_rate dec(10,3),
tests_per_case dec(10,3), 
tests_units varchar(255),
total_vaccinations bigint,
people_vaccinated bigint, 
people_fully_vaccinated bigint,
new_vaccinations bigint,
new_vaccinations_smoothed bigint,
total_vaccinations_per_hundred dec(10,3), 
people_vaccinated_per_hundred dec(10,3), 
people_fully_vaccinated_per_hundred dec(10,3),
new_vaccinations_smoothed_per_million int,
stringency_index dec(10,3),
population bigint,
population_density dec(10,3),
median_age dec(10,3),
aged_65_older dec(10,3),
aged_70_older dec(10,3),
gdp_per_capita dec(12,3), 
extreme_poverty dec(10,3),
cardiovasc_death_rate dec(10,3),
diabetes_prevalence	dec(10,3),
female_smokers dec(10,3),
male_smokers dec(10,3),	
handwashing_facilities dec(10,3),	
hospital_beds_per_thousand dec(10,3),	
life_expectancy dec(10,3),	
human_development_index dec(10,3)
);

DROP table IF EXISTS covid_vaccinations;

create table covid_vaccinations (
iso_code varchar(255),	
continent varchar(255),	
location varchar(255),	
date date,	
new_tests bigint,	
total_tests bigint,	
total_tests_per_thousand dec(10,3),	
new_tests_per_thousand dec(10,3),	
new_tests_smoothed dec(10,3),	
new_tests_smoothed_per_thousand dec(10,3),	
positive_rate dec(10,3),	
tests_per_case dec(10,3),	
tests_units varchar(255),	
total_vaccinations bigint,	
people_vaccinated bigint,	
people_fully_vaccinated bigint,	
new_vaccinations bigint,	
new_vaccinations_smoothed bigint,	
total_vaccinations_per_hundred dec(10,3),	
people_vaccinated_per_hundred dec(10,3),	
people_fully_vaccinated_per_hundred dec(10,3),	
new_vaccinations_smoothed_per_million bigint,	
stringency_index dec(10,3),	
population_density dec(10,3),	
median_age dec(10,3),	
aged_65_older dec(10,3),	
aged_70_older dec(10,3),	
gdp_per_capita dec(10,3),	
extreme_poverty dec(10,3),	
cardiovasc_death_rate dec(10,3),	
diabetes_prevalence dec(10,3),	
female_smokers dec(10,3),	
male_smokers dec(10,3),	
handwashing_facilities dec(10,3),	
hospital_beds_per_thousand dec(10,3),	
life_expectancy	dec(10,3),
human_development_index dec(10,3)
);

-- from windows open CMD
-- mysql --local-infile -u root -p
-- pasword: ******

-- USE "data base name";

-- LOAD DATA LOCAL INFILE 'C:\\**\\**\\CovidDeaths2.csv'
-- INTO TABLE Covid_Death
-- FIELDS TERMINATED BY ','
-- LINES TERMINATED BY '\n';

-- LOAD DATA LOCAL INFILE 'C:\\**\\**\\\\Covidvaccinations2.csv'
-- INTO TABLE Covid_vaccinations
-- FIELDS TERMINATED BY ','
-- LINES TERMINATED BY '\n';

