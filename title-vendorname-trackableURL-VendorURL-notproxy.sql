SELECT 
Dbases.Title,
Vendor.VendorName AS 'Vendor Name',
concat('https://liblab.utc.edu/scripts/LGForward.php?db=',Key_ID) AS 'Trackable URL',
Dbases.URL AS 'Vendor URL',
if (NotProxy, 'yes', 'no') AS 'Not Proxy'
FROM LuptonDB.Dbases
JOIN LuptonDB.Vendor
on Dbases.Vendor_ID = Vendor.Vendor_ID
WHERE CANCELLED = 0 AND MASKED = 0
ORDER BY Title
;