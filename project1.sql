SELECT *
FROM projectportfolio.coviddeaths
order by 3,4

--SELECT *
--FROM projectportfolio.covidvaccines
--order by 3,4
SELECT Location, date, total_cases, new_cases, total_deaths, population
FROM projectportfolio.coviddeaths
order by 1,2

SELECT Location, date, total_cases, new_cases, total_deaths, population, (total_deaths/total_cases)*100 as Death_percentage
FROM projectportfolio.coviddeaths
order by 1,2


SELECT Location, MAX(total_cases) as  Higest, population, MAX((total_deaths/total_cases))*100 as Death_percentage
FROM projectportfolio.coviddeaths
GROUP BY Location, population
order by 1,2

select date, sum(new_cases), sum(cast(new_deaths as int))
from coviddeaths
group by date
order by 1,2

select dea.continent, dea.location, dea.date, vac.new_vaccinations
from projectportfolio.covidvaccines dea
join projectportfolio.coviddeaths vac
   on dea.Location = vac.location
   and dea.date = vac.date
order by 1, 2