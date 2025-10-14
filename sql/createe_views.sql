CREATE OR REPLACE VIEW user_metrics AS
WITH max_values AS (
    SELECT 
        MAX(ads_listened_per_week) AS max_ads,
        MAX(listening_time) AS max_listening
    FROM spotify_users
)
SELECT 
    u.user_id,
    u.gender,
    u.age, 
    u.country,
    u.subscription_type,
    u.listening_time,
    u.songs_played_per_day,
    u.skip_rate,
    u.device_type,
    u.ads_listened_per_week,
    u.offline_listening,
    u.is_churned,
    CASE 
        WHEN u.songs_played_per_day = 0 THEN NULL
        ELSE u.listening_time::float / u.songs_played_per_day
    END AS avg_time_per_song,
    (u.ads_listened_per_week::float * 60 / NULLIF(u.listening_time * 7, 0)) AS ads_per_hour,
    ROUND(
        (
            0.6 * u.skip_rate
            + 0.3 * (u.ads_listened_per_week::float / mv.max_ads)
            - 0.1 * (u.listening_time::float / mv.max_listening)
        )::numeric,
        3
    ) AS churn_score
FROM spotify_users u
CROSS JOIN max_values mv;

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
