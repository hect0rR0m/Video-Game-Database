CREATE DATABASE IF NOT EXISTS VideoGameDB;
USE VideoGameDB;

CREATE TABLE Franchises (
    FranchiseID     INT             AUTO_INCREMENT,
    FranchiseName   VARCHAR(100)    NOT NULL,

    PRIMARY KEY (FranchiseID),
    UNIQUE (FranchiseName)
);

CREATE TABLE Consoles (
    ConsoleID       INT             AUTO_INCREMENT,
    ConsoleName     VARCHAR(100)    NOT NULL,
    Manufacturer    VARCHAR(100),

    PRIMARY KEY (ConsoleID),
    UNIQUE (ConsoleName)
);

CREATE TABLE Genres ( 
    GenreID         INT             AUTO_INCREMENT,
    GenreName       VARCHAR(50)     NOT NULL,

    PRIMARY KEY (GenreID),
    UNIQUE (GenreName)
);

CREATE TABLE GameModes (
    ModeID          INT             AUTO_INCREMENT,
    ModeName        VARCHAR(50)     NOT NULL,

    PRIMARY KEY (ModeID),
    UNIQUE (ModeName)
);

CREATE TABLE Games (
    GameID          INT             AUTO_INCREMENT,
    Title           VARCHAR(255)    NOT NULL,
    AgeRating       ENUM('E', 'T', 'M', 'RP') DEFAULT 'RP',
    IGNScore        DECIMAL(3,1),
    FranchiseID     INT,
    ReleaseDate     DATE,

    PRIMARY KEY (GameID),
    CHECK (IGNScore >= 0.0 AND IGNScore <= 10.0),
    FOREIGN KEY (FranchiseID) REFERENCES Franchises(FranchiseID) ON DELETE SET NULL
);

CREATE TABLE Game_Consoles ( 
    GameID          INT,
    ConsoleID       INT,

    PRIMARY KEY (GameID, ConsoleID),
    FOREIGN KEY (GameID) REFERENCES Games(GameID) ON DELETE CASCADE,
    FOREIGN KEY (ConsoleID) REFERENCES Consoles(ConsoleID) ON DELETE CASCADE
);

CREATE TABLE Game_Genres (
    GameID          INT,
    GenreID         INT,

    PRIMARY KEY (GameID, GenreID),
    FOREIGN KEY (GameID) REFERENCES Games(GameID) ON DELETE CASCADE,
    FOREIGN KEY (GenreID) REFERENCES Genres(GenreID) ON DELETE CASCADE
);

CREATE TABLE Game_GameModes ( 
    GameID          INT,
    ModeID          INT,

    PRIMARY KEY (GameID, ModeID),
    FOREIGN KEY (GameID) REFERENCES Games(GameID) ON DELETE CASCADE,
    FOREIGN KEY (ModeID) REFERENCES GameModes(ModeID) ON DELETE CASCADE
);