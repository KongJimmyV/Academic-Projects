
/*******************************************************************************
   Game Website Database (The Gaming Hub)
   Script: GameWebsite_MySQL.sql
   Description: Creates and populates the Game Website database.
   DB Server: MySQL
   Author: Kong Jimmy Vang
********************************************************************************/

/*******************************************************************************
   Create Database
********************************************************************************/
###DROP DATABASE IF EXISTS GameWebsite;
CREATE DATABASE IF NOT EXISTS GameWebsite;
USE GameWebsite;


/*******************************************************************************
   Drop Foreign Keys Constraints
********************************************************************************/
ALTER TABLE `User` DROP FOREIGN KEY `User_ibfk_1`;
###ALTER TABLE `DeveloperStudio` DROP FOREIGN KEY `DeveloperStudio_ibfk_1`;
ALTER TABLE `Achievement` DROP FOREIGN KEY `Achievement_ibfk_1`;
ALTER TABLE `Achievement` DROP FOREIGN KEY `Achievement_ibfk_2`;
ALTER TABLE `DEVELOPED` DROP FOREIGN KEY `DEVELOPED_ibfk_1`;
ALTER TABLE `DEVELOPED` DROP FOREIGN KEY `DEVELOPED_ibfk_2`;
ALTER TABLE `RATES` DROP FOREIGN KEY `RATES_ibfk_1`;
ALTER TABLE `RATES` DROP FOREIGN KEY `RATES_ibfk_2`;
ALTER TABLE `ACHIEVED` DROP FOREIGN KEY `ACHIEVED_ibfk_1`;
ALTER TABLE `ACHIEVED` DROP FOREIGN KEY `ACHIEVED_ibfk_2`;


/*******************************************************************************
   Drop Tables
********************************************************************************/
DROP TABLE IF EXISTS `User`;
DROP TABLE IF EXISTS `DeveloperStudio`;
DROP TABLE IF EXISTS `Game`;
DROP TABLE IF EXISTS `Achievement`;
DROP TABLE IF EXISTS `DEVELOPED`;
DROP TABLE IF EXISTS `RATES`;
DROP TABLE IF EXISTS `ACHIEVED`;


/*******************************************************************************
   Create Tables
********************************************************************************/
CREATE TABLE `User`
(
    `UserID` INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
    `Username` VARCHAR(40) CHARACTER SET UTF8MB4 NOT NULL UNIQUE,
    `EmailAddress` VARCHAR(60) CHARACTER SET UTF8MB4 NOT NULL UNIQUE,
    `Password` VARCHAR(128) CHARACTER SET UTF8MB4 NOT NULL,
    `Salt` VARCHAR(16) CHARACTER SET UTF8MB4 NOT NULL,
    `FirstName` VARCHAR(40) CHARACTER SET UTF8MB4,
    `MiddleName` VARCHAR(20) CHARACTER SET UTF8MB4,
    `LastName` VARCHAR(20) CHARACTER SET UTF8MB4,
    `AvatarImage` VARCHAR(260) CHARACTER SET UTF8MB4,
    `BirthDate` DATETIME NOT NULL,
    `UserLevel` INTEGER NOT NULL,
    `Experience` BIGINT NOT NULL,
    `StudioID` INTEGER
);

CREATE TABLE `DeveloperStudio`
(
    `StudioID` INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
    `StudioName` VARCHAR(40) CHARACTER SET UTF8MB4 NOT NULL,
    `LeaderID` INTEGER NOT NULL
);

CREATE TABLE `Game`
(
    `GameID` INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
    `GameName` VARCHAR(260) CHARACTER SET UTF8MB4 NOT NULL,
    `GameGenre` VARCHAR(120) CHARACTER SET UTF8MB4 NOT NULL,
    `GameReleaseDate` DATETIME NOT NULL,
    `GameStartFileName` VARCHAR(260) CHARACTER SET UTF8MB4 NOT NULL,
    `GameStartFileType` VARCHAR(260) CHARACTER SET UTF8MB4 NOT NULL,
    `GameDirLocation` VARCHAR(260) CHARACTER SET UTF8MB4 NOT NULL,
    `GameAgeRating` INTEGER NOT NULL
);

