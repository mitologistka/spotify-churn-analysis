# Spotify Churn Analysis

## Introduction 
The dataset I use is [Spotify Analysis Dataset 2025](https://www.kaggle.com/datasets/nabihazahid/spotify-dataset-for-churn-analysis/data) from Kaggle. This dataset is **synthetically generated**. **Spotify** is a streaming platform where users can listen to music with limitations or get a premium subscription for unlimited access.


##  Who usually churn? Analysis

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

The analysis is based on data from **8 000** individuals aged 16–59, with an average daily listening time of 2,5 hours (154 min), assuming at least one song played per day.

The dashboard indicates a churn rate of approximately **26%**, which is significantly higher than typical benchmarks for subscription-based businesses (annual churn rates usually range around 5–7%).

![alt text](https://github.com/mitologistka/spotify-churn-analysis/blob/main/img/dashboard.png)

Segment analysis reveals that gender has negligible impact on churn; the donut chart segments are nearly equal. Similarly, device type differences are minimal (1–2%), suggesting that neither demographic characteristics nor access method are major churn drivers in this dataset.

Geographic analysis shows that **Pakistan** (PK) exhibits the highest churn rate.

When analyzing subscription types, the **Family plan** stands out with the highest churn. Within this plan, two distinct age clusters—around 18 years old and 50+ years old—show the greatest churn risk. These users also have the lowest listening times, indicating limited app engagement. This pattern suggests that some users may have subscribed due to promotions rather than long-term interest. In multi-member Family plans (up to six users), low engagement is likely diluted across members, contributing further to elevated churn.

Key insight:
- Primary churn driver is low engagement (listening time), not gender, device type, or geography
- The most vulnerable segment consists of secondary users on Family plans, particularly those aged around 18 and 50+, who exhibit minimal app usage.


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
`ads per listening hour = (ads listened per week * 60) / (7 * listening time)`



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
 
## Step 7: Analysis Summary
The analysis reveals that Spotify’s churn is primarily driven by **low engagement** rather than demographic factors or device type. 
Secondary users on multi-member (Family) plans, particularly users around 18 and 50+ years old, are the most vulnerable segment. 
Business recommendations include targeting these users with **personalized engagement strategies**, such as tailored playlists, notifications, or incentives to increase app usage and reduce churn.
This summary demonstrates the full analytics workflow from data import, cleaning, EDA, feature engineering, modeling, to actionable business insights, highlighting skills relevant for a Data Analyst role.

  
  




