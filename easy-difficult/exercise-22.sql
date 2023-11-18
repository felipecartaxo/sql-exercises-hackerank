-- Query a count of the number of cities in CITY having a Population larger than 100000
SELECT
    count(name)
FROM
    City
WHERE
    population > 100000;