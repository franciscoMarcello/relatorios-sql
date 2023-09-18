SELECT 
T0."CardCode",
T0."CardName",
T2."DocNum" AS "Nº Pagamento#",
T0."Serial" AS "Nº Nota",
T0."DocDate" AS "Data de lançamento",
T0."DocTotal" AS "Total Nota",
T2."DocDate" AS "Data de Pagamento",
T2."DocTotal" AS "Total Pago",
T3."InstlmntID" AS "Parcela",
T3."DueDate" AS "Data de Vencimento",
COALESCE(DAYS_BETWEEN( T2."DocDate" , T3."DueDate"  ),0)AS "Diferença de dias",
T0."BPLName" AS "Filial",
T5."SeqName" AS "Tipo de documento",
T7."AcctName" AS "Nome da conta"
FROM "OINV" T0
 INNER JOIN "INV6" T3 ON T3."DocEntry" = T0."DocEntry" 
 INNER JOIN "RCT2" T1 ON T1."DocEntry" = T0."DocEntry" AND
T1."DocTransId" = T0."TransId" AND T1."InstId" = T3."InstlmntID" 
 INNER JOIN "ORCT" T2 ON T2."DocEntry" = T1."DocNum" 
 LEFT JOIN RCT1 T6 ON T2."DocEntry" = T6."DocNum"
 LEFT JOIN OACT T7 ON 
	(T6."CheckAct" = T7."AcctCode" OR
	T2."CashAcct" = T7."AcctCode" OR
	T2."TrsfrAcct" = T7."AcctCode" OR
	T2."CheckAcct" = T7."AcctCode" ) 
 LEFT JOIN NFN1 T5 ON T0."SeqCode" = T5."SeqCode" 
WHERE T2."Canceled" = 'N'  AND
T2."DocDate" >= TO_DATE('20230401', 'YYYYMMDD')  AND
T2."DocDate" <=  TO_DATE('20230430', 'YYYYMMDD') AND
T0."BPLName" = 'SUSTENNUTRI NUTRICAO ANIMAL LTDA - Matriz'
ORDER BY T2."DocDate",T0."Serial" 



SELECT 
T0."CardCode",
T0."CardName",
T2."DocNum" AS "Nº Pagamento#",
T0."Serial" AS "Nº Nota",
T0."DocDate" AS "Data de lançamento",
T0."DocTotal" AS "Total Nota",
T2."DocDate" AS "Data de Pagamento",
T2."DocTotal" AS "Total Pago",
T3."InstlmntID" AS "Parcela",
T3."DueDate" AS "Data de Vencimento",
COALESCE(DAYS_BETWEEN( T2."DocDate" , T3."DueDate"  ),0)AS "Diferença de dias",
T0."BPLName" AS "Filial",
T5."SeqName" AS "Tipo de documento",
T7."AcctName" AS "Nome da conta"
FROM "OINV" T0
 INNER JOIN "INV6" T3 ON T3."DocEntry" = T0."DocEntry" 
 INNER JOIN "RCT2" T1 ON T1."DocEntry" = T0."DocEntry"AND
T1."DocTransId" = T0."TransId" AND T1."InstId" = T3."InstlmntID" 
 INNER JOIN "ORCT" T2 ON T2."DocEntry" = T1."DocNum" 
 LEFT JOIN RCT1 T6 ON T2."DocEntry" = T6."DocNum"
 LEFT JOIN OACT T7 ON 
	(T6."CheckAct" = T7."AcctCode" OR
	T2."CashAcct" = T7."AcctCode" OR
	T2."TrsfrAcct" = T7."AcctCode" OR
	T2."CheckAcct" = T7."AcctCode" ) 
 LEFT JOIN NFN1 T5 ON T0."SeqCode" = T5."SeqCode" 
WHERE T2."Canceled" = 'N'  AND
T2."DocDate" >= [%0] AND
T2."DocDate" <=  [%1] AND
T0."BPLName" = [%2]
ORDER BY T2."DocDate",T0."Serial" 