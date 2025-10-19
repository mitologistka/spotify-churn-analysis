CREATE OR REPLACE VIEW user_metrics AS
SELECT 
    user_id,
    gender,
    age, 
    country,
    subscription_type,
    listening_time,
    songs_played_per_day,
    skip_rate,
    device_type,
    ads_listened_per_week,
    offline_listening,
    is_churned
FROM spotify_users;

SELECT * FROM spotify_users;

CREATE OR REPLACE VIEW country_churn_stats AS
SELECT 
    country,
    count(*) as users,
    ROUND( AVG(CASE WHEN is_churned THEN 1 ELSE 0 END) * 100, 2) AS churn_rate,
    AVG(listening_time) AS avg_listening_time,
    AVG(skip_rate) AS avg_skip_rate
FROM spotify_users
GROUP BY country;

SELECT * FROM spotify_users;

CREATE OR REPLACE VIEW subscription_churn_stats AS
SELECT 
    subscription_type,
    COUNT(*) as total_users,
    AVG(ads_listened_per_week) as avg_ads_per_week,
    AVG(skip_rate) as avg_skip_rate,
    AVG(listening_time) AS avg_listening_time,
    AVG(songs_played_per_day) AS avg_songs_played,
    ROUND(AVG(CASE WHEN is_churned THEN 1 ELSE 0 END) * 100, 2) AS churn_rate
FROM spotify_users
GROUP BY subscription_type
ORDER BY churn_rate DESC;

# device_churn_stats
CREATE OR REPLACE VIEW device_churn_stats AS
SELECT 
    device_type,
    AVG(skip_rate) AS avg_skip_rate,
    AVG(listening_time) AS avg_listening_time,
    AVG(songs_played_per_day) AS avg_songs_played,
    ROUND(AVG(CASE WHEN is_churned THEN 1 ELSE 0 END) * 100, 2) AS churn_rate
FROM spotify_users
GROUP BY device_type
ORDER BY churn_rate DESC;

SELECT 
    device_type,
    COUNT(*) as total_users
FROM spotify_users
GROUP BY device_type;   