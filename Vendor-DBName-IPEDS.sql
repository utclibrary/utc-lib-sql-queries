SELECT 
Vendor.VendorName AS Vendor,
Dbases.Title AS "Database Name",
Dbases.IPEDS
FROM LuptonDB.Dbases
JOIN LuptonDB.Vendor
on Dbases.Vendor_ID = Vendor.Vendor_ID
WHERE CANCELLED = 0 AND MASKED = 0
ORDER BY VendorName, Title
;