CREATE TABLE `Achievement`
(
    `AchievementID` INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
    `AchievementName` VARCHAR(60) CHARACTER SET UTF8MB4 NOT NULL,
    `AchievementDescription` VARCHAR(260) CHARACTER SET UTF8MB4 ,
    `AchievementImage` INTEGER,
    `GameID` INTEGER NOT NULL,
    `UserID` INTEGER
);

CREATE TABLE `DEVELOPED`
(
    `StudioID` INTEGER NOT NULL,
    `GameID` INTEGER NOT NULL,
    UNIQUE KEY(`StudioID`, `GameID`)
);

CREATE TABLE `RATES`
(
    `Rating` DOUBLE NOT NULL,
    `UserID` INTEGER NOT NULL,
    `GameID` INTEGER NOT NULL,
    UNIQUE KEY(`UserID`, `GameID`)
);


CREATE TABLE `ACHIEVED`
(
    `UserID` INTEGER NOT NULL,
    `AchievementID` INTEGER NOT NULL,
    UNIQUE KEY(`UserID`, `AchievementID`)
);

/*******************************************************************************
   Create FTS (Full-Text Search) Indexes
********************************************************************************/
ALTER TABLE `Game` ADD FULLTEXT (`GameName`, `GameGenre`);
ALTER TABLE `DeveloperStudio` ADD FULLTEXT (`StudioName`);


/*******************************************************************************
   Create Primary Key Unique Indexes
********************************************************************************/


/*******************************************************************************
   Create Foreign Keys
********************************************************************************/
ALTER TABLE `User` ADD FOREIGN KEY (`StudioID`) REFERENCES `DeveloperStudio` (`StudioID`)
    ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE `Achievement` ADD FOREIGN KEY (`GameID`) REFERENCES `Game` (`GameID`)
    ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE `Achievement` ADD FOREIGN KEY (`UserID`) REFERENCES `User` (`UserID`)
    ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE `DEVELOPED` ADD FOREIGN KEY (`StudioID`) REFERENCES `DeveloperStudio` (`StudioID`)
    ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE `DEVELOPED` ADD FOREIGN KEY (`GameID`) REFERENCES `Game` (`GameID`)
    ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE `RATES` ADD FOREIGN KEY (`UserID`) REFERENCES `User` (`UserID`)
    ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE `RATES` ADD FOREIGN KEY (`GameID`) REFERENCES `Game` (`GameID`)
    ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE `ACHIEVED` ADD FOREIGN KEY (`UserID`) REFERENCES `User` (`UserID`)
    ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE `ACHIEVED` ADD FOREIGN KEY (`AchievementID`) REFERENCES `Achievement` (`AchievementID`)
    ON DELETE NO ACTION ON UPDATE NO ACTION;

CREATE INDEX `IFK_DeveloperStudioUserId` ON `DeveloperStudio` (`StudioID`);

CREATE INDEX `IFK_AchievementGameId` ON `Achievement` (`GameID`);
CREATE INDEX `IFK_AchievementUserId` ON `Achievement` (`UserID`);

CREATE INDEX `IFK_DEVELOPED_StudioId` ON `DEVELOPED` (`StudioID`);
CREATE INDEX `IFK_DEVELOPED_GameId` ON `DEVELOPED` (`GameID`);

CREATE INDEX `IFK_RATES_UserId` ON `RATES` (`UserID`);
CREATE INDEX `IFK_RATES_GameId` ON `RATES` (`GameID`);

CREATE INDEX `IFK_ACHIEVED_UserId` ON `ACHIEVED` (`UserID`);
CREATE INDEX `IFK_ACHIEVED_AchievementId` ON `ACHIEVED` (`AchievementID`);


