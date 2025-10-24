# Spotify Churn Analysis

## Step 1 Configuratioon and enviroment
- Download all librarys for python using `pip install` pandas, numpy, sqlalchemy, psycopg2-binary, seaborn, matplotlib, plotly, scikit-learn, scipy, streamlit, python-dotenv
- Create conteiner on docker for datanase server
- Prepare files for connection in python

## Step 2 Import
- Create table in PostgreSQK
- Import all data from csv file using sqlalchemy - create_engine

```
with engine.begin() as conn:
    df.to_sql('spotify_users', conn, if_exists='append', index=False)
```

## Step 3 Cleaning data
- Check age value if it isn't out of range and in int type
- CHeck for duplicates
- Check for nul lvalues
- Create indexes for faster searching
```
CREATE INDEX idx_is_churned ON spotify_users(is_churned);
```

## Feature engineering w SQL
- Create views
- add base calculations columns
$$
\text{ads\_per\_hour} = \frac{\text{ads\_listened\_per\_week} \times 60}{7 \times \text{listening\_time}}
$$
