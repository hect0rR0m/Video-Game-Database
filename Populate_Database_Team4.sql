USE VideoGameDB;

INSERT INTO Franchises (FranchiseName) VALUES 
('Halo'), ('Super Mario'), ('Final Fantasy'), ('The Legend of Zelda'), ('Super Smash Bros.'),
('God of War'), ('Pokemon'), ('Call of Duty'), ('Grand Theft Auto'), ('Sonic the Hedgehog');

INSERT INTO Consoles (ConsoleName, Manufacturer) VALUES 
('Xbox', 'Microsoft'), ('PlayStation 1', 'Sony'), ('GameCube', 'Nintendo'), 
('Nintendo Entertainment System', 'Nintendo'), ('Nintendo 64', 'Nintendo'),
('PlayStation 2', 'Sony'), ('Xbox 360', 'Microsoft'), ('Wii', 'Nintendo'),
('Game Boy Advance', 'Nintendo');

INSERT INTO Genres (GenreName) VALUES 
('Platformer'), ('Shooter'), ('RPG'), ('Action'), ('Adventure'), ('Fighting'), ('Open World');

INSERT INTO GameModes (ModeName) VALUES 
('Single-player'), ('Local Multiplayer'), ('Online Multiplayer'), ('Co-op');

INSERT INTO Games (Title, AgeRating, IGNScore, FranchiseID, ReleaseDate) VALUES 
('Halo: Combat Evolved',                  'M', 9.7, 1, '2001-11-15'),
('Super Mario 64',                        'E', 9.8, 2, '1996-06-23'),
('Final Fantasy VII',                     'T', 9.5, 3, '1997-01-31'),
('The Legend of Zelda: Ocarina of Time',  'E', 10.0, 4, '1998-11-21'),
('Super Smash Bros. Melee',               'T', 9.6, 5, '2001-11-21'),
('God of War',                            'M', 9.8, 6, '2018-04-20'),
('Pokemon FireRed',                       'E', 8.5, 7, '2004-01-29'),
('Call of Duty 4: Modern Warfare',        'M', 9.4, 8, '2007-11-05'),
('Grand Theft Auto: San Andreas',         'M', 9.9, 9, '2004-10-26'),
('Sonic the Hedgehog 2',                  'E', 8.7, 10, '1992-11-24');

INSERT INTO Game_Consoles (GameID, ConsoleID) VALUES 
(1, 1), (2, 5), (3, 2), (4, 5), (5, 3), (6, 7), (7, 9), (8, 7), (8, 6), (9, 6), (10, 4);  

INSERT INTO Game_Genres (GameID, GenreID) VALUES 
(1, 2), (2, 1), (3, 3), (4, 4), (4, 5), (5, 6), (5, 4), (6, 4), (6, 5), (7, 3), (8, 2), (9, 7), (9, 4), (10, 1);

INSERT INTO Game_GameModes (GameID, ModeID) VALUES 
(1, 1), (1, 2), (1, 4), (2, 1), (3, 1), (4, 1), (5, 1), (5, 2), (6, 1), (7, 1), (8, 1), (8, 2), (8, 3), (9, 1), (10, 1), (10, 2);  