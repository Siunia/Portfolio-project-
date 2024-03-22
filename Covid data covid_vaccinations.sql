-- Kraje z największą ilością wykonanych testów 
select location, sum(total_tests) as sum_of_new_tests from covid_vaccinations
group by location
order by sum_of_new_tests DESC limit 10;

-- Kraje z największą ilością wykonanych testów na tysiąc osób
select location, sum(total_tests_per_thousand) as sum_of_new_tests_per_thousand from covid_vaccinations
group by location
order by sum_of_new_tests_per_thousand DESC limit 10;

-- Ogólny wskaźnik pozytywnych wyników testów
select location, avg(positive_rate)*100 as  avg_positive_rate from covid_vaccinations
group by location
order by avg_positive_rate DESC;

-- Średnia liczba testów na jednen pozytywny wynik testu
select avg(tests_per_case) as avg_test_per_case from covid_vaccinations;

-- Łączne ogólne szczepienia dla danych lokalizacji
select location, sum(total_vaccinations) as sum_of_total_vaccinations from covid_vaccinations
group by location
order by sum_of_total_vaccinations DESC;

-- Ile osób otrzymało co najmniej jedną dawkę szczepienia?
select sum(people_vaccinated) as sum_of_people_vaccinated from covid_vaccinations;

-- Ile osób jest w pełni zaszczepionych?
select sum(people_fully_vaccinated) as fully_vaccinated from covid_vaccinations;

-- Jaka jest nowa liczba szczepień?
select sum(new_vaccinations) as sum_of_new_vaccinations from covid_vaccinations; 

-- Jaki jest procent całkowitych szczepień na sto osób?
select avg(total_vaccinations_per_hundred) as avg_total_vaccinations_per_hundred from covid_vaccinations;

-- Jaki procent populacji otrzymał co najmniej jedną dawkę szczepienia?
select avg(people_vaccinated) as avg_people_vaccinated from covid_vaccinations;

-- Jaki procent populacji jest w pełni zaszczepiony?
select avg(people_fully_vaccinated) as avg_people_fully_vaccinated from covid_vaccinations;

-- Jaka jest średnia gęstość zaludnienia?
select avg(population_density) as avg_population_density from covid_vaccinations;

-- Jakie jest mediana wieku?
select avg(median_age) as avg_median_age from covid_vaccinations;

-- Jaki procent populacji ma 65 lat lub więcej?
select avg(aged_65_older) from covid_vaccinations;

-- Jaki procent populacji ma 70 lat lub więcej?
select avg(aged_70_older) from covid_vaccinations;

-- Jakie jest PKB per capita?
select avg(gdp_per_capita) from covid_vaccinations;

-- Jaki jest odsetek ludności żyjącej w skrajnym ubóstwie?
select avg(extreme_poverty) from covid_vaccinations;

-- Jaki jest wskaźnik zgonów z powodu chorób serca?
select avg(cardiovasc_death_rate) from covid_vaccinations;

-- Jaka jest rozpowszechnienie cukrzycy w populacji?
select AVG(diabetes_prevalence) AS average_diabetes_prevalence from covid_vaccinations;

-- Jaki jest odsetek palaczy wśród kobiet i mężczyzn?
select avg(female_smokers) from covid_vaccinations;
select avg(male_smokers) from covid_vaccinations;

-- Jakie są udogodnienia do mycia rąk na tysiąc osób?
select avg(handwashing_facilities) from covid_vaccinations;

-- Ile łóżek szpitalnych przypada na tysiąc osób?
select avg(hospital_beds_per_thousand) from covid_vaccinations;

-- Jaka jest oczekiwana długość życia?
select avg(life_expectancy) from covid_vaccinations;

-- Jaki jest wskaźnik rozwoju ludzkiego?
select avg(human_development_index) from covid_vaccinations;

-- Podstawowe statystyki dla dziesięciu krajów z najwyższym średnim wskażnikiem testów na tysiąc osób
SELECT location,
       SUM(new_tests) AS total_new_tests,
       AVG(total_tests_per_thousand) AS average_tests_per_thousand,
       AVG(positive_rate) AS average_positive_rate,
       AVG(tests_per_case) AS average_tests_per_case
FROM covid_vaccinations
GROUP BY location
ORDER BY average_tests_per_thousand DESC limit 10;

-- Dane dotyczące szczepień dla poszczególnych kontynentów
SELECT continent,
       SUM(total_vaccinations) AS total_vaccinations,
       SUM(people_vaccinated) AS people_vaccinated,
       SUM(people_fully_vaccinated) AS people_fully_vaccinated,
       AVG(new_vaccinations) AS average_new_vaccinations,
       AVG(new_vaccinations_smoothed) AS average_new_vaccinations_smoothed
FROM covid_vaccinations
where continent is NOT NULL
GROUP BY continent;

-- Dane demograficzne i zdrowotne
SELECT distinct location,
       population_density,
       median_age,
       gdp_per_capita,
       diabetes_prevalence
FROM covid_vaccinations
ORDER BY population_density DESC;

SELECT location,
       new_tests / population_density * 1000 AS tests_per_thousand,
       total_vaccinations / population_density* 1000 AS vaccinations_per_thousand
FROM covid_vaccinations 
WHERE location IN ('Poland', 'Germany', 'France', 'Italy', 'United Kingdom');


