
-- Choose default Database
USE GameWebsite;

-- Get Tuples For a Table
SELECT * FROM `User`;
SELECT * FROM `DeveloperStudio`;
SELECT * FROM `Game`;
SELECT * FROM `Achievement`;
SELECT * FROM `DEVELOPED`;
SELECT * FROM `RATES`;
SELECT * FROM `ACHIEVED`;

-- Get the Age of the user.
SELECT TIMESTAMPDIFF(YEAR, `BirthDate`, CURDATE()) AS `UserAge`
    FROM `User` 
    WHERE `Username` = 'Ava' AND `EmailAddress` = 'Ava@Gaming.com';

-- Get all Developer Studios that have developed Games.
SELECT `StudioId`, `StudioName`
    FROM `DeveloperStudio` NATURAL JOIN `DEVELOPED` NATURAL JOIN `Game`
    GROUP BY `StudioID`, `StudioName`;

-- Get all Games that have been developed.
SELECT `GameID`, `GameName`, `GameGenre`, `GameReleaseDate`, `GameStartFileName`, `GameStartFileType`, `GameDirLocation`, `GameAgeRating`
    FROM `DeveloperStudio` NATURAL JOIN `DEVELOPED` NATURAL JOIN `Game`
    GROUP BY `GameID`, `GameName`;

-- Get all Developer Studios that have developed GameID #27.
SELECT `StudioName`, `GameName`, `GameID`
    FROM `DeveloperStudio` NATURAL JOIN `DEVELOPED` NATURAL JOIN `Game`
    WHERE `GameID` = 27;

-- Get all Users, the Developer Studios they are with, and the game they helped to developed.
SELECT * FROM `User` NATURAL JOIN `DeveloperStudio` NATURAL JOIN `DEVELOPED` NATURAL JOIN `Game`;

-- Get all Developer Studios along with their Leader.
SELECT *
    FROM `DeveloperStudio`
        JOIN `User` ON `User`.`UserID` = `DeveloperStudio`.`LeaderID`;

/* 
    Get the User Ava and her rating for the GameID equal to 1.
    Return the `Username`, `EmailAddress`, `GameName`, and `Rating`.
*/
SELECT `Username`, `EmailAddress`, `GameName`, `Rating`
    FROM `User` NATURAL JOIN `RATES` NATURAL JOIN `Game`
    WHERE (`Username` = 'Ava' AND `EmailAddress` = 'Ava@gaming.com') AND `GameID` = 1;

-- Get the Developer Studio of 'AvaStudios' and their entire team.
SELECT * 
    FROM `DeveloperStudio`
        NATURAL JOIN `User`
        WHERE `StudioName` = 'AvaStudios';

-- Get the Developer Studio of 'AvaStudios' with only their leader displayed.
SELECT * 
    FROM `DeveloperStudio`
        NATURAL JOIN `User`
        WHERE `StudioName` = 'AvaStudios' AND `LeaderID` = `UserID`;

-- Get the Developer Studio of 'AvaStudios' and their team excluding their leader.
SELECT * 
    FROM `DeveloperStudio`
        NATURAL JOIN `User`
        WHERE `StudioName` = 'AvaStudios' AND `LeaderID` != `UserID`;

-- Return all Developer Studios and their leaders/creators.
SELECT * 
    FROM `DeveloperStudio` JOIN `User` 
        ON `LeaderID` = `UserID`;

-- Return a Developer Studio with only their leader with a UserID of 7.
SELECT * 
    FROM `DeveloperStudio` JOIN `User` 
        ON `LeaderID` = `UserID`
    WHERE `UserID` = 7;

-- Return the User with the username 'Ava' and return all attributes about them and their Developer Studio.  
SELECT *, count(*)
    FROM `User` NATURAL JOIN `DeveloperStudio`
    WHERE `Username` = 'Ava';

-- Get the ratings for all games that were rated. Includes games that are not rated (No rating = null rating).
SELECT * 
    FROM `Game` 
        NATURAL JOIN `DEVELOPED` 
        NATURAL JOIN `DeveloperStudio`
        LEFT OUTER JOIN `RATES`
            ON `Game`.`GameID` = `RATES`.`GameID`;

