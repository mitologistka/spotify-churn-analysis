CREATE TABLE IF NOT EXISTS spotify_users (
    user_id VARCHAR PRIMARY KEY,
    gender VARCHAR,
    age INT,
    country VARCHAR,
    subscription_type VARCHAR,
    listening_time INT,
    songs_played_per_day INT,
    skip_rate FLOAT,
    device_type VARCHAR,
    ads_listened_per_week INT,
    offline_listening BOOLEAN,
    is_churned BOOLEAN
);