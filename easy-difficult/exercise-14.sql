-- Query the list of CITY names from STATION that do not start with vowels. Your result cannot contain duplicates

SELECT
    DISTINCT city
FROM
    Station
WHERE
    left(city, 1) NOT IN ('a', 'e', 'i', 'o', 'u', 'A', 'E', 'I', 'O', 'U');