-- Find all games that are related to the given search string input 'Strategy'. 
SELECT *
    FROM `Game`
        NATURAL JOIN `DEVELOPED` 
        NATURAL JOIN `DeveloperStudio`
    WHERE MATCH (`GameName`, `GameGenre`) AGAINST ('Strategy' IN BOOLEAN MODE)
        OR MATCH (`StudioName`) AGAINST ('Strategy' IN BOOLEAN MODE)
        OR `GameName` LIKE CONCAT('%', 'Strategy', '%')
        OR `GameGenre` LIKE CONCAT('%', 'Strategy', '%')
        OR `StudioName` LIKE CONCAT('%', 'Strategy', '%');

/* 
    (Group 1, 2) [Display Popular Games on Pages]
    Finds all popular games with or without an average rating on page #3 (each page returns 5 games).
        Games with no ratings are included so they can be displayed to a user (Must use left outer join).
        The user must only recieve games with an age rating less than or equal to 14.
        The average rating is calculated from all users that rated the game via the RATES table.
        Order by the average rating for each game in descending order, then order by the game's name in ascending order.
        Return the Game's average rating, number of ratings, id, name, studio name, genre, release date, age rating, and game directory location.
 */
SELECT avg(`Rating`) AS `AvgRating`, 
        count(`Rating`) AS `NumOfRatings`, 
        `Game`.`GameID`, 
        `GameName`, 
        `StudioName`, 
        `GameGenre`, 
        `GameReleaseDate`, 
        `GameAgeRating`, 
        `GameDirLocation`
    FROM `Game`
        NATURAL JOIN (SELECT * FROM `DEVELOPED` GROUP BY `GameID`) AS `UniqueDeveloped`
        NATURAL JOIN `DeveloperStudio`
        LEFT OUTER JOIN `RATES`
            ON `Game`.`GameID` = `RATES`.`GameID`
    WHERE `GameAgeRating` <= 14
    GROUP BY `Game`.`GameID`, `GameName`
    ORDER BY `AvgRating` DESC, `GameName` ASC
    LIMIT 5 OFFSET 15;

/* 
    (Group 1, 2) [Get Average Game Rating with all Attributes]
    Get the average rating for all games that were rated. Includes games that are not rated (No rating = null rating).
    Also return all other attributes.
*/
SELECT *, avg(`Rating`) AS `AvgRating`
    FROM `Game`
        NATURAL JOIN `DEVELOPED` 
        NATURAL JOIN `DeveloperStudio`
        LEFT OUTER JOIN `RATES`
            ON `Game`.`GameID` = `RATES`.`GameID`
    GROUP BY `Game`.`GameID`, `GameName`;

SELECT *, avg(`Rating`) AS `AvgRating`, count(Rating) AS NumOfRatings
    FROM `Game`
        NATURAL JOIN (SELECT * FROM `DEVELOPED` GROUP BY `GameID`) AS `UniqueDeveloped`
        NATURAL JOIN `DeveloperStudio`
        LEFT OUTER JOIN `RATES`
            ON `Game`.`GameID` = `RATES`.`GameID`
    GROUP BY `Game`.`GameID`, `GameName`;

/* 
    (Group 1) [Find All Games Developed by Studio with the given ID]
    Find Games that were developed with the given Studio ID of 1.
    Return the game's id, name, genre, release date, age rating, and directory location.
*/
SELECT `Game`.`GameID`, `GameName`, `GameGenre`, `GameReleaseDate`, `GameAgeRating`, `GameDirLocation`
    FROM `DeveloperStudio`
        NATURAL JOIN `DEVELOPED`
        NATURAL JOIN `Game`
    WHERE `StudioID` = 1
    GROUP BY `Game`.`GameID`, `GameName`;

/* 
    This query gets all the Developer Studios that made the game with the given GameID.
    Return the studio name, and the game name and game id.
*/
SELECT `StudioName`, `GameName`, `GameID`
    FROM `DeveloperStudio` NATURAL JOIN `DEVELOPED` NATURAL JOIN `Game`
        WHERE `GameID` = 22;

