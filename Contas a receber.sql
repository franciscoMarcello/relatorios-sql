SELECT
T0."DocEntry" AS "DocEntry",
T0."CardCode",
T0."CardName" AS "Nome do Parceiro",
T0."DocNum" AS "Nº interno",
T2."DocNum" AS "Nº Pagamento#",
T2."DocEntry" AS "DocEntry Pagamento#",
T0."Serial" AS "Nº Nota",
T0."SeriesStr" AS "Serie",
T0."DocDate" AS "Data de lançamento",
T3."DueDate" AS "Data de Vencimento",
T3."InsTotal" AS "Valor Parcela",
T2."DocDate" AS "Data de Pagamento",
T3."InstlmntID" AS "Parcela",
CASE
	WHEN  T0."SeqCode" IN (SELECT "SeqCode"  FROM NFN1  WHERE "SeqName" LIKE '%RENEG%')  THEN 'Renegorciação'
	 ELSE 'Nota fiscal de saida'
END
 AS "Tipo documento",
T3."U_StatusCobranca" AS "Status da cobrança",
T3."U_AgenteCobrador" AS "Agente Cobrador",
B."OurNumber" AS "Boleto",
S."Description" AS "Status bankplus",
s
CASE 
	WHEN	T1."PaidSum" = 0  THEN T1."AppliedSys"
	ELSE T1."PaidSum" 
END AS "Valor pago",
T0."BPLName" AS "Filial",
T0."BPLId"
FROM OINV T0
INNER JOIN INV6 T3 ON T0."DocEntry" = T3."DocEntry" 
LEFT JOIN RCT2 T1 ON T0."DocEntry" = T1."DocEntry" AND
T1."DocTransId" = T0."TransId" AND
T1."InstId" = T3."InstlmntID" 
LEFT JOIN ORCT T2 ON T1."DocNum" = T2."DocEntry" 
LEFT JOIN RCT1 T6 ON T2."DocNum" = T6."DocNum"
LEFT JOIN "IV_IB_BillOfExchange" B ON T0."DocEntry"  = B."DocEntry" AND B."InstallmentID" = T3."InstlmntID"
left JOIN "IV_IB_BillOfExchangeSituation" S ON B."Situation"  = S.ID 
WHERE (T0."CANCELED" = 'N' or
T2."Canceled" = 'N') 



UNION 



SELECT 
T0."DocEntry" AS "DocEntry",
T0."CardCode",
T0."CardName" AS "Nome do Parceiro",
T0."DocNum" AS "Nº interno",
T2."DocNum" AS "Nº Pagamento#",
T2."DocEntry" AS "DocEntry Pagamento#",
T0."Serial" AS "Nº Nota",
T0."SeriesStr" AS "Serie",
T0."DocDate" AS "Data de lançamento",
T3."DueDate" AS "Data de Vencimento",
T3."InsTotal" AS "Valor Parcela",
T2."DocDate" AS "Data de Pagamento",
T3."InstlmntID" AS "Parcela",
'Fatura de adiantamento cliente' AS "Tipo documento",
T3."U_StatusCobranca" AS "Status da cobrança",
T3."U_AgenteCobrador" AS "Agente Cobrador",
B."OurNumber" AS "Boleto",
S."Description" AS "Status bankplus",
CASE 
	WHEN	T1."PaidSum" = 0  THEN T1."AppliedSys"
	ELSE T1."PaidSum" 
END AS "Valor pago",
T0."BPLName" AS "Filial",
T0."BPLId"
FROM ODPI T0
INNER JOIN DPI6 T3 ON T0."DocEntry" = T3."DocEntry" 
LEFT JOIN RCT2 T1 ON T0."DocEntry" = T1."DocEntry" AND
T1."DocTransId" = T0."TransId" AND
T1."InstId" = T3."InstlmntID" 
LEFT JOIN ORCT T2 ON T1."DocNum" = T2."DocEntry" 
LEFT JOIN RCT1 T6 ON T2."DocNum" = T6."DocNum"
LEFT JOIN "IV_IB_BillOfExchange" B ON T0."DocEntry"  = B."DocEntry" AND B."InstallmentID" = T3."InstlmntID"
left JOIN "IV_IB_BillOfExchangeSituation" S ON B."Situation"  = S.ID 
WHERE (T0."CANCELED" = 'N' or
T2."Canceled" = 'N')


