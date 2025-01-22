SELECT
Vendor.VendorName AS vendor,
db.Title AS name,
db.URL AS url,
(CASE db.NotProxy  WHEN 1 THEN 0 ELSE 1 END) AS enable_proxy,
CONCAT(
db.ShortDescription, 
CASE
	WHEN db.TutorialURL = '' OR db.TutorialURL IS NULL THEN
    ''
    ELSE
    CONCAT (' <i class="fa fa-question-circle" aria-hidden="true"></i> <a href="', db.TutorialURL , '">', db.Title , ' Tip Sheet</a>')
END)
AS description,
CASE 
	WHEN db.HighlightedInfo = '' OR db.HighlightedInfo IS NULL THEN
	''
    ELSE
    db.HighlightedInfo
END
AS more_info,
db.New AS enable_new,
CASE 
WHEN db.HighlightedInfo LIKE '%TRIAL%' THEN 1 ELSE 0 
END 
AS enable_trial,
db.ContentType AS types,
'' AS keywords,
0 AS target,
CASE
  WHEN db.ShortURL IS NULL THEN
  LOWER(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(db.Title, ' ', '-'), '(', ''),')',''),'.',''),':','_'),',','_'))
  ELSE
  db.ShortURL
END
AS slug,
IFNULL(
GROUP_CONCAT(distinct if (SubjectList.NotSubjectList=0 AND DBRanking.TryTheseFirst=1 , SubjectList.Subject, NULL ) order by SubjectList.Subject separator ';')
, '')
AS best_bets,
IFNULL(
GROUP_CONCAT(distinct if (SubjectList.NotSubjectList=0 AND DBRanking.TryTheseFirst<>1, SubjectList.Subject, NULL ) order by SubjectList.Subject separator ';')
, '') AS subjects,
1 AS desc_pos,
'' AS lib_note,
0 AS enable_popular,
db.MASKED AS enable_hidden,
db.PrivateNotes AS internal_note,
'' AS owner, 
'' AS resource_icons,
'' AS thumbnail
FROM LuptonDB.Dbases AS db
JOIN LuptonDB.Vendor
ON db.Vendor_ID = Vendor.Vendor_ID
LEFT JOIN LuptonDB.DBRanking
ON db.Key_ID  = DBRanking.Key_ID
LEFT JOIN LuptonDB.SubjectList
ON DBRanking.Subject_ID = SubjectList.Subject_ID
WHERE CANCELLED = 0 AND MASKED = 0
GROUP BY db.Title
ORDER BY db.Key_ID
;