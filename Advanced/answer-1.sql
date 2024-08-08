/*
Identify the Top-Selling Artists

Features to display:
artist_name, genre, concert_revenue, number_of_members, revenue_per_member
*/

-- Query to ranked each artist and calculate revenue per member
WITH ranked_artists AS (
    SELECT
        ROW_NUMBER() OVER(
            PARTITION BY genre
            ORDER BY (concert_revenue / number_of_members) DESC
        ) AS ranked_artists,
        artist_name,
        genre,
        concert_revenue,
        number_of_members,
        (concert_revenue / number_of_members) AS revenue_per_member
    FROM
        concerts
)
-- Extract the top reveneue-generating artists for each genre
SELECT
    artist_name,
    genre,
    concert_revenue,
    number_of_members,
    revenue_per_member
FROM
    ranked_artists
WHERE  
    ranked_artists = 1
ORDER BY
    revenue_per_member DESC;

/*
Interpreting the results:
1. Beyonce earned a staggering $750,000 in revenue with 1 member, resulting in a revenue
per member of $750,000. She holds the top spot in the R&B genre.