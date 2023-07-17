SELECT 
"VENDOR NAME: optional, 45 characters max" AS vendor,
"DATABASE NAME: required, 255 characters max" AS name,
"DATABASE URL: required, 1000 characters max" AS url,
"ENABLE PROXY?: 0=disabled, 1=enabled" AS enable_proxy,
"DESCRIPTION: optional, 5000 characters max" AS description,
"MORE INFORMATION: optional, 5000 characters max" AS more_info,
"FLAG NEW?: 0=disabled, 1=enabled" AS enable_new,
"FLAG TRIAL?: 0=disabled, 1=enabled" AS enable_trial,
"DATABASE TYPE: optional, delimited with semi-colon" AS types,
"ALT NAME / KEYWORDS: optional, delimited with semi-colon" AS keywords,
"WINDOW TARGET: 0 =system default, 1=current window, 2=new window" AS target,
"FRIENDLY URL: optional, unique, 100 characters max" AS slug,
"BEST BET SUBJECTS: optional, delimited with semi-colon" AS best_bets,
"ADDITIONAL SUBJECTS: optional, delimited with semi-colon" AS subjects,
"DESCRIPTION DISPAY: 0=popup, 1=title, 2=icon, 3=hide" AS desc_pos,
"LIBRARY REVIEW: optional, 5000 characters max" AS lib_note,
"FLAG POPULAR?: 0=disabled, 1=enabled" AS enable_popular,
"FLAG HIDDEN?: 0=disabled, 1=enabled" AS enable_hidden,
"INTERNAL NOTE: optional, 1000 characters max" AS internal_note,
"OWNER: optional, account ID or email address" AS owner,
"RESOURCE ICON IDS: optional, delimited with semi-colon" AS resource_icons,
"THUMBNAIL IMAGE URL: optional, url, 1000 characters max" AS thumbnail,
"LIBGUIDES CONTENT ID: optional, unique, only used for updates" AS content_id
UNION
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
Dbases.ShortURL AS slug,
SubjectList.Subject AS best_bets,
SubjectList.Subject AS subjects,
1 AS desc_pos,
Dbases.PrivateNotes AS lib_note,
0 AS enable_popular,
Dbases.MASKED AS enable_hidden,
'' AS internal_note,
'' AS owner, 
'' AS resource_icons,
'' AS thumbnail,
Dbases.Key_ID AS content_id
FROM LuptonDB.Dbases
JOIN LuptonDB.Vendor
on Dbases.Vendor_ID = Vendor.Vendor_ID
LEFT JOIN LuptonDB.DBRanking
ON Dbases.Key_ID = DBRanking.Key_ID
LEFT JOIN LuptonDB.SubjectList
ON DBRanking.Subject_ID = SubjectList.Subject_ID
WHERE CANCELLED = 0 AND MASKED = 0
ORDER BY Dbases.Key_ID 
;