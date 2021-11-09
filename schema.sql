-- Creating tables for Project-One
CREATE TABLE vaccinations (
	date date,
	mmwr_wk int,
	location varchar,
	administered int,
	recip_administered int,
	admin_dose1 int,
	series_complete int,
	additional_doses int,
	PRIMARY KEY (location)
);

CREATE TABLE casesdeaths (
	submission_date date,
	state varchar,  
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
	PRIMARY KEY (state)
);

SELECT * FROM vaccinations

SELECT * FROM casesdeaths