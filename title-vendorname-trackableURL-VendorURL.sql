SELECT 
Dbases.Title,
Vendor.VendorName,
concat('https://liblab.utc.edu/scripts/LGForward.php?db=',Key_ID) AS 'Trackable URL',
concat(Dbases.URL) AS 'Vendor URL'
FROM LuptonDB.Dbases
JOIN LuptonDB.Vendor
on Dbases.Vendor_ID = Vendor.Vendor_ID
WHERE CANCELLED = 0 AND MASKED = 0
ORDER BY Title
;