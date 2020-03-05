SELECT DBRanking.Subject_ID, DBRanking.Ranking, DBRanking.Key_ID, Dbases.Title, DBRanking.Ranking_ID,  
SubjectGroup.GroupName,
(SELECT SubjectGroup.GroupName From SubjectGroup WHERE SubjectGroup.Group_ID = DBRanking.ParentGroup_ID) as Parent
FROM DBofDBs.DBRanking
LEFT JOIN DBofDBs.SubjectGroup
ON DBRanking.Group_ID = SubjectGroup.Group_ID 

LEFT JOIN DBofDBs.Dbases
ON DBRanking.Key_ID = Dbases.Key_ID

WHERE Subject_ID  = 84
ORDER BY Ranking_ID;