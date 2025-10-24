SELECT * FROM spotify_users LIMIT 10;

# Check if age values are all integers and within a reasonable range
SELECT 
    MIN(age) AS min_age,
    MAX(age) AS max_age,
    ROUND(AVG(age),2) AS avg_age,
    ROUND(STDDEV(age),2) AS std_age
FROM spotify_users;


# Check for duplicate records
SELECT *
FROM (
    SELECT *, ROW_NUMBER() OVER (
        PARTITION BY gender, age, country, subscription_type, listening_time, 
                     songs_played_per_day, skip_rate, device_type, 
                     ads_listened_per_week, offline_listening, is_churned
    ) AS row_num
    FROM spotify_users
) AS dups
WHERE row_num > 1;

# There is no duplicates 

SELECT * FROM spotify_users
WHERE COALESCE(
    gender::text, age::text, country, subscription_type,
    listening_time::text, songs_played_per_day::text,
    skip_rate::text, device_type, ads_listened_per_week::text,
    offline_listening::text, is_churned::text
) IS NULL;

# There is no null values

# Check for inconsistent country names
SELECT DISTINCT country 
FROM spotify_users 
ORDER BY country;

SELECT country, COUNT(*) AS users
FROM spotify_users
GROUP BY country
ORDER BY users DESC;

# Summary statistics

SELECT 
    COUNT(*) AS total_users,
    SUM(is_churned::int) AS churned_users,
    ROUND(100.0 * SUM(is_churned::int) / COUNT(*), 2) AS churn_rate_percent
FROM spotify_users;

# insightful statistics by subscription type

SELECT subscription_type,
       ROUND(AVG(songs_played_per_day)::numeric, 2) AS avg_songs,
       ROUND(AVG(skip_rate)::numeric, 2) AS avg_skip_rate,
       ROUND(AVG(is_churned::int)::numeric * 100, 2) AS churn_rate
FROM spotify_users
GROUP BY subscription_type
ORDER BY churn_rate DESC;


SELECT
    MIN(skip_rate) AS min_skip_rate, MAX(skip_rate) AS max_skip_rate,
    MIN(songs_played_per_day) AS min_songs_played_per_day, MAX(songs_played_per_day) AS max_songs_played_per_day,
    MIN(listening_time) AS min_listening_time, MAX(listening_time) AS max_listening_time,
    MIN(ads_listened_per_week) AS min_ads_listened_per_week, MAX(ads_listened_per_week) AS max_ads_listened_per_week
FROM spotify_users;

SELECT skip_rate


# Create index to searching data faster
CREATE INDEX idx_is_churned ON spotify_users(is_churned);
CREATE INDEX idx_country ON spotify_users(country);

EXPLAIN SELECT * FROM spotify_users WHERE country = 'US';
EXPLAIN SELECT * FROM spotify_users WHERE is_churned = TRUE;



