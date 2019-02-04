SELECT DBRanking.Subject_ID, DBRanking.Ranking, DBRanking.Key_ID, DBRanking.TryTheseFirst, Dbases.Title, DBRanking.Ranking_ID
FROM LuptonDB.DBRanking
LEFT JOIN LuptonDB.Dbases
ON DBRanking.Key_ID = Dbases.Key_ID
WHERE Subject_ID = 12
ORDER BY Ranking;