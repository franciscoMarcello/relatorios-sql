SELECT COUNT(T0."DocNum") AS "Pedidos", 'SOVIS' AS "Origem" 
FROM
ORDR T0  
INNER JOIN OUSR T1 ON T0."UserSign" = T1."USERID" 
INNER JOIN OSLP T2 ON T0."SlpCode" = T2."SlpCode"
WHERE T0."CANCELED"  = 'N' 
AND  T1."USER_CODE"  = 'ROVEMA'
AND T0."DocDate" >= TO_DATE('20230801', 'YYYYMMDD')
AND T0."DocDate" <= TO_DATE('20230831', 'YYYYMMDD')

UNION all

SELECT COUNT(T0."DocNum") AS "Pedidos", 'SAP' AS "Origem"
FROM
ORDR T0  
INNER JOIN OUSR T1 ON T0."UserSign" = T1."USERID" 
INNER JOIN OSLP T2 ON T0."SlpCode" = T2."SlpCode"
WHERE T0."CANCELED"  = 'N' 
AND  T1."USER_CODE"  <> 'ROVEMA'
AND T0."DocDate" >= TO_DATE('20230801', 'YYYYMMDD')
AND T0."DocDate" <= TO_DATE('20230831', 'YYYYMMDD')


SELECT T0."DocNum" AS "Pedidos", 'SOVIS' AS "Origem" 
FROM
ORDR T0  
INNER JOIN OUSR T1 ON T0."UserSign" = T1."USERID" 
INNER JOIN OSLP T2 ON T0."SlpCode" = T2."SlpCode"
INNER JOIN INV1 T3 ON T0."DocEntry" = T3."BaseEntry"
WHERE T0."CANCELED"  = 'N' 
AND T0."DocEntry" = 46976
AND  T1."USER_CODE"  = 'ROVEMA'
AND T0."DocDate" >= TO_DATE('20230801', 'YYYYMMDD')
AND T0."DocDate" <= TO_DATE('20230831', 'YYYYMMDD')