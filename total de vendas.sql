SELECT DISTINCT 
T0."DocEntry",
T0."CardCode",
T0."CardName",
T0."Serial",
T0."DocDate",
T4."SlpCode",
T4."SlpName",
T0."BPLId" ,
T2."Vehicle",
CM."AbsId",
CM."Name",
COALESCE(SUM(CASE WHEN T0."DocTotal" = 0 THEN T0."DpmAmnt" ELSE T0."DocTotal" END), 0) AS "Total" 
FROM "OINV"  T0 
INNER JOIN "INV1"  T1 ON T0."DocEntry" = T1."DocEntry" 
INNER JOIN "INV12"  T2 ON T0."DocEntry" = T2."DocEntry" 
INNER JOIN OCRD T3 ON T0."CardCode"  = T3."CardCode" 
INNER JOIN  "OSLP"  T4 ON T0."SlpCode" = T4."SlpCode"
LEFT JOIN "RIN21" T5 ON T0."DocNum" = T5."RefDocNum"
INNER JOIN "CRD1" T6 ON T0."CardCode" = T6."CardCode" AND T0."ShipToCode" = T6."Address"
INNER JOIN "OCNT" CM ON CM."AbsId" = T6."County"

WHERE T5."RefDocNum"  IS NULL AND
T0."CANCELED" = 'N' AND
(T1."Usage"  = 9 OR  T1."Usage"  = 16)
AND T0."CardCode" NOT IN(SELECT "DflCust" FROM OBPL WHERE "DflCust" IS NOT NULL)
--AND T0."CardCode" = 'CLI0003795'




 AND  T0."DocDate" >='20230901'AND T0."DocDate" <= '20230930'
  GROUP BY 
  T0."DocEntry",
T0."CardCode",
T0."CardName",
T0."Serial",
T0."DocDate",
T4."SlpCode",
T4."SlpName",
T0."BPLId" ,
T2."Vehicle",
CM."AbsId",
CM."Name"





SELECT * FROM ocrd WHERE "CardCode"  = 'CLI0002955' 


SELECT * FROM OINV u WHERE "DocEntry" = 25418



SELECT "CardName", sum("DocTotal") FROM oinv WHERE "BPLId" in(2,4,11,17) GROUP BY "CardName" ORDER BY   count("DocEntry") DESC



SELECT "CardCode","County"  FROM CRD1 WHERE "County" = '' OR "County" IS null GROUP BY "County" , "CardCode" 
