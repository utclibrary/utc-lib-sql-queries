SELECT 
Title,
ContentType,
Description,
HighlightedInfo,
ExtraInfo,
concat (URL) AS 'Native URL',
concat('https://www5.utc.edu/databases/LGForward.php?db=',Key_ID) AS 'AtoZ URL'
FROM LuptonDB.Dbases
WHERE NotAtoZ = 0 AND CANCELLED = 0 AND MASKED = 0
ORDER BY Title
;