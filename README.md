# COVID19 Cases and Deaths Factor Analysis

## The Why
### Topic

Our topic of choice is COVID-19 data exploration. Specifically, we are exploring the factors which most affect a machine learning model's ability to predict cases and deaths within a State. We hypothesize that factors with high predictive validity within machine learning modeling are likely to be predictive in the real world of risk factors within a State.

### Reason for topic

We took a series of polls, and COVID-19 was the most voted for subject. In the final round it was voted for by consensus. But, in all seriousness, COVID has been one of, if not the single, most significant events of the last year. It reshaped, not only American society, but most countries across the world. Not only was it a significant event, but the disease continues to affect American society. By exploring what factors predict cases and deaths, we can learn more about what would bring this awful chapter to a close.

### Questions for data

We hope to create two machine learning models, one for cases and one for deaths specifically, with as high accuracy as possible. The primary question is: which data features produce the best accuracy for our target?

## The What

### Source data

https://covid.cdc.gov/covid-data-tracker/#datatracker-home The CDC collects a lot of data, and organizes it into sets. Specifically the cases and deaths over time https://data.cdc.gov/Case-Surveillance/United-States-COVID-19-Cases-and-Deaths-by-State-o/9mfq-cb36, and the vaccination rate over time https://data.cdc.gov/Vaccinations/COVID-19-Vaccinations-in-the-United-States-Jurisdi/unsk-b7fc are our starter sets.

### Database and Pipeline
The data is being downloaded from the CDC website into a PostGRES database. From there, SQL code performs joins, merges, and cleaning. The PostGRES database is connected to an Amazon Web Services database, and the CSV files are stored in an S3 bucket.  From there, the data cleaning script reads in those CSV files using Pandas, which are then cleaned, and fed to the machine learning modeling script. Maintenance and monitoring of third party systems continues. The Entity Relationship Diagram is also part of the database programming work.

## The How

### Data cleaning, and maching learning

Click [here](https://github.com/deklund76/project-one/blob/main/MLmodel.md ) for details on the random forest model and analysis, including data preprocessing, training, and testing. 

## The product

Google Slides link:

[here](https://docs.google.com/presentation/d/1Eti-Xp3HtNmAY58WrW7OXlPTRSwAcABQasO9jw3a4Ng/edit#slide=id.p)

Tableau Workbook:

This is available for download as a Tableau Workbook file [here](https://github.com/deklund76/project-one/tree/main/Tableau_files)
or as a view-only link [here](https://prod-useast-b.online.tableau.com/#/site/covid19casesanddeathsfactoranalysis/workbooks/287564?:origin=card_share_link)
