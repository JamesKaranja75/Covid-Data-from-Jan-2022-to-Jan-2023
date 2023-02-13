use portfolioproject;

SELECT * FROM portfolioproject.covid_deaths
where continent is not null
ORDER BY 3,4;
SELECT * FROM portfolioproject.covidvaccinations
ORDER BY 3,4;

# Select Data that we are going to be using

select location, date, total_cases, new_cases, total_deaths, population 
from covid_deaths
order by 1,2;

# Looking at Total Cases vs Total Deaths in Africa

select location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as DeathPercentage 
from covid_deaths
order by 1,2;

# Looking at Total Cases vs TotalDeaths in Kenya
#Shows the likelihood of dying if you contract covid in Kenya

select location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as DeathPercentage 
from covid_deaths
where location like 'KEN%'
order by 1,2;

# Looking at the Total Cases vs Population in Africa

select location, date, total_cases, population, (total_cases/population)*100 as  Percentage_of_population_infected
from covid_deaths
order by 1,2;


# Shows what percentage of popultion got covid in Kenya

select location, date, total_cases, population, (total_cases/population)*100 as  Percentage_of_population_infected
from covid_deaths
where location like 'KEN%'
order by 1,2;

# Looking at the Countries with Highest Infection Rate campared to Population

select location, population, MAX(total_cases) as HighestInfectionCount, MAX((total_cases/population))*100 as  Percentage_of_population_infected
from covid_deaths
where location <> 'africa'
group by location,population
order by Percentage_of_population_infected desc;

#Showing Countries with the Highest Death Count per Population

select location, MAX(total_deaths) as TotalDeathCount
from covid_deaths
where location <> 'africa'
group by location
order by TotalDeathCount desc;

# Total Deaths vs Total Cases on each country across the Africa Continent

select continent, location, date, SUM(new_cases) as Total_Cases, SUM(new_deaths) as Total_Deaths, SUM(new_deaths/new_cases)*100 as DeathPercentage
from covid_deaths
where location <> 'africa'
group by date
order by 1,2;

# Total Deaths vs Total Cases in Africa

select SUM(new_cases) as Total_Cases, SUM(new_deaths) as Total_Deaths, SUM(new_deaths)/SUM(new_cases)*100 as DeathPercentage
from covid_deaths
order by 1,2;

# Total percentage of people vaccinated in Africa

SELECT location, sum(people_vaccinated),SUM(total_vaccinations), (sum(people_vaccinated)/sum(total_vaccinations))* 100 as percentage_of_people_vacinated
FROM portfolioproject.covidvaccinations;

#Total percentage of people Vaccinated across all the Countries in Africa

SELECT location, sum(people_vaccinated),SUM(total_vaccinations), (sum(people_vaccinated)/sum(total_vaccinations))* 100 as percentage_of_people_vacinated
FROM portfolioproject.covidvaccinations
where location <> 'Africa'
GROUP BY location;


/* Queries used  for Tabaleau Project */
#1

select sum(new_cases) as Total_cases, sum(new_deaths) as Total_deaths, sum(new_deaths)/(sum(new_cases))*100 as DeathPercentage
FROM covid_deaths;

#2
select location, population, MAX(total_cases) as HighestInfectionCount, MAX(total_cases/Population)*100 as PercentPopulationInfected
FROM covid_deaths
where location <> 'Africa'
group by location,population
order by PercentPopulationInfected desc;

#3

select location, population, date, MAX(total_cases) as HighestInfectionCount, MAX(total_cases/Population)*100 as PercentPopulationInfected
FROM covid_deaths
where location <> 'Africa'
group by location, population, date
order by PercentPopulationInfected desc;

#4

select location, sum(new_deaths) as TotalDeathCount
from covid_deaths
where location <> 'africa'
group by location
order by SUM(new_deaths) desc ;

select location, sum(new_deaths) as TotalDeathCount
from covid_deaths
where location <> 'africa'
group by location
order by SUM(new_deaths) desc 
LIMIT 10;
