-- CREATE SCHEMA/DATABASE
CREATE SCHEMA `covid_practice` ;

-- use
use covid_practice;

-- CREATE first TABLE covid_death (THIS ONE DOESN'T WORKSSSS!!!)
CREATE TABLE `covid_practice`.`covid_death` (
`iso_code` VARCHAR(45) NULL,
 `continent` VARCHAR(45) NULL,
 `location` VARCHAR(45) NULL, 
 `date` VARCHAR(45) NULL, 
 `total_cases` INT NULL, 
 `new_cases` INT NULL, 
 `new_cases_smoothed` VARCHAR(45) NULL, 
 `total_deaths` INT NULL, 
 `new_deaths` INT NULL, 
 `new_deaths_smoothed` VARCHAR(45) NULL, 
 `population` INT NULL, 
 `total_cases_per_million` VARCHAR(45) NULL, 
 `new_cases_per_million` VARCHAR(45) NULL, 
 `new_cases_smoothed_per_million` VARCHAR(45) NULL, 
 `total_deaths_per_million` VARCHAR(45) NULL, 
 `new_deaths_per_million` VARCHAR(45) NULL, 
 `new_deaths_smoothed_per_million` VARCHAR(45) NULL, 
 `reproduction_rate` VARCHAR(45) NULL, 
 `icu_patients` INT NULL, 
 `icu_patients_per_million` VARCHAR(45) NULL, 
 `hosp_patients` INT NULL,
 `hosp_patients_per_million` VARCHAR(45) NULL, 
 `weekly_icu_admissions` INT NULL, 
 `weekly_icu_admissions_per_million` VARCHAR(45) NULL, 
 `weekly_hosp_admissions` INT NULL, 
 `weekly_hosp_admissions_per_million` VARCHAR(45) NULL
)


-- THIS ONE WORKS!!!!! (made from create table feature)
CREATE TABLE `covid_practice`.`covid_death` (
  `iso_code` VARCHAR(25) NULL,
  `continent` VARCHAR(45) NULL,
  `location` VARCHAR(45) NULL,
  `date` VARCHAR(45) NULL,
  `total_cases` INT NULL,
  `new_cases` INT NULL,
  `new_cases_smoothed` VARCHAR(45) NULL,
  `total_deaths` INT NULL,
  `new_deaths` INT NULL,
  `new_deaths_smoothed` VARCHAR(45) NULL,
  `population` INT NULL,
  `total_cases_per_million` VARCHAR(45) NULL,
  `new_cases_per_million` VARCHAR(45) NULL,
  `new_cases_smoothed_per_million` VARCHAR(45) NULL,
  `total_deaths_per_million` VARCHAR(45) NULL,
  `new_deaths_per_million` VARCHAR(45) NULL,
  `new_deaths_smoothed_per_million` VARCHAR(45) NULL,
  `reproduction_rate` VARCHAR(45) NULL,
  `icu_patients` INT NULL,
  `icu_patients_per_million` VARCHAR(45) NULL,
  `hosp_patients` INT NULL,
  `hosp_patients_per_million` VARCHAR(45) NULL,
  `weekly_icu_admissions` VARCHAR(45) NULL,
  `weekly_icu_admissions_per_million` VARCHAR(45) NULL,
  `weekly_hosp_admissions` INT NULL,
  `weekly_hosp_admissions_per_million` VARCHAR(45) NULL);


-- INSERT first TABLE covid_death
load data local infile '/Users/kharisrahmanto/Downloads/CovidDeath.csv' 
into table covid_death
fields terminated by ','
lines terminated by '\n'
ignore 1 lines
(iso_code, continent, 
 location, date, 
 total_cases, new_cases, 
 new_cases_smoothed, total_deaths,
 new_deaths, new_deaths_smoothed, 
 population, total_cases_per_million, 
 new_cases_per_million, new_cases_smoothed_per_million, 
 total_deaths_per_million, new_deaths_per_million, 
 new_deaths_smoothed_per_million, reproduction_rate, 
 icu_patients, icu_patients_per_million, hosp_patients, 
 hosp_patients_per_million, weekly_icu_admissions, 
 weekly_icu_admissions_per_million, weekly_hosp_admissions, 
 weekly_hosp_admissions_per_million);

-- add new column for correct date type
alter table covid_death
add date_true date
after date;

-- fill in true date type column
update covid_death
set date_true = concat(substring_index(date,  '/', -1), '-', substring_index(date,  '/', 1),'-', substring_index(substring_index(date,  '/', 2),'/',-1));

-- delete old date column (which isn't in correct type)
alter table covid_death
drop column date; 

 select * from covid_death
  order by location, date_true;
 
-- create second table covid_vaccinations
CREATE TABLE `covid_practice`.`covid_vaccinations` (
  `iso_code` INT NULL,
  `continent` VARCHAR(45) NULL,
  `location` VARCHAR(45) NULL,
  `date` VARCHAR(45) NULL,
  `total_tests` INT NULL,
  `total_tests_per_thousand` VARCHAR(45) NULL,
  `new_tests_per_thousand` VARCHAR(45) NULL,
  `new_tests_smoothed` VARCHAR(45) NULL,
  `new_tests_smoothed_per_thousand` VARCHAR(45) NULL,
  `positive_rate` VARCHAR(25) NULL,
  `tests_per_case` INT NULL,
  `tests_units` VARCHAR(45) NULL,
  `total_vaccinations` INT NULL,
  `people_vaccinated` INT NULL,
  `people_fully_vaccinated` INT NULL,
  `new_vaccinations` INT NULL,
  `new_vaccinations_smoothed` VARCHAR(45) NULL,
  `total_vaccinations_per_hundred` VARCHAR(45) NULL,
  `people_vaccinated_per_hundred` VARCHAR(45) NULL,
  `people_fully_vaccinated_per_hundred` VARCHAR(45) NULL,
  `new_vaccinations_smoothed_per_million` VARCHAR(45) NULL,
  `stringency_index` VARCHAR(45) NULL,
  `population_density` VARCHAR(25) NULL,
  `median_age` VARCHAR(45) NULL,
  `aged_65_older` INT NULL,
  `aged_70_older` INT NULL,
  `gdp_per_capita` VARCHAR(45) NULL,
  `extreme_poverty` VARCHAR(45) NULL,
  `cardiovasc_death_rate` VARCHAR(45) NULL,
  `diabetes_prevalence` VARCHAR(45) NULL,
  `female_smokers` VARCHAR(45) NULL,
  `male_smokers` VARCHAR(45) NULL,
  `handwashing_facilities` VARCHAR(45) NULL,
  `hospital_beds_per_thousand` VARCHAR(45) NULL,
  `life_expectancy` VARCHAR(45) NULL,
  `human_development_index` VARCHAR(45) NULL);
  
-- insert into covid_vaccinations
load data local infile '/Users/kharisrahmanto/Downloads/CovidVaccinated.csv' 
into table covid_vaccinations
fields terminated by ','
lines terminated by '\n'
ignore 1 lines
 (iso_code, continent, location, date, total_tests, 
 total_tests_per_thousand, new_tests_per_thousand, 
 new_tests_smoothed, new_tests_smoothed_per_thousand, 
 positive_rate, tests_per_case, tests_units, total_vaccinations, 
 people_vaccinated, people_fully_vaccinated, new_vaccinations, 
 new_vaccinations_smoothed, total_vaccinations_per_hundred, 
 people_vaccinated_per_hundred, people_fully_vaccinated_per_hundred, 
 new_vaccinations_smoothed_per_million, stringency_index, population_density, 
 median_age, aged_65_older, aged_70_older, gdp_per_capita, extreme_poverty, 
 cardiovasc_death_rate, diabetes_prevalence, female_smokers, male_smokers, 
 handwashing_facilities, hospital_beds_per_thousand, life_expectancy, 
 human_development_index);
 
-- add new column for correct date type
alter table covid_vaccinations
add date_true date
after date;

-- fill in true date type column
update covid_vaccinations
set date_true = concat(substring_index(date,  '/', -1), '-', substring_index(date,  '/', 1),'-', substring_index(substring_index(date,  '/', 2),'/',-1));

-- delete old date column (which isn't in correct type)
alter table covid_vaccinations
drop column date;

select * from covid_vaccinations;


-- ------------------------ DATA EXPLORATION --------------------

-- total death globally
select max(total_cases) as Total_Cases, 
	max(total_deaths) as Total_Deaths, 
    max(total_deaths)/max(total_cases)*100 as Death_Rate
from covid_death
where continent not in ('');

-- total population
with Total_Population (Locaion, Population) as 
(
select location, max(population)
from covid_death
where continent in ('') -- and location not in ('World')
group by location
order by 2 desc
)
select sum(Population) as TotalPopulation
from Total_Population;covid_deathiso_code

-- sort by total deaths (per country)
select location, max(total_deaths) as TotalDeath 
from covid_death
where continent not in ('')
group by location
order by TotalDeath desc;

-- sort by total deaths (per continent)
select location, max(total_deaths) as TotalDeath 
from covid_death
where continent in ('')
group by location
order by TotalDeath desc;

-- highest infected rate (per total population) countries
select location, max(total_cases/population*100) as Infection_Rate
from covid_death
group by location
order by Infection_Rate desc;

-- select continents with highest death count per population
select location, max(total_deaths/population*100) as Death_Rate
from covid_death
where continent in ('')
group by location
order by Death_Rate desc;

-- show new_cases, new_death, death_rate per day for GLOBAL population
select date_true,
 sum(new_cases) as new_cases,
 sum(new_deaths) as new_deaths,
 (sum(new_deaths)/sum(new_cases)*100) as death_rate
from covid_death
where continent not in ('')
group by date_true
order by date_true;

-- join coviddeath and covidvaccinated
select dea.location, dea.date_true, new_cases, new_vaccinations,
 (sum(new_vaccinations) over (partition by dea.location order by dea.location, dea.date_true)) as total_vac_,
 (sum(new_vaccinations) over (partition by dea.location order by dea.location, dea.date_true)/dea.population*100) as Vaccine_Rate
from covid_death as dea
join covid_vaccinations as vac
	on dea.location = vac.location
	and dea.date_true = vac.date_true
where dea.location in ('Indonesia');

-- same as the above but use CTE (Common Table Expression)
with vaccine_rate (Location, Date_, New_Cases, New_Vac, Total_Vac, Population) as
(
select dea.location, dea.date_true, new_cases, new_vaccinations, 
(sum(new_vaccinations) over (partition by dea.location order by dea.location, dea.date_true)) as total_vac_,
dea.population -- ,
-- (sum(new_vaccinations) over (partition by dea.location, dea.date_true)/dea.population*100) as Vaccine_Rate
from covid_death as dea
join covid_vaccinations as vac
	on dea.location = vac.location
	and dea.date_true = vac.date_true
-- where dea.location in ('Indonesia')
)
select Location, Date_, New_Cases, New_Vac, Total_Vac , Total_Vac/Population*100 as Vaccine_Rate
from vaccine_rate
where Location in ('Indonesia');

-- show vaccine rate per country
select vac.location, sum((new_vaccinations)) as total_vac_, 
	sum(new_vaccinations/dea.population*100) as Vaccine_Rate
from covid_vaccinations as vac
join covid_death as dea
	on vac.location = dea.location
    and vac.date_true = dea.date_true
where vac.continent not in ('') -- and vac.location in ('Indonesia')
group by vac.location
order by 3 desc;
