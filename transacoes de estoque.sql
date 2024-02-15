SELECT 
g."DistNumber",
A."ItemCode",
A."ItemName" 
FROM OITM AS A
INNER JOIN OINM AS B ON A."ItemCode" = B."ItemCode"
LEFT JOIN OITL AS E ON B."CreatedBy" = E."DocEntry" AND B."TransType" = E."DocType" AND B."Warehouse" = E."LocCode" AND B."DocLineNum" = E."DocLine" AND B."AppObjLine" = E."BaseLine" AND B."ApplObj" = E."BaseType"
LEFT JOIN ITL1 AS F ON E."LogEntry" = F."LogEntry" AND E."ItemCode" = A."ItemCode"
LEFT JOIN OBTN AS G ON F."MdAbsEntry" = G."AbsEntry"