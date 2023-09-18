SELECT 
T0."DocEntry" ,
T0."CardCode",
T0."DocNum" AS "Nº Interno",
T0."CardName" AS "Nome do parceiro",
T2."DocNum" AS "Nº Pagamento#",
T0."Serial" AS "Nº Nota",
T0."DocDate" AS "Data de lançamento",
T0."DocTotal" AS "Total Nota",
T2."DocDate" AS "Data de Pagamento",
T2."DocTotal" AS "Total Pago",
T3."InstlmntID" AS "Parcela",
T0."Installmnt" AS "Nº de parcelas",
T3."InsTotal" AS "Valor da parcela",
T3."DueDate" AS "Data de Vencimento",
T0."PaidSum",
T0."BPLName" AS "Filial",
T0."BPLId",
T0."CANCELED"
FROM "OINV" T0
 INNER JOIN "INV6" T3 ON T3."DocEntry" = T0."DocEntry" 
 LEFT JOIN "RCT2" T1 ON T1."DocEntry" = T0."DocEntry" AND
T1."DocTransId" = T0."TransId" AND T1."InstId" = T3."InstlmntID" 
 LEFT JOIN "ORCT" T2 ON T2."DocEntry" = T1."DocNum" 
 LEFT JOIN "RCT1" T6 ON T2."DocEntry" = T6."DocNum"
WHERE 
T2."Canceled" = 'N'  AND
T0."DocDate" >= TO_DATE('20230101', 'YYYYMMDD')  AND
T0."DocDate" <= TO_DATE('20230822', 'YYYYMMDD')  
AND T0."SeqCode" in (28,25)





SELECT 
T0."DocEntry" ,
T1."CardCode",
T1."DocNum" AS "Nº Interno",
T1."CardName" AS "Nome do parceiro",
T2."DocNum" AS "Nº Pagamento#",
T1."Serial" AS "Nº Nota",
T1."DocDate" AS "Data de lançamento",
T1."DocTotal" AS "Total Nota",
T2."DocDate" AS "Data de Pagamento",
T2."DocTotal" AS "Total Pago",
T3."InstlmntID" AS "Parcela",
T1."Installmnt" AS "Nº de parcelas",
T3."InsTotal" AS "Valor da parcela",
T3."DueDate" AS "Data de Vencimento",
T1."PaidSum",
T1."BPLName" AS "Filial",
T1."BPLId",
T1."CANCELED",
T0."RefDocEntr"
FROM INV21 T0
INNER JOIN OINV T1 ON T0."DocEntry" = T1."DocEntry"
INNER JOIN "INV6" T3 ON T3."DocEntry" = T0."DocEntry" 
 LEFT JOIN "RCT2" T4 ON T4."DocEntry" = T0."DocEntry" AND
T4."DocTransId" = T1."TransId" AND T4."InstId" = T3."InstlmntID" 
 LEFT JOIN "ORCT" T2 ON T2."DocEntry" = T4."DocNum" 
 LEFT JOIN "RCT1" T6 ON T2."DocEntry" = T6."DocNum"

 
 SELECT * FROM inv21