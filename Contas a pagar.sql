SELECT * FROM (
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
'Nota de entrada' AS "Tipo documento",
L."OcrCode2" AS "Centro de custo ",
OPRC."PrcName" AS "Nome do centro de custo",
CASE 
	WHEN	T1."PaidSum" = 0  THEN T1."AppliedSys"
	ELSE T1."PaidSum" 
END AS "Valor pago",
T0."BPLName" AS "Filial",
CAST(T0."BPLId" AS nvarchar) AS "CodeFilail",
T2."UserSign",
OUSR.U_NAME
FROM OPCH T0
INNER JOIN PCH6 T3 ON T0."DocEntry" = T3."DocEntry" 
INNER JOIN PCH1 L ON T0."DocEntry" = L."DocEntry"
LEFT JOIN VPM2 T1 ON T0."DocEntry" = T1."DocEntry" AND
T1."DocTransId" = T0."TransId" AND
T1."InstId" = T3."InstlmntID" 
LEFT JOIN OVPM T2 ON T1."DocNum" = T2."DocEntry" 
LEFT JOIN VPM1 T6 ON T2."DocNum" = T6."DocNum"
left JOIN OUSR ON T2."UserSign" = OUSR."USERID"
LEFT JOIN OPRC ON L."OcrCode2" = OPRC."PrcCode"
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
'Fatura de adiantamento' AS "Tipo documento",
L."OcrCode2" AS "Centro de custo ",
OPRC."PrcName" AS "Nome do centro de custo",
CASE 
	WHEN	T1."PaidSum" = 0  THEN T1."AppliedSys"
	ELSE T1."PaidSum" 
END AS "Valor pago",
T0."BPLName" AS "Filial",
CAST(T0."BPLId" AS nvarchar) AS "CodeFilail",
T2."UserSign",
OUSR.U_NAME
FROM ODPO T0
INNER JOIN DPO6 T3 ON T0."DocEntry" = T3."DocEntry" 
INNER JOIN DPO1 L ON T0."DocEntry" = L."DocEntry"
LEFT JOIN VPM2 T1 ON T0."DocEntry" = T1."DocEntry" AND
T1."DocTransId" = T0."TransId" AND
T1."InstId" = T3."InstlmntID" 
LEFT JOIN OVPM T2 ON T1."DocNum" = T2."DocEntry" 
LEFT JOIN VPM1 T6 ON T2."DocNum" = T6."DocNum"
left JOIN OUSR ON T2."UserSign" = OUSR."USERID"
LEFT JOIN OPRC ON L."OcrCode2" = OPRC."PrcCode"
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
'Devolução' AS "Tipo documento",
L."OcrCode2" AS "Centro de custo ",
OPRC."PrcName" AS "Nome do centro de custo",
CASE 
	WHEN	T1."PaidSum" = 0  THEN T1."AppliedSys"
	ELSE T1."PaidSum" 
END AS "Valor pago",
T0."BPLName" AS "Filial",
CAST(T0."BPLId" AS nvarchar) AS "CodeFilail",
T2."UserSign",
OUSR.U_NAME
FROM ORIN T0
INNER JOIN RIN6 T3 ON T0."DocEntry" = T3."DocEntry" 
INNER JOIN RIN1 L ON T0."DocEntry" = L."DocEntry"
LEFT JOIN VPM2 T1 ON T0."DocEntry" = T1."DocEntry" AND
T1."DocTransId" = T0."TransId" AND
T1."InstId" = T3."InstlmntID" 
LEFT JOIN OVPM T2 ON T1."DocNum" = T2."DocEntry" 
LEFT JOIN VPM1 T6 ON T2."DocNum" = T6."DocNum"
left JOIN OUSR ON T2."UserSign" = OUSR."USERID"
LEFT JOIN OPRC ON L."OcrCode2" = OPRC."PrcCode"
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
T0."OcrCode2" AS "Centro de custo ",
OPRC."PrcName" AS "Nome do centro de custo",
CASE 
	WHEN	T1."PaidSum" = 0  THEN T1."AppliedSys"
	ELSE T1."PaidSum" 
END AS "Valor pago",
T0."BPLName" AS "Filial",
CAST(T0."BPLId" AS nvarchar) AS "CodeFilail",
T2."UserSign",
OUSR.U_NAME
FROM JDT1 T0
LEFT JOIN VPM2 T1 ON T0."TransId" = T1."DocTransId"
LEFT JOIN OVPM T2 ON T1."DocNum" = T2."DocEntry" 
LEFT JOIN VPM1 T6 ON T2."DocNum" = T6."DocNum"
INNER JOIN OCRD T7 ON T0."ShortName" = T7."CardCode"
left JOIN OUSR ON T2."UserSign" = OUSR."USERID"
LEFT JOIN OPRC ON T0."OcrCode2" = OPRC."PrcCode"
WHERE 
T2."Canceled" = 'N'  AND 
T0."TransType"  = 30
)
WHERE "Data de lançamento" >= '20240301'