/*******************************************************************************
   Populate Tables 
        (For demo purposes, all pre-made users have the same password, "abcdefg")
        (All passwords are salted and encrypted with SHA-512)
        (To login, passwords should be validated with the user's login password, against the database's stored password + salt using SHA-512)
********************************************************************************/
# === Users ===
INSERT INTO `User` (`Username`, `EmailAddress`, `Password`, `Salt`, `FirstName`, `MiddleName`, `LastName`, `AvatarImage`, `BirthDate`, `UserLevel`, `Experience`, `StudioID`) 
    VALUES ('James', 'James@gaming.com', '492fbf462669fc115e86233cdbf7adadf6d38a2cca360d1e9d89f22938316b8ee338ca9aedad36ec8cca276ac3487a5737c191df6537ee0ec6034bd0d47a75dc', '51c448fc8164451a', NULL, NULL, NULL, NULL, '2000-01-15 00:00:00', 16, 100, NULL);
INSERT INTO `User` (`Username`, `EmailAddress`, `Password`, `Salt`, `FirstName`, `MiddleName`, `LastName`, `AvatarImage`, `BirthDate`, `UserLevel`, `Experience`, `StudioID`) 
    VALUES ('Jade', 'Jade@gaming.com', '4ea4751b44ba7c2757854b9eb97c92411eee173db5e227c878e74e946875ccdcbaf22d4e06d3dee555a9c0af6709a5f1ec3674932fd0b4c3afbeb45c444f90e8', '0afe917245ec8291', NULL, NULL, NULL, NULL, '2008-02-16 00:00:00', 100, 100, NULL);
INSERT INTO `User` (`Username`, `EmailAddress`, `Password`, `Salt`, `FirstName`, `MiddleName`, `LastName`, `AvatarImage`, `BirthDate`, `UserLevel`, `Experience`, `StudioID`) 
    VALUES ('Tyler', 'Tyler@gaming.com', '18706d5ae513a0eeb1a1360e491ac6692b9b922b1ce063154c1f803a4c8db349f7ef204dbc4ae47e794229bcf7b134a59712cca4ac1ca00199bb44ac95d5265a', '7f376113fce619ac', NULL, NULL, NULL, NULL, '1964-03-17 00:00:00', 85, 100, NULL);
INSERT INTO `User` (`Username`, `EmailAddress`, `Password`, `Salt`, `FirstName`, `MiddleName`, `LastName`, `AvatarImage`, `BirthDate`, `UserLevel`, `Experience`, `StudioID`) 
    VALUES ('Adam', 'Adam@gaming.com', '1dd2b807ada2cb23b8ebe1ed2dd1ec2913e4cd9c9858d4c757ff1a143fa681153a4eae00e8fe85b54caca42e4a81efc824aeb10889d7c6e0659050acf36e55ff', 'f447ccbd72b4a43f', NULL, NULL, NULL, NULL, '1996-04-18 00:00:00', 35, 100, NULL);
INSERT INTO `User` (`Username`, `EmailAddress`, `Password`, `Salt`, `FirstName`, `MiddleName`, `LastName`, `AvatarImage`, `BirthDate`, `UserLevel`, `Experience`, `StudioID`) 
    VALUES ('Max', 'Max@gaming.com', '1e8502e21ccc9c3edd263e72009a7280e0499e2648694f22470d5155c0995ac7211e1929f90d445ca54b438ad312c9e86191e5196e98dd18bf9613f5f9167c5a', '9b9b738de53cf7cd', NULL, NULL, NULL, NULL, '1995-05-19 00:00:00', 42, 100, NULL);
