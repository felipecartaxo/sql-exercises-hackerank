-- Query all columns for all American cities in the CITY table with populations larger than 100000. The CountryCode for America is USA
SELECT
    *
FROM
    City
WHERE
    countrycode = 'USA'
    AND population > 100000;

-- Query the NAME field for all American cities in the CITY table with populations larger than 120000. The CountryCode for America is USA
SELECT
    name
FROM
    City
WHERE
    countrycode = 'USA'
    AND population > 120000;

-- Query all columns (attributes) for every row in the CITY table
SELECT
    *
FROM
    City;

-- Query all columns for a city in CITY with the ID 1661
SELECT
    *
FROM
    City
WHERE
    id = 1661;

-- Query all attributes of every Japanese city in the CITY table. The COUNTRYCODE for Japan is JPN
SELECT
    *
FROM
    City
WHERE
    countrycode = 'JPN';

-- Query the names of all the Japanese cities in the CITY table. The COUNTRYCODE for Japan is JPN
SELECT
    name
FROM
    City
WHERE
    countrycode = 'JPN';

-- Query a list of CITY and STATE from the STATION table
SELECT
    city,
    state
FROM
    Station;

-- Query a list of CITY names from STATION for cities that have an even ID number. Print the results in any order, but exclude duplicates from the answer
SELECT
    DISTINCT city
FROM
    Station
WHERE
    id % 2 = 0;

-- Find the difference between the total number of CITY entries in the table and the number of distinct CITY entries in the table
SELECT
    (count(city) - count(DISTINCT city))
FROM
    Station;

-- Query the two cities in STATION with the shortest and longest CITY names, as well as their respective lengths (i.e.: number of characters in the name). If there is more than one smallest or largest city, choose the one that comes first when ordered alphabetically
(
    SELECT
        city,
        length(city)
    FROM
        Station
    ORDER BY
        length(city),
        city
    LIMIT
        1
)
UNION
(
    SELECT
        city,
        length(city)
    FROM
        Station
    ORDER BY
        length(city) DESC
    LIMIT
        1
);

-- Query the list of CITY names starting with vowels (i.e., a, e, i, o, or u) from STATION. Your result cannot contain duplicates
SELECT
    DISTINCT city
FROM
    Station
WHERE
    city LIKE 'a%'
    OR city LIKE 'e%'
    OR city LIKE 'i%'
    OR city LIKE 'o%'
    OR city LIKE 'u%';

-- Query the list of CITY names ending with vowels (a, e, i, o, u) from STATION. Your result cannot contain duplicates
SELECT
    DISTINCT city
FROM
    Station
WHERE
    city LIKE '%a'
    OR city LIKE '%e'
    OR city LIKE '%i'
    OR city LIKE '%o'
    OR city LIKE '%u';

-- Query the list of CITY names from STATION which have vowels (i.e., a, e, i, o, and u) as both their first and last characters. Your result cannot contain duplicates.
SELECT
    DISTINCT city
FROM
    Station
WHERE
    left(city, 1) IN ('a', 'e', 'i', 'o', 'u', 'A', 'E', 'I', 'O', 'U')
    AND right(city, 1) IN ('a', 'e', 'i', 'o', 'u', 'A', 'E', 'I', 'O', 'U');

-- Query the list of CITY names from STATION that do not start with vowels. Your result cannot contain duplicates
SELECT
    DISTINCT city
FROM
    Station
WHERE
    left(city, 1) NOT IN ('a', 'e', 'i', 'o', 'u', 'A', 'E', 'I', 'O', 'U');

-- Query the list of CITY names from STATION that do not end with vowels. Your result cannot contain duplicates
SELECT
    DISTINCT city
FROM
    Station
WHERE
    right(city, 1) NOT IN ('a', 'e', 'i', 'o', 'u', 'A', 'E', 'I', 'O', 'U');

-- Query the list of CITY names from STATION that either do not start with vowels or do not end with vowels. Your result cannot contain duplicates
SELECT
    DISTINCT city
FROM
    Station
