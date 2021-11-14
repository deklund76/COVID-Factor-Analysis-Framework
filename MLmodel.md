### DRAFT

# Random Forest Model

The random forest model uses bootstrap samples and an ensemble of decision trees for learning.  

## Questions to be Answered

 1. What features contribute most to being classified as above or below average of the year 2020?<br>
    (average of total cases and of total deaths)

 2. What features contribute most to being classified as above or below average of years 2020 and 2021?<br>
    (average of total cases and of total deaths)

 3. What are the differences?

 4. If the number of features is reduced, what do the differences look like?


## Reasons for choosing the model

### Benefits

1.  Provides importances of features

2.  Variance is reduced by introducing randomness with replacement which improves the model's fit

3.  Datasets are sufficiently large for this approach

4.  Robust to outliers and nonlinear data

5.  Computation time for a random forest is also a benefit

### Drawbacks

1.  It may not always be able to ascertain why a random forest makes its decision.  Altough sklearn provides       feature importances, their limitations should be considered: <br>

> "The impurity-based feature importances computed on tree-based models suffer from two flaws that can lead to misleading conclusions. First they are computed on statistics derived from the training dataset and therefore do not necessarily inform us on which features are most important to make good predictions on held-out dataset. Secondly, they favor high cardinality features, that is features with many unique values." (sklearn)

2. Sometimes a slight increase in bias may occur

### Setting up the Analysis

Database:  *United_States_COVID-19_Cases_and_Deaths_by_State_over_Time.csv*

- Explore new cases and new deaths from COVID-19 by state over the years 2020 and 2021

- Use the yearly statistics from this database in the analysis of other features in the vax_cases_death.csv database also

- Database features are the new cases and the new deaths from COVID-19 and the states
- Label columns are based on the means for the year 2020 and the means for the years 2020 and 2021 combined 

Database *vax_cases_death.csv*

- Explore the distributions and administrations of vaccines over the year 2021 by state

- Possibly explore additional features.

- Database features are the distributions, the administrations, and the states
- Label columns are based on the means for the year 2020 and the means for the years 2020 and 2021 combined (from database United_States_COVID-19_Cases_and_Deaths_by_State_over_Time.csv)


Imbalance:  *Note that the classier set (labels) is NOT imbalanced.*  This was verified by doing a values count on the label colummns.


## Finding the optimal model

According to sklearn,the scikit-learn implementation differs from the original random forest conceptualization of randon forests in which each sample-sized decision tree votes for the best outcome.  In scikit-learn the ensemble learners' outcome is averaged.  It is known that individual decision trees typically have high variance which causes overfitting.  Either the voting or averaging algorithms tend to reduce the variance so that the randpm forest trees are less likely overfit the data.  By assessing the model results, parameters can be found which provide a predictive fit rather than an overfit. The model parameters which are explored to find an optimal model are as follows:<br>

n_estimators=128<br>
random_state=78<br>
criterion = 'gini' or 'entropy'<br>
max_depth = None or 10<br>
max_features = 'auto' or 'sqrt'<br>
min_impurity_decrease = 0.0 or a fraction<br>
oob_score = False or True<br><br><br>

**Table:  Parameter Evaluations to Find an Optimal Model**<br>


| notebook | n_estimators | random_state | criterion | max_depth | max_features | min_impurity_decrease|oob_score |
|:---------:|:----------:|:----------:|:----------:|:----------:|:---------:|:--------:|:---------:|
|  1  |  128  |  78  |  gini  |  None  |  'auto'  |  0.0  |  False  |
|  2  |  128  |  78  |  gini  |  None  |  'auto'  |  0.0  |  True   |
|  3  |  128  |  78  |  entropy  |  None  |  'auto'  |  0.0  |  False  |  
|  4 |  128  |  78  |  entropy  |  None  |  'auto'  |  0.0  |  True  |  
|  5  |  128  |  78  |  gini  |  10 |  'sqrt'  |  0.0  |  False  |
|  6  |  128  |  78  |  gini  |  10  |  'sqrt'  |  0.0  |  True   |
|  7  |  128  |  78  |  entropy  |  10  |  'sqrt'  |  0.0  |  False  |  
|  8 |  128  |  78  |  entropy  |  10  |  'sqrt'  |  0.0  |  True  | 
|  9  |  128  |  78  |  gini  |  None  |  'sqrt'  |  0.02  |  False  |
|  10  |  128  |  78  |  gini  |  None  |  'sqrt'  |  0.02  |  True   |
|  11  |  128  |  78  |  entropy  |  None  |  'sqrt'  |  0.02  |  False  |  
|  12 |  128  |  78  |  entropy  |  None  |  'sqrt'  |  0.02  |  True  |  
|  13 |  128  |  78  |  entropy  |  10  |  'sqrt'  |  0.0  |  True  | 
|  14  |  128  |  78  |  gini  |  None  |  'sqrt'  |  0.5  |  False  |
|  15  |  128  |  78  |  gini  |  None  |  'sqrt'  |  0.5  |  True   |