INSERT INTO `User` (`Username`, `EmailAddress`, `Password`, `Salt`, `FirstName`, `MiddleName`, `LastName`, `AvatarImage`, `BirthDate`, `UserLevel`, `Experience`, `StudioID`) 
    VALUES ('Julia', 'Julia@gaming.com', '8a22712d4957c8736efada53b48114487fb84669ffed2f491dacd95b1e1ff66ad3ece149bbdd60685fdc8176a2ebaf675e4b409156ee2a694977cacfce17d6d7', '2903b2fd180a9b23', NULL, NULL, NULL, NULL, '2000-01-15 00:00:00', 16, 100, NULL);
INSERT INTO `User` (`Username`, `EmailAddress`, `Password`, `Salt`, `FirstName`, `MiddleName`, `LastName`, `AvatarImage`, `BirthDate`, `UserLevel`, `Experience`, `StudioID`) 
    VALUES ('Ava', 'Ava@gaming.com', '8786d2ca66e36ec9e8f59d0887328611684e875fcc550dec1cc07604475d81d4ae10f8ed7e01a05fd5ad613298a32f135cbd87d84723265ee90ac76321d34af5', '2815706c371bea8c', NULL, NULL, NULL, NULL, '1962-02-16 00:00:00', 100, 100, NULL);
INSERT INTO `User` (`Username`, `EmailAddress`, `Password`, `Salt`, `FirstName`, `MiddleName`, `LastName`, `AvatarImage`, `BirthDate`, `UserLevel`, `Experience`, `StudioID`) 
    VALUES ('Kevin', 'Kevin@gaming.com', 'b03202359ff110a3fe3ab2580d33130cd93940258550cdb72b3f1927405010203ac0d7197e766babba498cdcbda6132c2bd8d0eb290795889a3535ae6eff1d0c', '861a98c8701046be', NULL, NULL, NULL, NULL, '1964-03-17 00:00:00', 85, 100, NULL);
INSERT INTO `User` (`Username`, `EmailAddress`, `Password`, `Salt`, `FirstName`, `MiddleName`, `LastName`, `AvatarImage`, `BirthDate`, `UserLevel`, `Experience`, `StudioID`) 
    VALUES ('Ruby', 'Ruby@gaming.com', '4203c91a533227540e71e23904a74bd7b83574dc23114bb239856a8e44c4acfcb4d60a55c61df86030d620d0397b8e1f5d5ea276cdb9a5aadf240ce14e0edce3', 'a4259ef84bc8d9a2', NULL, NULL, NULL, NULL, '1996-04-18 00:00:00', 35, 100, NULL);
INSERT INTO `User` (`Username`, `EmailAddress`, `Password`, `Salt`, `FirstName`, `MiddleName`, `LastName`, `AvatarImage`, `BirthDate`, `UserLevel`, `Experience`, `StudioID`) 
    VALUES ('Sarah', 'Sarah@gaming.com', '8d415474470f7982e0000d6de3e2251f270130eb0c9c7129eef43ebc06cee131caa4370c7e679949c258c0d68a38aec4a98abeccf7e2f922d97f84c599591281', 'cd38620e5b996e94', NULL, NULL, NULL, NULL, '1995-05-19 00:00:00', 42, 100, NULL);

# === Developer Studios ===
INSERT INTO `DeveloperStudio` (`StudioName`, `LeaderID`) 
    VALUES ('AvaStudios', 7);
UPDATE `User` SET `StudioID` = 1 WHERE `UserID` = 7;

INSERT INTO `DeveloperStudio` (`StudioName`, `LeaderID`) 
    VALUES ('KevinStudios', 8);
UPDATE `User` SET `StudioID` = 2 WHERE `UserID` = 8;

INSERT INTO `DeveloperStudio` (`StudioName`, `LeaderID`) 
    VALUES ('RubyStudios', 9);
UPDATE `User` SET `StudioID` = 3 WHERE `UserID` = 9;

INSERT INTO `DeveloperStudio` (`StudioName`, `LeaderID`) 
    VALUES ('SarahStudios', 10);
UPDATE `User` SET `StudioID` = 4 WHERE `UserID` = 10;

INSERT INTO `DeveloperStudio` (`StudioName`, `LeaderID`) 
    VALUES ('TylerStudios', 3);
