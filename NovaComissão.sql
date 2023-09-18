SELECT 
T0."CardCode",
T0."DocEntry",
T0."CardName" AS "Cliente",
T2."DocNum" AS "Nº Pagamento#",
T0."Serial" AS "Nº Nota",
T1."InstId",
T0."DocDate" AS "Data de lançamento",
T0."DocTotal" AS "Total Nota",
T2."DocDate" AS "Data de Pagamento",
T2."DocTotal" AS "Total Pago",
T3."InstlmntID" AS "Parcela",
T3."DueDate" AS "Data de Vencimento" ,
T0."BPLId",
T0."BPLName",
T0."SlpCode",
T4."SlpName" AS "Vendedor",
T5."DiscPrcnt" AS "Desconto",
T5."U_preco_base",
T5."U_ROV_PREBASE",
T5."U_preco_negociado"

FROM "OINV" T0
 INNER JOIN "INV6" T3 ON T3."DocEntry" = T0."DocEntry" 
 INNER JOIN "RCT2" T1 ON T1."DocEntry" = T0."DocEntry" AND
T1."DocTransId" = T0."TransId" AND T1."InstId" = T3."InstlmntID" 
 INNER JOIN "ORCT" T2 ON T2."DocEntry" = T1."DocNum"
 INNER JOIN "OSLP" T4 ON T0."SlpCode" = T4."SlpCode"
 INNER JOIN "INV1" T5 ON T0."DocEntry" = T5."DocEntry"
WHERE T2."Canceled" = 'N' AND T0."CANCELED" = 'N' 