UNION 


SELECT 
T0."DocEntry" AS "DocEntry",
T0."CardCode",
T0."CardName" AS "Nome do Parceiro",
T0."DocNum" AS "Nº interno",
T2."DocNum" AS "Nº Pagamento#",
T2."DocEntry" AS "DocEntry Pagamento#",
T0."Serial" AS "Nº Nota",
T0."SeriesStr" AS "Serie",
T0."DocDate" AS "Data de lançamento",
T3."DueDate" AS "Data de Vencimento",
T3."InsTotal" AS "Valor Parcela",
T2."DocDate" AS "Data de Pagamento",
T3."InstlmntID" AS "Parcela",
'Devolução de entrada' AS "Tipo documento",
T3."U_StatusCobranca" AS "Status da cobrança",
T3."U_AgenteCobrador" AS "Agente Cobrador",
B."OurNumber" AS "Boleto",
S."Description" AS "Status bankplus",
CASE 
	WHEN	T1."PaidSum" = 0  THEN T1."AppliedSys"
	ELSE T1."PaidSum" 
END AS "Valor pago",
T0."BPLName" AS "Filial",
T0."BPLId"
FROM ORPC T0
INNER JOIN RPC6 T3 ON T0."DocEntry" = T3."DocEntry" 
LEFT JOIN RCT2 T1 ON T0."DocEntry" = T1."DocEntry" AND
T1."DocTransId" = T0."TransId" AND
T1."InstId" = T3."InstlmntID" 
LEFT JOIN ORCT T2 ON T1."DocNum" = T2."DocEntry" 
LEFT JOIN RCT1 T6 ON T2."DocNum" = T6."DocNum"
LEFT JOIN "IV_IB_BillOfExchange" B ON T0."DocEntry"  = B."DocEntry" AND B."InstallmentID" = T3."InstlmntID"
left JOIN "IV_IB_BillOfExchangeSituation" S ON B."Situation"  = S.ID 
WHERE (T0."CANCELED" = 'N' or
T2."Canceled" = 'N') 



UNION 

 

SELECT 
T0."TransId" AS "DocEntry",
T7."CardCode",
T7."CardName" AS "Nome do Parceiro",
T0."TransId"  AS "Nº interno",
T2."DocNum" AS "Nº Pagamento#",
T2."DocEntry" AS "DocEntry Pagamento#",
T0."TransId" AS "Nº Nota",
'0' AS "Serie",
T0."RefDate" AS "Data de lançamento",
T0."DueDate" AS "Data de Vencimento",
T0."Credit" AS "Valor Parcela",
T2."DocDate" AS "Data de Pagamento",
1 AS "Parcela",
'LC' AS "Tipo documento",
'Sem status' AS "Status da cobrança",
'Sem agente' AS "Agente Cobrador",
'Sem boleto' AS "Boleto",
'Sem status' AS "Status bankplus",
CASE 
	WHEN	T1."PaidSum" = 0  THEN T1."AppliedSys"
	ELSE T1."PaidSum" 
END AS "Valor pago",
T0."BPLName" AS "Filial",
T0."BPLId"
FROM JDT1 T0
LEFT JOIN RCT2 T1 ON T0."TransId" = T1."DocTransId"
LEFT JOIN ORCT T2 ON T1."DocNum" = T2."DocEntry" 
LEFT JOIN RCT1 T6 ON T2."DocNum" = T6."DocNum"
INNER JOIN OCRD T7 ON T0."ShortName" = T7."CardCode"
WHERE 
T2."Canceled" = 'N'  AND 
T0."TransType"  = 30
