SELECT 
T0."DocEntry",
T0."DocNum",
T0."CardCode",
T0."CardName" AS "Paceiro de Negocio",
T0."Serial" as "Nº NF",
T0."SeriesStr" AS "Serie",
T0."DocTotal" AS "Total da Nota",
CASE
	WHEN T0."DocStatus" = 'C' AND T0."CANCELED" = 'N' THEN 'Fechado'
	ELSE 'Aberto'
END AS "Status",
T0."DocDate" AS "Data de lançamento",
T0."BPLId",
T1."USER_CODE",
T1."U_NAME" AS "Colaborador",
T0."BPLName" AS "Filial", 
T0."DocDueDate" AS "Data de Vencimento",
'Nota de entrada' as "Tipo de documento",
"TaxDate" as "Data de emissão",
(SELECT MAX(T2."Usage") FROM PCH1 T1 INNER JOIN OUSG T2 ON T1."Usage" = T2."ID"  WHERE T1."DocEntry" = T0."DocEntry")
FROM OPCH T0
INNER JOIN OUSR T1 ON T0."UserSign" = T1."USERID"  
WHERE

T0."DocDate"  >=TO_DATE('20230701', 'YYYYMMDD') AND
T0."DocDate"  <=TO_DATE('20230731', 'YYYYMMDD') AND
T0."CANCELED" = 'N'

UNION 

SELECT 
T0."DocEntry",
T0."DocNum",
T0."CardCode",
T0."CardName" AS "Paceiro de Negocio",
T0."Serial" as "Nº NF",
T0."SeriesStr" AS "Serie",
T0."DocTotal" AS "Total da Nota",
CASE
	WHEN T0."DocStatus" = 'C' AND T0."CANCELED" = 'N' THEN 'Fechado'
	ELSE 'Aberto'
END AS "Status",
T0."DocDate" AS "Data de lançamento",
T0."BPLId",
T1."USER_CODE",
T1."U_NAME" AS "Colaborador",
T0."BPLName" AS "Filial", 
T0."DocDueDate" AS "Data de Vencimento",
'Recebimento de mercadoria' as "Tipo de documento",
"TaxDate" as "Data de emissão",
(SELECT MAX(T2."Usage") FROM PDN1 T1 INNER JOIN OUSG T2 ON T1."Usage" = T2."ID"  WHERE T1."DocEntry" = T0."DocEntry")

FROM OPDN T0
INNER JOIN OUSR T1 ON T0."UserSign" = T1."USERID"  
WHERE
T0."DocDate"  >= TO_DATE('20230701', 'YYYYMMDD') AND
T0."DocDate"  <=TO_DATE('20230731', 'YYYYMMDD') AND
T0."CANCELED" = 'N';








