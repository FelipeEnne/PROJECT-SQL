-- Using Null

-- 1)
-- List the films where the yr is 1962 [Show id, title]
SELECT id, title
 FROM movie
 WHERE yr=1962

--  Answer 


-- 2)
-- Give year of 'Citizen Kane'.

--  Answer  
SELECT yr
 FROM movie
 WHERE title= 'Citizen Kane'


-- 3)
-- List all of the Star Trek movies, include the id, title and yr (all of these movies include the words Star Trek in the title). 
--Order results by year.

--  Answer  
SELECT id, title, yr 
 FROM movie
WHERE title LIKE 'Star Trek%'
ORDER BY yr



-- 4)
--  What id number does the actor 'Glenn Close' have?

-- Answer  
SELECT id 
 FROM actor
 WHERE name = 'Glenn Close' 



-- 5)
-- What is the id of the film 'Casablanca'

--  Answer  
SELECT id 
 FROM movie
 WHERE title = 'Casablanca' 



-- 6)
-- Obtain the cast list for 'Casablanca'.

--  Answer  
SELECT name
 FROM actor JOIN casting ON (id=actorid)
 WHERE movieid= '11768' 


-- 7)
-- Obtain the cast list for the film 'Alien'

--  Answer  
SELECT name
 FROM actor JOIN casting ON (id=actorid)
 WHERE movieid= (SELECT id 
                 FROM movie
                 WHERE title = 'Alien' )



-- 8)
-- List the films in which 'Harrison Ford' has appeared

--  Answer  
SELECT title 
 FROM casting 
  JOIN actor ON actorid = actor.id 
  JOIN movie ON movieid = movie.id
 WHERE name = 'Harrison Ford'



-- 9)
-- List the films where 'Harrison Ford' has appeared - but not in the starring role. 
-- [Note: the ord field of casting gives the position of the actor. 
-- If ord=1 then this actor is in the starring role]

--  Answer  
SELECT title 
 FROM casting 
  JOIN actor ON actorid = actor.id 
  JOIN movie ON movieid = movie.id
 WHERE name = 'Harrison Ford' AND ord <> 1

-- 10)
-- List the films together with the leading star for all 1962 films.

--  Answer  
SELECT DISTINCT title, name
 FROM casting 
  JOIN actor ON actorid = actor.id 
  JOIN movie ON movieid = movie.id
 WHERE yr = 1962 AND ord = 1

