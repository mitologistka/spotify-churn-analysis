# Spotify Churn Analysis

## Introduction 
The dataset I use is [Spotify Analysis Dataset 2025](https://www.kaggle.com/datasets/nabihazahid/spotify-dataset-for-churn-analysis/data) from Kaggle. This dataset is **synthetically generated**. **Spotify** is a streaming platform where users can listen to music with limitations or get a premium subscription for unlimited access.

##  Who usually churn? Analisys

<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>count</th>
      <th>mean</th>
      <th>std</th>
      <th>min</th>
      <th>25%</th>
      <th>50%</th>
      <th>75%</th>
      <th>max</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>age</th>
      <td>8000.0</td>
      <td>37.66</td>
      <td>12.74</td>
      <td>16.0</td>
      <td>26.00</td>
      <td>38.0</td>
      <td>49.00</td>
      <td>59.0</td>
    </tr>
    <tr>
      <th>listening_time</th>
      <td>8000.0</td>
      <td>154.07</td>
      <td>84.02</td>
      <td>10.0</td>
      <td>81.00</td>
      <td>154.0</td>
      <td>227.00</td>
      <td>299.0</td>
    </tr>
    <tr>
      <th>songs_played_per_day</th>
      <td>8000.0</td>
      <td>50.13</td>
      <td>28.45</td>
      <td>1.0</td>
      <td>25.00</td>
      <td>50.0</td>
      <td>75.00</td>
      <td>99.0</td>
    </tr>
    <tr>
      <th>skip_rate</th>
      <td>8000.0</td>
      <td>0.30</td>
      <td>0.17</td>
      <td>0.0</td>
      <td>0.15</td>
      <td>0.3</td>
      <td>0.45</td>
      <td>0.6</td>
    </tr>
    <tr>
      <th>ads_listened_per_week</th>
      <td>8000.0</td>
      <td>6.94</td>
      <td>13.62</td>
      <td>0.0</td>
      <td>0.00</td>
      <td>0.0</td>
      <td>5.00</td>
      <td>49.0</td>
    </tr>
  </tbody>
</table>
</div>
We based on informations about 8000 people in 16-59 age with avg listening time at 2,5h per day whose listen minumum 1 song per day.
if we will look at the dashborad we can se 26% on churn rate 26% what is really high churn usually is below 7%. Churn rate isn't really debends of gender because parts of the donut chart are quite eqqual. It similar in device chart it visial mobile users are more used to churn 1% point



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
  
  




