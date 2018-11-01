SELECT
Dbases.Title,
Vendor.VendorName,
concat (Dbases.URL) AS 'Native URL',
concat('https://liblab.utc.edu/scripts/LGForward.php?db=',Key_ID) AS 'AtoZ URL'
FROM LuptonDB.Vendor
LEFT JOIN LuptonDB.Dbases
ON Vendor.Vendor_ID = Dbases.Vendor_ID
WHERE Dbases.NotAtoZ = 0 AND Dbases.CANCELLED = 0 AND Dbases.MASKED = 0
ORDER BY Dbases.Title;
