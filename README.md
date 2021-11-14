# project-one

## Description of Communication Protocols: 

For this project, Slack will be used to communicate between team members. Each day unless otherwise agreed upon, the team will convene on Slack at 7 p.m. for a standup meeting where each team member will state their progress for the day and any problems they've encountered as well as pose any questions they have to the team. Each Sunday, the following week's tasks will be assigned so that team members share an equal workload. Progress on the project will also be tracked asynchronously on a group Trello board outlined below:

![trello_board](https://github.com/deklund76/project-one/blob/main/Resources/Trello.png)

Tasks are listed according to the project rubric and color coded according to the role they fall under. Any other tasks or edits team members deem necessary for their assigned tasks will also be posted there. Team members are expected to update their tasks as they complete them so that team members can track each other's progress.

-----------------------------------------------------
Presentation: Mitchell 1st, Dan 2nd

Github: Drew 1st, Sarah 2nd

Machine Learning: Dan 1st, Drew 2nd

Database Sarah 1st, Mitchell 2nd

# Team members have drafted their project, including the following:
## ✓ Selected topic

Our topic of choice is COVID-19 data exploration.

## ✓ Reason why they selected their topic

We took a series of polls, and COVID-19 was the most voted for subject. In the final round it was voted for by consensus. But, in all seriousness, COVID has been one of, if not the single, most significant events of the last year. It reshaped, not only American society, but most countries across the world. Not only was it a significant event, but the disease continues to affect American society. By exploring what factors predict cases and deaths, we can learn more about what would bring this awful chapter to a close.

## ✓ Description of their source of data

https://covid.cdc.gov/covid-data-tracker/#datatracker-home The CDC collects a lot of data, and organizes it into sets. Specifically the cases and deaths over time https://data.cdc.gov/Case-Surveillance/United-States-COVID-19-Cases-and-Deaths-by-State-o/9mfq-cb36, and the vaccination rate over time https://data.cdc.gov/Vaccinations/COVID-19-Vaccinations-in-the-United-States-Jurisdi/unsk-b7fc are our starter sets.

## ✓ Questions they hope to answer with the data

We hope to create two machine learning models, one for cases and one for deaths specifically, with as high accuracy as possible. The primary question is: which data features produce the best accuracy for our target?

## Database Pipeline Demystification:

The data is being downloaded from the CDC website into a PostGRES database, being managed by Sarah. From there, Sarah writes SQL code to perform joins, merges, and cleaning. The PostGRES database is connected to an Amazon Web Services database, and the csv files are stored in an S3 bucket. From there, the data cleaning script reads in those CSV files using Pandas, which are then cleaned, and fed to the machine learning modeling script.

------------------------------------------------------------------------------------------------------------------------
# Segment Two: Exploration and Analysis

## Drew is Scraping Gender Data
Drew has been sick for most of the last week, and not available. Although his data is scraped, and possibly ready to merge, his the scraping and merging of features is an example of "further analysis", and is not strictly part of the minimum viable product, or deliverables for Segment Two. Merging his content will be part of classwork on Tuesday, November 16th, and should be available for review shortly afterward.

## Sarah is merging data sets, and importing Drew's Data
Expand on details here

## Dan is cleaning the updated database, and updating the model

Click [here](https://github.com/deklund76/project-one/blob/main/MLmodel.md ) for details on the random forest model and analysis, including data preprocessing, training, and testing. 

-----------------------------------------------------------------------------------------------------------------------------
Google Slides link: (anyone with access can edit)
https://docs.google.com/presentation/d/1Eti-Xp3HtNmAY58WrW7OXlPTRSwAcABQasO9jw3a4Ng/edit#slide=id.p
