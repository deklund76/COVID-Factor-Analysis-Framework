Opening & Why:
Hello and opening lighthearted mood setting
How we chose
What we chose
Why we chose it
Basic orientation of the project

Database & Pipeline:
Slide: Data Source
•	Downloaded two datasets from the CDC website
•	Vaccination rates over time
•	Cases and Deaths over time

Slide: Database Pipeline
•	A PostGRES database was created and connected to an Amazon Web Services database. 
•	The datasets were stored in an S3 bucket.
•	Two tables were created in PostGRES. A merge was performed to create a dataset with the vaccination data and cases and deaths for the machine learning modeling.

Slide: Vaccination table
•	Example of table and data

Slide: Cases_Deaths table
•	Example of table and data

Slide: ERD 
•	Visual of ERD
•	Concat is the created field; primary key; one to one relationship

Model & results:

Slide:  Machine Learning Overview

- Connected to AWS database.  Used two input databases.
- Used a random forest decision tree machine learning model with the databases.  The jupyter notebooks clean the database, create two files one for cases and one for deaths, optimize the model, apply the model, and output the model results to a database.
- Model was optimized on database 1.  Training and testing used sklearn defaults split fractions.  Model was also applied on database 2 (but not optimized on db 2).
- Output results to a local PostgreSQL database:  dataset statistics, model input parameters, model importance parameters, and model results including the confusion mantix, classification report, and accuracy score.

Slide:  Model Optimization

- The optimal model was found by running 15 random forest models with different parameters assigned on database 1.
- Model performed very well with indicative parameters not overtrained and accuracy in the 0.9 range on database 2.

Slide:  Model Results

- The analysis approach takes time into account by creating labels that change in time.  
- The labels are a binary outcome:  above or below the mean cases or deaths.
- Features important:  new cases, new deaths, year
- State of HI drops in importance over time
- Administered becomes more important over time

Next steps:

What is the applicability of what we have right now

What could what we have now be adapted for

What else would be useful in the model

Scraping


Slide: The Future Finding more data sources

- As Dan has demonstrated, our model works well with vaccination data.
- The recommendation we have for future analysis is adding features of interest for the model to evaluate.
- This means more data sources with information on said features and covid.
- More detailed data faces a myriad of issues:
  * Not all states track all demographic information for cases/deaths e.g. Alabama
  * Master datasets with more detailed information require the ability to process tables with millions of rows.
  * Working with said data is computationally expensive

Slide: Solution: Webscraping!

- A variety of projects from many other organizations have already done the work of "curating" the data
- Harvard's Gender Sci Lab is one example.
- The data is displayed on their tracker, but not downloadable, thus we scrape it.
- This is challenging: URL to data source for display must be found on website
- Scraping script must be tailored to each dataset due to the nature of HTML, this can be complicated.
- This can be a lot of data to scrape!

Slide: Lessons Learned: DON'T READ INTO MEMORY!

- Don't read into memory! This almost melted my computer and it doesn't work.
- Our design and development process was sound, but time simply didn't allow for more features.
- The only unanticipated issue was when I had a close contact and had to be quarantined without accdss to a computer.
- This ^ supported our model in the end since I was vaccinated and didn't become a COVID case.

Slide: THANK YOU!

~FIN~
