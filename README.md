# Spotify Churn Analysis

## Introduction 
The dataset I use is [Spotify Analysis Dataset 2025](https://www.kaggle.com/datasets/nabihazahid/spotify-dataset-for-churn-analysis/data) from Kaggle. This dataset is **synthetically generated**. **Spotify** is a streaming platform where users can listen to music with limitations or get a premium subscription for unlimited access.

##  Who usually churn? Analisys


---
## Step 1: Configuration and Environment
- Install required Python libraries using:
```
pip install pandas numpy sqlalchemy psycopg2-binary seaborn matplotlib plotly scikit-learn scipy streamlit python-dotenv
```
- Create a Docker container for the PostgreSQL database server.
- Prepare connection configuration files for Python (e.g., .env for credentials).
  
## Step 2: Data Import
- Create a table in PostgreSQL to store the dataset.
- Import data from the CSV file using SQLAlchemy:
```
with engine.begin() as conn:
    df.to_sql('spotify_users', conn, if_exists='append', index=False)
```

## Step 3 Feature Engineering in SQL
- Create views to simplify queries and analyses.
- Add calculated columns for derived metrics:
`ads_per_hour = (ads_listened_per_week * 60) / (7 * listening_time)`



## Step 4: Exploratory Data Analysis (EDA) in SQL & Python

| SQL Analysis                                  | Python Analysis                                                         |
|-----------------------------------------------|------------------------------------------------------------------------|
| Check that values are within valid ranges     | Examine dataset structure and summary statistics using `df.info()` and `df.describe()` |
| Check for duplicate rows                       | Segment users by age groups                                             |
| Check for null values                           | Create visualizations for initial analysis                              |
| Identify insights                               |                                                                        |


## Step 5 Machine Learning Model – Logistic Regression
- Evaluate feature importance using correlation analysis, mutual information, and risk metrics.
- Implement one-hot encoding using DictVectorizer for categorical features.
- Train a logistic regression model: a linear model that outputs probabilities.
- Interpret model coefficients: positive weights increase churn probability, negative weights decrease it.

## Step 6 Dashboard
- Connect to the database using Supabase.
- Create measures (miary) using DAX for aggregations.
- Add filters and interactive elements to enhance data exploration and presentation.
  <img width="1971" height="1125" alt="image" src="https://github.com/user-attachments/assets/41839fb0-0129-461e-8e40-63e46b18c81e" />

 
## Step 7 Analysis Summary
  
  




