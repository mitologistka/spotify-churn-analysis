import pandas as pd
from sqlalchemy import create_engine, Boolean, Integer, Float, String
from config import DB  

df = pd.read_csv("data/spotify_churn_dataset.csv")

df['offline_listening'] = df['offline_listening'].astype(bool)
df['age'] = df['age'].astype(int)
df['gender'] = df['gender'].astype(str)
df['is_churned'] = df['is_churned'].astype(bool)



url = f"postgresql://{DB['user']}:{DB['password']}@{DB['host']}:{DB['port']}/{DB['database']}"
engine = create_engine(url)

with engine.begin() as conn:
    df.to_sql('spotify_users', conn, if_exists='append', index=False)