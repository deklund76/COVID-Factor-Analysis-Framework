**### DRAFT**

# Random Forest Model

The random forest model uses bootstrap samples and an ensemble of decision trees for learning.  

## Questions to be Answered

 1. What features contribute most to being classified as above or below average over 2020?
    (average of total cases and of total deaths)

 2. What features contribute most to being classified as above or below average over both 2020 and 2021?
    (average of total cases and of total deaths)

 3. What are the differences?

 4. If the number of features is reduced, what do the differnces look like?


## Reasons for choosing the model

### Benefits

1.  Provides importances of features

2.  Variance is reduced by introducing randomness with replacement which improves the model's fit
    sometimes a slight increase in bias may occur

3.  Datasets are sufficiently large for this approach

4.  Robust to outliers and nonlinear data

5.  Computation time for a random forest is also a benefit

### Drawbacks

1.  It may not always be able to ascertain why a random forest makes its decision.  Altough sklearn provides       feature importances, their limitations should be considered: <br>

>"The impurity-based feature importances computed on tree-based models suffer from two flaws that can lead to misleading conclusions. First they are computed on statistics derived from the training dataset and therefore do not necessarily inform us on which features are most important to make good predictions on held-out dataset. Secondly, they favor high cardinality features, that is features with many unique values." (sklearn)

### Setting up the Analysis

Database:  *United_States_COVID-19_Cases_and_Deaths_by_State_over_Time.csv*

- Explore new cases and new deaths from COVID-19 by state over the years 2020 and 2021

- Use the yearly statistics from this database in the analysis of other features in the vax_cases_death.csv database

- Database features are the new cases and the new deaths from COVID-19 and the states

Database *vax_cases_death.csv*

- Explore the distributions and administrations of vaccines over the year 2021 by state

- Possibly explore additional features.

- Database features are the distributions, the administrations, and the states

Imbalance:  *note that the classier set (labels) is NOT imbalanced*


## Finding the optimal model

According to sklearn,the scikit-learn implementation differs from the original random forest conceptualization of each sample-sized decision tree voting for the best outcome.  In scikit-learn the ensemble learners outcome is averaged.  It is known that individual decision trees typically have high variance which caused overfittig.  The algorithm of voting or averaging tends to reduce the variance so that the randpm forest trees are less likely overfit the data.  By assessing the model results, parameters can be found which provide a predictive fit rather than an overfit. The model parameters which are explored here to find an optimal model.  

Parameter names used in the random forest arguments are:<br><br>

n_estimators=128<br>
random_state=78<br>
criterion = 'gini' or 'entropy'<br>
max_depth = None or 10<br>
max_features = 'auto' or 'sqrt'<br>
min_impurity_decrease = 0.0 or a fraction<br>
oob_score = False or True<br>

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
|  16  |  128  |  78  |  entropy  |  None  |  'sqrt'  |  0.5  |  False  |  
|  17 |  128  |  78  |  entropy  |  None  |  'sqrt'  |  0.5  |  True  |  


## Model Evaluation

### Cases and Deaths

The approach is to create a label column with binary outcomes from the total cases and the total deaths and then to use a random forest classifer to analyze features which predict one or the other.  Here the binary outcome is that features result in an above average or a below average number of cases or deaths.

First, evaluate using the mean from 2020 found from the United_States_COVID-19_Cases_and_Deaths_by_State_over_Time database.

Second, evaluate using the mean from 2020 and 2021 found from the United_States_COVID-19_Cases_and_Deaths_by_State_over_Time database.

These means are used for feature analyses with both the United_States_COVID-19_Cases_and_Deaths_by_State_over_Time database and the vax_cases_death.csv database.


## Model Results

The model results are read into a PostgreSQL database for helping in analysis and presentations.


## Displays of Results

1.  Machine learning model performance optimization graph

2.  Decision trees surface plot for two features:
    What does the plot look like for the optimal model compared to a non-optimal model?

3.  Visualizations using importance measures of features

4.  Others?



## References:

https://scikit-learn.org/stable/modules/ensemble.html?highlight=min_samples_split#random-forest-parameters<br>
https://scikit-learn.org/stable/auto_examples/ensemble/plot_forest_iris.html<br>
Module 18.7.8.1<br>




