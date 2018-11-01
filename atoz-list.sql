SELECT
Title,
ContentType AS 'Content Type',
Description,
ifnull(HighlightedInfo,"") AS 'Highlighted Info',
convert(ExtraInfo USING UTF8) AS 'Extra Info',
concat (URL) AS 'Native URL',
concat('https://liblab.utc.edu/scripts/LGForward.php?db=',Key_ID) AS 'AtoZ URL'
FROM LuptonDB.Dbases
WHERE CANCELLED = 0 AND MASKED = 0
ORDER BY Title
;