/* 
    (Group 1, 2, 3) [Get Total Average Game Rating]
    Get the total average rating across all games.
*/
SELECT avg(`AvgGameRating`) AS `AvgTotalGameRating`
    FROM (SELECT avg(`Rating`) AS `AvgGameRating`
              FROM `Game`
                  NATURAL JOIN `DEVELOPED`
                  NATURAL JOIN `DeveloperStudio`
                  LEFT OUTER JOIN `RATES`
                      ON `Game`.`GameID` = `RATES`.`GameID`
              GROUP BY `Game`.`GameID`, `GameName`
         ) AS `TableAvgGameRating`;

/* 
    (Group 1, 2, 3) [Advanced Search Query]
    Find all popular games that are related to the given search string input variable 'Studios'. 
        For a display page, each page returns 5 games. Only return the games on page #2.
        Games with no ratings are included so they can be displayed to a user (Must use left outer join).
        The user must only recieve games with an age rating less than or equal to 16.
        The average rating is calculated from all users that rated the game via the RATES table.
        Games must have a rating higher than or equal to the average total rating of all games.
        Order by the most popular game to the least popular game, then order by the game's name in ascending order.
        Return the Game's average rating, number of ratings, id, name, studio name, genre, release date, age rating, and game directory location.
 */
SELECT avg(`Rating`) AS `AvgRating`, 
        count(`Rating`) AS `NumOfRatings`, 
        `Game`.`GameID`, 
        `GameName`, 
        `StudioName`, 
        `GameGenre`, 
        `GameReleaseDate`, 
        `GameAgeRating`, 
        `GameDirLocation`
    FROM `Game`
        NATURAL JOIN (SELECT * FROM `DEVELOPED` GROUP BY `GameID`) AS `UniqueDeveloped`
        NATURAL JOIN `DeveloperStudio`
        LEFT OUTER JOIN `RATES`
            ON `Game`.`GameID` = `RATES`.`GameID`
    WHERE `GameAgeRating` <= 14
        AND (MATCH (`GameName`, `GameGenre`) AGAINST ('Studios' IN BOOLEAN MODE)
            OR MATCH (`StudioName`) AGAINST ('Studios' IN BOOLEAN MODE)
            OR `GameName` LIKE CONCAT('%', 'Studios', '%')
            OR `GameGenre` LIKE CONCAT('%', 'Studios', '%')
            OR `StudioName` LIKE CONCAT('%', 'Studios', '%'))
    GROUP BY `Game`.`GameID`, `GameName`
    HAVING `AvgRating` >= (SELECT avg(`AvgGameRating`) AS `AvgTotalGameRating`
                            FROM (SELECT avg(`Rating`) AS `AvgGameRating`
                                    FROM `Game`
                                        NATURAL JOIN `DEVELOPED`
                                        NATURAL JOIN `DeveloperStudio`
                                        LEFT OUTER JOIN `RATES`
                                            ON `Game`.`GameID` = `RATES`.`GameID`
                                    GROUP BY `Game`.`GameID`, `GameName`) AS `TableAvgGameRating`)
    ORDER BY `AvgRating` DESC, `GameName` ASC
    LIMIT 5 OFFSET 5;

/* 
    Find the game with the highest average rating compared to all other game average ratings.
*/
SELECT max(`TableGameAvgRating`.`AvgRating`) AS `HighestAvgRating`, 
        `TableGameAvgRating`.`GameID`, 
        `GameName`, 
        `StudioName`, 
        `GameGenre`, 
        `GameReleaseDate`, 
        `GameAgeRating`
    FROM 
        (SELECT *, avg(`Rating`) AS `AvgRating`, count(*) AS `NumRatings`
            FROM `Game`
                NATURAL JOIN `DEVELOPED` 
                NATURAL JOIN `DeveloperStudio`
                NATURAL JOIN (SELECT `Rating`, `GameID` FROM `RATES`) AS `TableRates`
            GROUP BY `Game`.`GameID`, `GameName`
            ORDER BY `AvgRating` DESC, `GameName` ASC
        ) AS `TableGameAvgRating`;