<br><br>

## Model Evaluation

### Cases and Deaths

The approach is to create a label column with binary outcomes from the total cases and the total deaths and then to use a random forest classifer to analyze features.  Here the binary outcome is that features result in an above average or a below average number of cases or deaths by:

- First, evaluating the mean from 2020 found from the United_States_COVID-19_Cases_and_Deaths_by_State_over_Time database.

- Second, evaluating the mean from 2020 and 2021 found from the United_States_COVID-19_Cases_and_Deaths_by_State_over_Time database.

These two means are used for feature analyses with both the United_States_COVID-19_Cases_and_Deaths_by_State_over_Time database and the vax_cases_death.csv database.  The following table illustrates the four label columns created:<br><br>

**Table:  Label Column Outcomes**<br>

|     |  Database 1  |  Database 2  |
|:-------:|:-----------:|:-------------:|
|  Cases  |  C1  |  C2  |
|  Daeths  |  D1  |  D2  |
<br>
Database 1:  United_States_COVID-19_Cases_and_Deaths_by_State_over_Time database<br>
Database 2:  vax_cases_death database<br>
C1:  >= or < number of cases mean of 2020<br>
C2:  >= or < number of cases mean of 2020 and 2021<br>
D1:  >= or < number of deaths mean of 2020<br>
D2:  >= or < number of deaths mean of 2020 and 2021<br>

The features used in the evaluation from Database 1 and Database 2 were described in the section on setting up the analysis.  The data preprocessing was to clean the data and create the label columns.  Splitting of the data into training and testing sets for Random Forest modeling used the default values in scikit-learn.

<br>
## Model Results

The optimal model was found to be notebook 6 in the above table. The model results, for both optimal and non-optimal models, are read into a PostgreSQL database for helping in analysis and presentations.  The model results database has tables for holding the model input, statistics for the number of cases and the number of deaths, random forest feature importances, and other model results used in machine learning.<br>


## Displays of Results

1.  Machine learning model performance optimization graph

2.  Visualizations using importance measures of features

3.  Others?


## Results files

The results of the random forest model can be found below:

**optimal model** csv format files:

[rfinput_optimal.csv](https://github.com/deklund76/project-one/blob/ML_results_database/Resources/rfinput_optimal.csv )<br>
[mlsetstat_optimal.csv](https://github.com/deklund76/project-one/blob/ML_results_database/Resources/mlsetstat_optimal.csv )<br>
[rfimportance_optimal.csv](https://github.com/deklund76/project-one/blob/main/Resources/rfimportance_optimal.csv )<br>
[rfresult_optimal.csv](https://github.com/deklund76/project-one/blob/ML_results_database/Resources/rfresult_optimal.csv )<br>

**analysis** csv format files:

[mlinputs_1.csv](https://github.com/deklund76/project-one/blob/ML_results_database/Resources/mlinputs_1.csv ) (C1 and D1 resuls)<br>
[mlinputs2.csv](https://github.com/deklund76/project-one/blob/ML_results_database/Resources/mlinputs_2.csv ) (C2 and D2 results)<br>
[analysis_output.csv](https://github.com/deklund76/project-one/blob/ML_results_database/Resources/analysis_output.csv ) (C1, D1, C2, and D2 results)<br>


## References:

https://scikit-learn.org/stable/modules/ensemble.html?highlight=min_samples_split#random-forest-parameters<br>
https://scikit-learn.org/stable/auto_examples/ensemble/plot_forest_iris.html<br>
Module 18.7.8.1<br>




