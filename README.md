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

#### Via Download
https://covid.cdc.gov/covid-data-tracker/#datatracker-home The CDC collects a lot of data, and organizes it into sets. Specifically the cases and deaths over time https://data.cdc.gov/Case-Surveillance/United-States-COVID-19-Cases-and-Deaths-by-State-o/9mfq-cb36, and the vaccination rate over time https://data.cdc.gov/Vaccinations/COVID-19-Vaccinations-in-the-United-States-Jurisdi/unsk-b7fc are our starter sets.

#### Via Webscraping
https://www.genderscilab.org/gender-and-sex-in-covid19 Harvard's Gender Sci Lab is a collaborative, interdisciplinary research lab dedicated to generating concepts, methods, and theories for scientific research on sex and gender. They created a Covid-19 Sex/Gender data tracker to report weekly and cumulative US state-level gender/sex-disaggregated COVID-19 cases and fatality data from mid-April to the present day, manually extracted each week from publicly-available state public health departments. 

### Database and Pipeline
The data was downloaded from the CDC website into a PostGRES database. From there, SQL code performs joins, merges, and cleaning. The PostGRES database is connected to an Amazon Web Services database, and the CSV files are stored in an S3 bucket.  From there, the data cleaning script reads in those CSV files using Pandas, which are then cleaned, and fed to the machine learning modeling script. Maintenance and monitoring of third party systems continues. The Entity Relationship Diagram is also part of the database programming work.

## The How

### Data cleaning, and maching learning

Click [here](https://github.com/deklund76/project-one/blob/main/MLmodel.md ) for details on the random forest model and analysis, including data preprocessing, training, and testing. 

### Webscraping

Data was scraped from Harvard's Gender Sci Lab Covid-19 Sex/Gender data tracker using Beautiful Soup and an automated Chrome web browser created with Splinter.

## The Product

Google Slides link:

[here](https://docs.google.com/presentation/d/1Eti-Xp3HtNmAY58WrW7OXlPTRSwAcABQasO9jw3a4Ng/edit#slide=id.p)

Tableau:

Workbook is available as a view-only link with a Tableau Online account (no trial necessary) [here](https://prod-useast-b.online.tableau.com/#/site/covid19casesanddeathsfactoranalysis/workbooks/287564?:origin=card_share_link)

And slides [here](https://prod-useast-b.online.tableau.com/#/site/covid19casesanddeathsfactoranalysis/workbooks/288588?:origin=card_share_link)

And the notes for the presentation [here](https://github.com/deklund76/project-one/blob/main/PresentationNotes.md)

## The Takeaway

### Result of analysis

Our analysis is more a model for future features to be arrayed on than meaningful in and of itself. The model creates an ordered list of how much each feature contributes to the overall prediction of whether a state's cases and deaths are above or below average.

### Recommendation for future analysis

The recommendation we have for future analysis is adding features of interest for the model to evaluate. This would produce an ordered list of the importance of various features merged in when compared with each other. This would be useful for finding which features are the most important to focus on when attempting covid prevention.

### Anything the team would have done differently

We would have liked to rename the repo, and organized the GitHub better. We would also have liked to get the web scraped data merged in. Many of the things we would have liked to do weren't due to mistakes in the process however, but due to running out of time. The processes we set up worked well for us, and things ran smoothly. There were no problems to speak of in the workflow. One unforseen quarantine was the extent of our unanticipated problems.
