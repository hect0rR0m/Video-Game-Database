USE VideoGameDB;

SELECT Title, AgeRating, IGNScore, ReleaseDate
FROM Games 
WHERE Title LIKE '%Halo%';

SELECT g.Title, g.AgeRating, g.ReleaseDate
FROM Games g
JOIN Game_Genres gg ON g.GameID = gg.GameID
JOIN Genres gen ON gg.GenreID = gen.GenreID
WHERE gen.GenreName = 'RPG';

SELECT 
    g.Title, 
    g.AgeRating, 
    g.IGNScore,
    f.FranchiseName,
    GROUP_CONCAT(DISTINCT c.ConsoleName SEPARATOR ', ') AS SupportedConsoles,
    GROUP_CONCAT(DISTINCT gen.GenreName SEPARATOR ', ') AS Genres,
    GROUP_CONCAT(DISTINCT m.ModeName SEPARATOR ', ') AS GameModes
FROM Games g
LEFT JOIN Franchises f ON g.FranchiseID = f.FranchiseID
LEFT JOIN Game_Consoles gc ON g.GameID = gc.GameID
LEFT JOIN Consoles c ON gc.ConsoleID = c.ConsoleID
LEFT JOIN Game_Genres gg ON g.GameID = gg.GameID
LEFT JOIN Genres gen ON gg.GenreID = gen.GenreID
LEFT JOIN Game_GameModes gm ON g.GameID = gm.GameID
LEFT JOIN GameModes m ON gm.ModeID = m.ModeID
WHERE g.GameID = 5
GROUP BY g.GameID; 

SELECT Title, ReleaseDate 
FROM Games 
WHERE FranchiseID = (SELECT FranchiseID FROM Games WHERE Title = 'Super Mario 64')
AND Title != 'Super Mario 64';

SELECT
	Title,
    AgeRating,
    IGNScore
FROM Games g
WHERE IGNScore >= 9.5
ORDER BY IGNScore DESC;

SELECT
	Title,
    AgeRating,
    IGNScore
FROM Games
WHERE AgeRating = 'T'
ORDER BY Title;

SELECT
	Consoles.ConsoleName,
    COUNT(Game_Consoles.GameID) AS NumberOfGames
FROM Consoles
LEFT JOIN Game_Consoles ON Consoles.ConsoleID = Game_Consoles.ConsoleID
GROUP BY Consoles.ConsoleName;

SELECT
	Manufacturer,
    ConsoleName
FROM Consoles
ORDER BY Manufacturer;

SELECT
	Games.Title,
    Franchises.FranchiseName
FROM Games
JOIN Franchises 
ON Games.FranchiseID = Franchises.FranchiseID
WHERE Franchises.FranchiseName = 'Halo';

SELECT
	Title,
    AgeRating,
    IGNScore
FROM Games
WHERE IGNScore = (
	SELECT MAX(IGNScore)
    FROM Games
);