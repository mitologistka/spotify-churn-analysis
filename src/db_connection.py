from sqlalchemy import create_engine
import pandas as pd
from config import DB

def get_engine():
    url = f"postgresql://{DB['user']}:{DB['password']}@{DB['host']}:{DB['port']}/{DB['database']}"
    return create_engine(url)


def load_view(view_name):
    engine = get_engine()
    query = f"SELECT * FROM {view_name};"
    return pd.read_sql_query(query, engine)
