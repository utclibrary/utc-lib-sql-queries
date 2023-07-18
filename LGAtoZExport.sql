SELECT
Vendor.VendorName AS vendor,
db.Title AS name,
db.URL AS url,
(CASE db.NotProxy  WHEN 1 THEN 0 ELSE 1 END) AS enable_proxy,
db.ShortDescription AS description,
db.HighlightedInfo AS more_info,
db.`New` AS enable_new,
0 AS enable_trial,
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
'' AS best_bets,
GROUP_CONCAT(SubjectList.Subject separator ';') AS subjects,
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
JOIN LuptonDB.DBRanking
ON db.Key_ID  = DBRanking.Key_ID
JOIN LuptonDB.SubjectList
ON DBRanking.Subject_ID = SubjectList.Subject_ID
WHERE CANCELLED = 0 AND MASKED = 0 AND db.Key_ID > 200
GROUP BY db.Title
ORDER BY db.Key_ID 
;