UPDATE `User` SET `StudioID` = 5 WHERE `UserID` = 3;

# === Games ===
INSERT INTO `Game` (`GameName`, `GameGenre`, `GameReleaseDate`, `GameStartFileName`, `GameStartFileType`, `GameDirLocation`, `GameAgeRating`) 
    VALUES ('Artifact', '2D Survival Strategy', '2010-01-01 00:00:00', 'index', '.html', '/games/1 Artifact', 18);
INSERT INTO `DEVELOPED` (`StudioID`, `GameID`) 
    VALUES (1, 1);

INSERT INTO `Game` (`GameName`, `GameGenre`, `GameReleaseDate`, `GameStartFileName`, `GameStartFileType`, `GameDirLocation`, `GameAgeRating`) 
    VALUES ('3D Chess', 'Strategy', '2012-02-16 00:00:00', 'index', '.html', '/games/2 3D Chess', 13);
INSERT INTO `DEVELOPED` (`StudioID`, `GameID`) 
    VALUES (1, 2);

INSERT INTO `Game` (`GameName`, `GameGenre`, `GameReleaseDate`, `GameStartFileName`, `GameStartFileType`, `GameDirLocation`, `GameAgeRating`) 
    VALUES ('Dungeon Warrior', 'Action', '2016-12-25 00:00:00', 'index', '.html', '/games/3 Dungeon Warrior', 13);
INSERT INTO `DEVELOPED` (`StudioID`, `GameID`) 
    VALUES (1, 3);

INSERT INTO `Game` (`GameName`, `GameGenre`, `GameReleaseDate`, `GameStartFileName`, `GameStartFileType`, `GameDirLocation`, `GameAgeRating`) 
    VALUES ('First 3D Platformer', 'Platformer', '2016-12-25 00:00:00', 'index', '.html', '/games/4 First 3D Platformer', 13);
INSERT INTO `DEVELOPED` (`StudioID`, `GameID`) 
    VALUES (2, 4);

INSERT INTO `Game` (`GameName`, `GameGenre`, `GameReleaseDate`, `GameStartFileName`, `GameStartFileType`, `GameDirLocation`, `GameAgeRating`) 
    VALUES ('Population', 'Simulator', '2014-10-31 00:00:00', 'index', '.html', '/games/5 Population', 13);
INSERT INTO `DEVELOPED` (`StudioID`, `GameID`) 
    VALUES (3, 5);

INSERT INTO `Game` (`GameName`, `GameGenre`, `GameReleaseDate`, `GameStartFileName`, `GameStartFileType`, `GameDirLocation`, `GameAgeRating`) 
    VALUES ('Tetris', 'Block Puzzle Strategy', '2020-11-16 00:00:00', 'index', '.html', '/games/6 Tetris', 13);
INSERT INTO `DEVELOPED` (`StudioID`, `GameID`) 
    VALUES (3, 6);

INSERT INTO `Game` (`GameName`, `GameGenre`, `GameReleaseDate`, `GameStartFileName`, `GameStartFileType`, `GameDirLocation`, `GameAgeRating`) 
    VALUES ('Snake Remake', 'Puzzle Strategy', '2002-10-31 00:00:00', 'index', '.html', '/games/7 Snake Remake', 13);
INSERT INTO `DEVELOPED` (`StudioID`, `GameID`) 
    VALUES (4, 7);

INSERT INTO `Game` (`GameName`, `GameGenre`, `GameReleaseDate`, `GameStartFileName`, `GameStartFileType`, `GameDirLocation`, `GameAgeRating`) 
    VALUES ('Zigzag', 'Endless 3D', '2005-01-01 00:00:00', 'index', '.html', '/games/8 Zigzag', 13);
INSERT INTO `DEVELOPED` (`StudioID`, `GameID`) 
    VALUES (4, 8);
    