WHERE
    left(city, 1) NOT IN ('a', 'e', 'i', 'o', 'u', 'A', 'E', 'I', 'O', 'U')
    OR right(city, 1) NOT IN ('a', 'e', 'i', 'o', 'u', 'A', 'E', 'I', 'O', 'U');

-- Query the list of CITY names from STATION that do not start with vowels and do not end with vowels. Your result cannot contain duplicates
SELECT
    DISTINCT city
FROM
    Station
WHERE
    left(city, 1) NOT IN ('a', 'e', 'i', 'o', 'u', 'A', 'E', 'I', 'O', 'U')
    AND right(city, 1) NOT IN ('a', 'e', 'i', 'o', 'u', 'A', 'E', 'I', 'O', 'U');

-- Query the Name of any student in STUDENTS who scored higher than 75 Marks. Order your output by the last three characters of each name. If two or more students both have names ending in the same last three characters (i.e.: Bobby, Robby, etc.), secondary sort them by ascending ID
SELECT
    name
FROM
    Students
WHERE
    marks > 75
ORDER BY
    right(name, 3),
    id;

-- Write a query that prints a list of employee names (i.e.: the name attribute) from the Employee table in alphabetical order
SELECT
    name
FROM
    Employee
ORDER BY
    name;

-- Write a query that prints a list of employee names (i.e.: the name attribute) for employees in Employee having a salary greater than 2000 per month who have been employees for less than 10 months. Sort your result by ascending employee_id
SELECT
    name
FROM
    Employee
WHERE
    salary > 2000
    AND months < 10
ORDER BY
    employee_id;

/* Write a query identifying the type of each record in the TRIANGLES table using its three side lengths. Output one of the following statements for each record in the table:
 
 Equilateral: It's a triangle with  sides of equal length.
 Isosceles: It's a triangle with  sides of equal length.
 Scalene: It's a triangle with  sides of differing lengths.
 Not A Triangle: The given values of A, B, and C don't form a triangle. */
SELECT
    CASE
        WHEN a + b <= c
        OR b + c <= a
        OR a + c <= b THEN 'Not A Triangle'
        WHEN a = b
        AND b = c
        AND c = a THEN 'Equilateral'
        WHEN a = b
        OR b = c
        OR c = a THEN 'Isosceles'
        WHEN a != b
        AND b != c
        AND c != a THEN 'Scalene'
        ELSE 'Unknown'
    END AS TriangleType
FROM
    triangles;

-- Query a count of the number of cities in CITY having a Population larger than 100000
SELECT
    count(name)
FROM
    City
WHERE
    population > 100000;

-- Query a count of the number of cities in CITY having a Population larger than 100000.
SELECT
    count(c.name)
FROM
    City c
WHERE
    population > 100000;

-- Query the total population of all cities in CITY where District is California.
SELECT
    SUM(c.population)
FROM
    city c
WHERE
    c.district LIKE 'California';

-- Query the average population of all cities in CITY where District is California.
SELECT
    AVG(c.population)
FROM
    City c
WHERE
    c.district LIKE 'California';

-- Query the average population for all cities in CITY, rounded down to the nearest integer.
SELECT
    round(avg(c.population), 0)
FROM
    city c;

-- Query the sum of the populations for all Japanese cities in CITY. The COUNTRYCODE for Japan is JPN.
SELECT
    SUM(c.population)
FROM
    City c
WHERE
    c.countrycode LIKE 'JPN';

-- Query the difference between the maximum and minimum populations in CITY.
SELECT
    (MAX(c.population) - MIN(c.population))
FROM
    City c;

-- Samantha was tasked with calculating the average monthly salaries for all employees in the EMPLOYEES table, but did not realize her keyboard's  key was broken until after completing the calculation. She wants your help finding the difference between her miscalculation (using salaries with any zeros removed), and the actual average salary. Write a query calculating the amount of error (i.e.:  average monthly salaries), and round it up to the next integer.
SELECT
    round(avg(e.salary)) - round(avg(REPLACE(e.salary, '0', '')))
FROM
    employees e;