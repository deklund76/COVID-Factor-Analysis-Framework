Opening & Why:
M: "..."

Database & Pipeline:
S:"..., ..."

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
M:"..."

Scraping
Dr:"..., ..."
