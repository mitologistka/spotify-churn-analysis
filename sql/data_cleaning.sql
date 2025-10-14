SELECT * FROM spotify_users;

# Check if age values are all integers and within a reasonable range
SELECT DISTINCT age FROM spotify_users ORDER BY age;

SELECT * FROM spotify_users 
WHERE age IS NULL;

SELECT *
FROM (
    SELECT *, ROW_NUMBER() OVER (
        PARTITION BY gender, age, country, subscription_type, listening_time, 
                     songs_played_per_day, skip_rate, device_type, 
                     ads_listened_per_week, offline_listening, is_churned
    ) AS row_num
    FROM spotify_users
)
WHERE row_num > 1;

# There is no duplicates 

SELECT * FROM spotify_users 
WHERE gender IS NULL 
   OR age IS NULL 
   OR country IS NULL 
   OR subscription_type IS NULL 
   OR listening_time IS NULL 
   OR songs_played_per_day IS NULL 
   OR skip_rate IS NULL 
   OR device_type IS NULL 
   OR ads_listened_per_week IS NULL 
   OR offline_listening IS NULL 
   OR is_churned IS NULL;

# There is no null values

# Check for inconsistent country names
SELECT DISTINCT country 
FROM spotify_users 
ORDER BY country;

# Create index to searching data faster
CREATE INDEX idx_is_churned ON spotify_users(is_churned);
CREATE INDEX idx_country ON spotify_users(country);

EXPLAIN SELECT * FROM spotify_users WHERE country = 'US';
EXPLAIN SELECT * FROM spotify_users WHERE is_churned = TRUE;



