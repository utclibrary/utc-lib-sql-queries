SELECT 
Dbases.Title,
GROUP_CONCAT( DISTINCT SubjectList.LibGuidesPage) AS Guides
FROM Dbases
INNER JOIN LuptonDB.DBRanking
ON Dbases.Key_ID = DBRanking.Key_ID
INNER JOIN LuptonDB.SubjectList
ON DBRanking.Subject_ID = SubjectList.Subject_ID
WHERE Dbases.CANCELLED = 0 AND Dbases.MASKED = 0 AND LibGuidesPage IS NOT NULL
GROUP BY Dbases.Title;