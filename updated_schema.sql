-- Creating tables for Project-One
CREATE TABLE vaccinations (
	date date,
	mmwr_week int,
	year int,
	location varchar,
	concat varchar,
	distributed int,
	administered int,
	recip_administered int,
	administered_dose1 int,
	series_complete int,
	additional_doses int,
	PRIMARY KEY (concat)
);

CREATE TABLE casesdeaths (
	submission_date date,
	mmwr_week int,
	year int,
	location varchar,
	concat varchar,
	total_cases int,
	total_confirmed_cases int,
	total_prob_cases int,
	new_cases int,
	prob_new_cases int,
	total_deaths int,
	confirmed_deaths int,
	prob_deaths int,
	new_deaths int,
	prob_new_deaths int,
	PRIMARY KEY (concat)
);

SELECT * from casesdeaths
SELECT * from vaccinations

-- Joining vaccinations and casesdeaths tables
SELECT vaccinations.Date,
	vaccinations.mmwr_week,
	vaccinations.Year,
	vaccinations.Location,
	vaccinations.Distributed,
	vaccinations.Administered,
	casesdeaths.total_cases,
	casesdeaths.total_deaths
INTO vax_cases_deaths	
FROM vaccinations
INNER JOIN casesdeaths
ON vaccinations.Concat = casesdeaths.concat;	



