INSERT INTO `Game` (`GameName`, `GameGenre`, `GameReleaseDate`, `GameStartFileName`, `GameStartFileType`, `GameDirLocation`, `GameAgeRating`) 
    VALUES ('Puzzle Game', 'Puzzle Card Game', '2007-12-20 00:00:00', 'index', '.html', '/games/9 Puzzle Game', 13);
INSERT INTO `DEVELOPED` (`StudioID`, `GameID`) 
    VALUES (4, 9);
    
INSERT INTO `Game` (`GameName`, `GameGenre`, `GameReleaseDate`, `GameStartFileName`, `GameStartFileType`, `GameDirLocation`, `GameAgeRating`) 
    VALUES ('Oasis in the Sky', '3D First Person Game', '2009-05-22 00:00:00', 'index', '.html', '/games/10 Oasis in the Sky', 13);
INSERT INTO `DEVELOPED` (`StudioID`, `GameID`) 
    VALUES (4, 10);
    
INSERT INTO `Game` (`GameName`, `GameGenre`, `GameReleaseDate`, `GameStartFileName`, `GameStartFileType`, `GameDirLocation`, `GameAgeRating`) 
    VALUES ('Jumper', 'Endless Side Scroller', '2014-10-31 00:00:00', 'index', '.html', '/games/11 Jumper', 13);
INSERT INTO `DEVELOPED` (`StudioID`, `GameID`) 
    VALUES (4, 11);

INSERT INTO `Game` (`GameName`, `GameGenre`, `GameReleaseDate`, `GameStartFileName`, `GameStartFileType`, `GameDirLocation`, `GameAgeRating`) 
    VALUES ('2D Roguelike Game', 'Roguelike', '2018-10-31 00:00:00', 'index', '.html', '/games/12 2D Roguelike Game', 18);
INSERT INTO `DEVELOPED` (`StudioID`, `GameID`) 
    VALUES (4, 12);

INSERT INTO `Game` (`GameName`, `GameGenre`, `GameReleaseDate`, `GameStartFileName`, `GameStartFileType`, `GameDirLocation`, `GameAgeRating`) 
    VALUES ('Air Space', 'Space Shooter', '2022-10-31 00:00:00', 'index', '.html', '/games/13 Air Space', 13);
INSERT INTO `DEVELOPED` (`StudioID`, `GameID`) 
    VALUES (4, 13);

INSERT INTO `Game` (`GameName`, `GameGenre`, `GameReleaseDate`, `GameStartFileName`, `GameStartFileType`, `GameDirLocation`, `GameAgeRating`) 
    VALUES ('Space Shooter', 'Space Shooter', '2006-01-01 00:00:00', 'index', '.html', '/games/14 Space Shooter', 13);
INSERT INTO `DEVELOPED` (`StudioID`, `GameID`) 
    VALUES (5, 14);

INSERT INTO `Game` (`GameName`, `GameGenre`, `GameReleaseDate`, `GameStartFileName`, `GameStartFileType`, `GameDirLocation`, `GameAgeRating`) 
    VALUES ('Tanks!', 'Arena Battle', '2009-01-01 00:00:00', 'index', '.html', '/games/15 Tanks!', 13);
INSERT INTO `DEVELOPED` (`StudioID`, `GameID`) 
    VALUES (5, 15);

INSERT INTO `Game` (`GameName`, `GameGenre`, `GameReleaseDate`, `GameStartFileName`, `GameStartFileType`, `GameDirLocation`, `GameAgeRating`) 
    VALUES ('Nightmare Shooter', 'Horror Shooter', '2009-01-01 00:00:00', 'index', '.html', '/games/16 Nightmare Shooter', 18);
INSERT INTO `DEVELOPED` (`StudioID`, `GameID`) 
    VALUES (5, 16);

INSERT INTO `Game` (`GameName`, `GameGenre`, `GameReleaseDate`, `GameStartFileName`, `GameStartFileType`, `GameDirLocation`, `GameAgeRating`) 
    VALUES ('Red Runner', 'Endless Platformer', '2012-01-01 00:00:00', 'index', '.html', '/games/17 Red Runner', 13);
