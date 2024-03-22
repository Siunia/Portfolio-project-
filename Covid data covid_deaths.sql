-- Odsetek zgonów wyrażony w procentach w porównaniu do całkowitej liczby zachorowań w Polsce

SELECT 
    location,
    SUM(total_deaths) AS total_deaths,
    SUM(total_cases) AS total_cases,
	CONCAT((SUM(total_deaths) / SUM(total_cases))*100,'%') as death_percentage
FROM
    covid_deaths
WHERE
    location = 'Poland'

-- Średnia liczba nowych przypadków zachorowań dziennie w określonym przedziale czasu


SELECT 
    AVG(new_cases) AS avg_new_cases_per_day
FROM
    covid_deaths
WHERE
    date BETWEEN '2020-03-01' AND '2020-03-31';

-- Kraj z największą liczbą zgonów

SELECT 
    location, MAX(total_deaths) AS max_total_deaths
FROM
    covid_deaths
GROUP BY location
ORDER BY max_total_deaths DESC
LIMIT 10;

-- Średnia liczba zgonów na milion mieszkańców

SELECT 
    continent,
    AVG(total_deaths_per_million) AS avg_deaths_per_million
FROM
    covid_deaths
WHERE
    continent = 'Europe';

-- Kraj z największą ilością zgonów w stosunku do liczby przypadków 

SELECT 
    location,
    total_deaths,
    total_cases,
    ROUND((total_deaths / total_cases) * 100, 2) AS death_rate_percentage
FROM
    covid_deaths
WHERE
    total_cases > 100
ORDER BY death_rate_percentage DESC
LIMIT 1;

-- Kraj z największym odsetkiem populacji w pełni zaszczepionej

SELECT 
    location,
    people_fully_vaccinated,
    population,
    (people_fully_vaccinated / population) * 100 AS fully_vaccinated_percentage
FROM
    covid_deaths
ORDER BY fully_vaccinated_percentage DESC
LIMIT 1;

-- Średni współczynnik reprodukcji w czasie dla Polski

SELECT 
    location, date, reproduction_rate
FROM
    covid_deaths
WHERE
    location = 'Poland'
ORDER BY date;

-- Państwa z największą iczbą pacjentów na ICU

SELECT 
    location, MAX(icu_patients) AS number_of_patients
FROM
    covid_deaths
WHERE
    icu_patients > 0
GROUP BY LOCATION
ORDER BY number_of_patients DESC;

-- Średni wskażnik pozytywnych wyników testów dla określonego kraju (istotność dla oceny skuteczności testowania)

SELECT 
    location,
    CONCAT(AVG(positive_rate) * 100, '%') AS avg_positive_rate
FROM
    covid_deaths
WHERE
    location = 'Belgium'
        OR location = 'United States'
        OR location = 'Poland'
        OR location = 'Brazil'
GROUP BY location;

-- Liczba nowych szczepień w danym kraju w określonym przedziale czasu: 

SELECT 
    location, date, new_vaccinations
FROM
    covid_deaths
WHERE
    location = 'Poland'
        AND date BETWEEN '2000-01-01' AND '2040-01-01'
        AND new_vaccinations > 0
ORDER BY date;

-- 




