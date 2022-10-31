!!!!!!!!!!!!!!!!!!!! 1 !!!!!!!!!!!!!!!!!!!!!!
SELECT year_game, SUM(points) FROM statistic group by year_game order by year_game ASC;

!!!!!!!!!!!!!!!!!!!! 2 !!!!!!!!!!!!!!!!!!!!!!
WITH ctePoints AS
(
	SELECT year_game, SUM(points) FROM statistic GROUP BY year_game ORDER BY year_game ASC
)

SELECT * FROM ctePoints ORDER BY year_game ASC

!!!!!!!!!!!!!!!!!!!! 3 !!!!!!!!!!!!!!!!!!!!!!
WITH ctePoints AS (
    SELECT year_game, SUM(points) current_year_points FROM statistic GROUP BY year_game
)

SELECT year_game, current_year_points,
    LAG(current_year_points, 1) OVER (
        ORDER BY year_game ASC
    ) last_year_points
FROM ctePoints;