INSERT INTO `DEVELOPED` (`StudioID`, `GameID`) 
    VALUES (5, 17);
    
INSERT INTO `Game` (`GameName`, `GameGenre`, `GameReleaseDate`, `GameStartFileName`, `GameStartFileType`, `GameDirLocation`, `GameAgeRating`) 
    VALUES ('Bottom Gun', 'Endless Flyer', '2015-01-01 00:00:00', 'index', '.html', '/games/18 Bottom Gun', 13);
INSERT INTO `DEVELOPED` (`StudioID`, `GameID`) 
    VALUES (5, 18);
    
INSERT INTO `Game` (`GameName`, `GameGenre`, `GameReleaseDate`, `GameStartFileName`, `GameStartFileType`, `GameDirLocation`, `GameAgeRating`) 
    VALUES ('A Hero\'s Tale', 'Adventure Platformer', '2018-01-01 00:00:00', 'index', '.html', '/games/19 A Hero\'s Tale', 13);
INSERT INTO `DEVELOPED` (`StudioID`, `GameID`) 
    VALUES (5, 19);

INSERT INTO `Game` (`GameName`, `GameGenre`, `GameReleaseDate`, `GameStartFileName`, `GameStartFileType`, `GameDirLocation`, `GameAgeRating`) 
    VALUES ('Bug\'s Escape 3D', 'Bug Puzzle Escape', '2022-01-01 00:00:00', 'index', '.html', '/games/20 Bug\'s Escape 3D', 13);
INSERT INTO `DEVELOPED` (`StudioID`, `GameID`) 
    VALUES (5, 20);

INSERT INTO `Game` (`GameName`, `GameGenre`, `GameReleaseDate`, `GameStartFileName`, `GameStartFileType`, `GameDirLocation`, `GameAgeRating`) 
    VALUES ('Bean Cowboy VS Space Invaders', 'Cowboy Space Shooter', '2022-01-01 00:00:00', 'index', '.html', '/games/21 Bean Cowboy VS Space Invaders', 13);
INSERT INTO `DEVELOPED` (`StudioID`, `GameID`) 
    VALUES (5, 21);

# === Ratings ===
# User 1
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (5, 1, 1);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (4, 1, 2);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (5, 1, 3);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (2, 1, 4);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (3, 1, 5);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (5, 1, 6);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (5, 1, 7);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (5, 1, 8);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (1, 1, 9);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (4, 1, 10);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (4, 1, 11);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (5, 1, 12);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (3, 1, 13);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (3, 1, 14);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (5, 1, 15);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (5, 1, 16);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (5, 1, 17);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (4, 1, 18);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (5, 1, 19);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (2, 1, 20);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (3, 1, 21);
    
# User 2
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (4, 2, 1);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (3, 2, 2);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (4, 2, 3);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (1, 2, 4);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (2, 2, 5);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (4, 2, 6);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (4, 2, 7);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (4, 2, 8);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (1, 2, 9);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (3, 2, 10);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (4, 2, 11);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (4, 2, 12);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (2, 2, 13);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (2, 2, 14);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (4, 2, 15);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (4, 2, 16);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (4, 2, 17);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (3, 2, 18);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (4.5, 2, 19);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (3, 2, 20);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (2, 2, 21);

# User 3
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (5, 3, 1);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (5, 3, 2);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (5, 3, 3);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (3, 3, 4);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (4, 3, 5);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (5, 3, 6);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (5, 3, 7);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (5, 3, 8);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (2, 3, 9);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (5, 3, 10);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (5, 3, 11);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (5, 3, 12);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (4, 3, 13);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (4, 3, 14);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (5, 3, 15);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (5, 3, 16);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (5, 3, 17);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (5, 3, 18);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (5, 3, 19);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (3, 3, 20);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (4, 3, 21);

