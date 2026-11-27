USE steam;

-- 1
SELECT * FROM juegos;

-- 2
SELECT DISTINCT Genre FROM juegos;

-- 3
SELECT * FROM juegos 
WHERE PlatformLinux = 'True' AND PlatformWindows = 'False' AND PlatformMac = 'False';

-- 4
SELECT * FROM juegos 
WHERE Genre LIKE '%Rol%' OR Genre LIKE '%RPG%' 
ORDER BY Metacritic DESC;

-- 5
SELECT * FROM juegos 
WHERE (SupportedLanguages LIKE '%Spanish%' OR SupportedLanguages LIKE '%Español%')
  AND SupportedLanguages NOT LIKE '%French%' 
  AND SupportedLanguages NOT LIKE '%Francés%';

-- 6
SELECT Nombre, PriceInitial, PriceFinal, (PriceInitial - PriceFinal) AS DiferenciaPrecio 
FROM juegos;

-- 7
SELECT COUNT(*) AS TotalSigloPasado 
FROM juegos 
WHERE CAST(RIGHT(ReleaseDate, 4) AS UNSIGNED) BETWEEN 1900 AND 1999;

-- 8
SELECT * FROM juegos 
WHERE Nombre LIKE '%N' OR Nombre LIKE '%O';

-- 9
SELECT * FROM juegos 
WHERE Nombre LIKE 'A%' AND ControllerSupport = 'True';

-- 10
SELECT * FROM juegos 
WHERE CAST(RIGHT(ReleaseDate, 4) AS UNSIGNED) BETWEEN 2000 AND 2010;

-- 11
SELECT * FROM juegos 
WHERE Nombre LIKE '%Final Fantasy%';

-- 12
SELECT * FROM juegos 
WHERE (Genre LIKE '%Sports%' OR Genre LIKE '%Deportes%') AND DeveloperCount > 3;

-- 13
SELECT Category, COUNT(*) AS TotalJuegos 
FROM juegos 
GROUP BY Category;

-- 14
SELECT RIGHT(ReleaseDate, 4) AS Anio, COUNT(*) AS TotalJuegos 
FROM juegos 
GROUP BY Anio 
ORDER BY Anio;

-- 15
SELECT RIGHT(ReleaseDate, 4) AS Anio, COUNT(*) AS TotalJuegos, AVG(Metacritic) AS MediaNota 
FROM juegos 
WHERE Metacritic > 0
GROUP BY Anio 
HAVING AVG(Metacritic) BETWEEN 60 AND 80;

-- 16
SELECT Genre, MAX(Metacritic) AS NotaMaxima, MIN(Metacritic) AS NotaMinima, AVG(Metacritic) AS NotaMedia 
FROM juegos 
GROUP BY Genre;

-- 17
SELECT * FROM juegos 
WHERE ReleaseDate LIKE '%2012%' 
ORDER BY Metacritic DESC 
LIMIT 10;

-- 18
SELECT * FROM juegos 
WHERE Category LIKE '%Single%' OR Genre LIKE '%Single%' 
ORDER BY STR_TO_DATE(ReleaseDate, '%b %d %Y') DESC, ReleaseDate DESC 
LIMIT 10;

-- 19
SELECT AVG(Metacritic) AS MediaMayores18 
FROM juegos 
WHERE RequiredAge >= 18 AND Metacritic > 0;

-- 20
SELECT RequiredAge, COUNT(*) AS TotalJuegos 
FROM juegos 
GROUP BY RequiredAge 
ORDER BY RequiredAge DESC;

-- 21
SELECT RIGHT(ReleaseDate, 4) AS Anio, COUNT(*) AS TotalJuegos 
FROM juegos 
GROUP BY Anio 
HAVING COUNT(*) < 300;

-- 22
SELECT * FROM juegos 
WHERE PlatformMac = 'True' AND PlatformWindows = 'False';

-- 23
SELECT * FROM juegos 
WHERE PriceFinal > PriceInitial;

-- 24
SELECT * FROM juegos 
WHERE PriceCurrency <> 'USD';

-- 25
SELECT * FROM juegos 
WHERE Metacritic > 0 AND Metacritic < 50;

-- 26
SELECT * FROM juegos 
ORDER BY DLCCount DESC 
LIMIT 15;

-- 27
SELECT * FROM juegos 
WHERE TRIM(SupportedLanguages) IN ('English', 'Inglés', "['English']");

-- 28
SELECT LOWER(Nombre) AS NombreMinuscula, UPPER(Website) AS WebMayuscula 
FROM juegos 
WHERE Genre LIKE '%Action%' OR Genre LIKE '%Acción%' OR Genre LIKE '%Casual%';

-- 29
SELECT * FROM juegos 
WHERE Genre LIKE '%Indie%' AND Metacritic > 0 
ORDER BY Metacritic DESC 
LIMIT 1;

-- 30
SELECT * FROM juegos 
WHERE Genre LIKE '%Indie%' AND Metacritic > 0 
ORDER BY Metacritic ASC 
LIMIT 1;

-- 31
SELECT * FROM juegos 
WHERE Metacritic = (SELECT MIN(Metacritic) FROM juegos WHERE Metacritic > 0);

-- 32
SELECT * FROM juegos 
WHERE Metacritic > (SELECT AVG(Metacritic) FROM juegos WHERE Metacritic > 0);

-- 33
SELECT * FROM juegos 
WHERE ReleaseDate LIKE '%2008%' 
  AND Metacritic = (SELECT MAX(Metacritic) FROM juegos WHERE ReleaseDate LIKE '%2008%');

-- 34
SELECT * FROM juegos 
WHERE PriceFinal > (SELECT AVG(PriceFinal) FROM juegos);

-- 35
SELECT * FROM juegos 
WHERE PlatformLinux = 'True' 
  AND AchievementCount = (SELECT MAX(AchievementCount) FROM juegos WHERE PlatformLinux = 'True');
