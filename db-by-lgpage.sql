SELECT 
Dbases.Title,
concat('https://libguides.utc.edu/', SubjectList.LibGuidesPage) AS 'LG URL'
FROM LuptonDB.Dbases
JOIN LuptonDB.DBRanking
ON DBRanking.Key_ID = Dbases.Key_ID
JOIN LuptonDB.SubjectList
ON DBRanking.Subject_ID = SubjectList.Subject_ID
WHERE Dbases.CANCELLED = 0 AND Dbases.MASKED = 0 AND LibGuidesPage IS NOT NULL
ORDER BY SubjectList.LibGuidesPage, DBRanking.Ranking;