# User 4
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (5, 4, 1);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (4, 4, 2);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (5, 4, 3);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (2, 4, 4);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (3, 4, 5);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (5, 4, 6);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (5, 4, 7);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (5, 4, 8);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (1, 4, 9);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (4, 4, 10);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (5, 4, 11);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (5, 4, 12);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (3, 4, 13);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (3, 4, 14);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (5, 4, 15);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (5, 4, 16);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (5, 4, 17);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (4, 4, 18);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (5, 4, 19);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (4, 4, 20);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (3, 4, 21);
    
# User 5
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (5, 5, 1);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (4, 5, 2);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (5, 5, 3);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (2, 5, 4);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (3, 5, 5);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (5, 5, 6);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (5, 5, 7);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (5, 5, 8);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (1, 5, 9);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (4, 5, 10);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (5, 5, 11);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (5, 5, 12);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (3, 5, 13);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (3, 5, 14);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (5, 5, 15);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (5, 5, 16);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (5, 5, 17);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (4, 5, 18);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (5, 5, 19);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (4, 5, 20);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (3, 5, 21);
    
# User 6
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (5, 6, 1);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (4, 6, 2);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (5, 6, 3);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (2, 6, 4);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (3, 6, 5);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (5, 6, 6);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (5, 6, 7);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (5, 6, 8);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (1, 6, 9);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (4, 6, 10);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (5, 6, 11);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (5, 6, 12);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (3, 6, 13);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (3, 6, 14);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (5, 6, 15);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (5, 6, 16);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (5, 6, 17);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (4, 6, 18);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (5, 6, 19);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (4, 6, 20);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (3, 6, 21);

# User 7
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (5, 7, 1);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (4, 7, 2);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (5, 7, 3);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (2, 7, 4);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (3, 7, 5);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (5, 7, 6);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (5, 7, 7);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (5, 7, 8);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (1, 7, 9);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (4, 7, 10);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (5, 7, 11);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (5, 7, 12);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (3, 7, 13);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (3, 7, 14);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (5, 7, 15);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (5, 7, 16);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (5, 7, 17);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (4, 7, 18);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (5, 7, 19);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (3, 7, 20);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (3, 7, 21);

# User 8
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (5, 8, 1);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (4, 8, 2);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (5, 8, 3);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (2, 8, 4);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (3, 8, 5);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (5, 8, 6);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (5, 8, 7);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (5, 8, 8);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (1, 8, 9);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (4, 8, 10);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (5, 8, 11);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (5, 8, 12);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (3, 8, 13);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (3, 8, 14);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (5, 8, 15);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (5, 8, 16);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (5, 8, 17);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (4, 8, 18);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (5, 8, 19);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (4, 8, 20);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (3, 8, 21);

# User 9
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (5, 9, 1);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (4, 9, 2);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (5, 9, 3);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (2, 9, 4);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (3, 9, 5);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (5, 9, 6);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (5, 9, 7);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (5, 9, 8);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (1, 9, 9);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (4, 9, 10);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (4, 9, 11);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (5, 9, 12);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (3, 9, 13);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (3, 9, 14);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (5, 9, 15);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (5, 9, 16);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (5, 9, 17);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (4, 9, 18);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (5, 9, 19);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (2, 9, 20);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (3, 9, 21);

# User 10
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (4, 10, 1);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (4, 10, 2);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (5, 10, 3);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (1, 10, 4);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (2, 10, 5);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (5, 10, 6);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (5, 10, 7);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (3, 10, 8);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (1, 10, 9);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (3, 10, 10);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (3, 10, 11);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (5, 10, 12);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (2, 10, 13);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (4, 10, 14);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (4, 10, 15);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (4, 10, 16);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (4, 10, 17);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (4, 10, 18);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (5, 10, 19);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (1, 10, 20);
INSERT INTO `RATES` (`Rating`, `UserID`, `GameID`) 
    VALUES (3, 10, 21);

