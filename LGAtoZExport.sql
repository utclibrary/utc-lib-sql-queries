SELECT
Vendor.VendorName AS vendor,
Dbases.Title AS name,
Dbases.URL AS url,
(CASE Dbases.NotProxy  WHEN 1 THEN 0 ELSE 1 END) AS enable_proxy,
Dbases.ShortDescription AS description,
Dbases.HighlightedInfo AS more_info,
Dbases.`New` AS enable_new,
0 AS enable_trial,
Dbases.ContentType AS types,
'' AS keywords,
0 AS target,
CASE
  WHEN Dbases.ShortURL IS NULL THEN
  LOWER(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(Dbases.Title, ' ', '-'), '(', ''),')',''),'.',''),':','_'),',','_'))
  ELSE
  Dbases.ShortURL
END
AS slug,
'' AS best_bets,
'' AS subjects,
1 AS desc_pos,
Dbases.PrivateNotes AS lib_note,
0 AS enable_popular,
Dbases.MASKED AS enable_hidden,
'' AS internal_note,
'' AS owner, 
'' AS resource_icons,
'' AS thumbnail
FROM LuptonDB.Dbases
JOIN LuptonDB.Vendor
on Dbases.Vendor_ID = Vendor.Vendor_ID
WHERE CANCELLED = 0 AND MASKED = 0
ORDER BY Dbases.Key_ID 
;