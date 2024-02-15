SELECT
DISTINCT 
T0."DocDate" AS "Dt.Pagto",
T2."Serial" AS "NºNF",
T2."TaxDate" AS "Dt. Emissão",
T2."DocDate" AS "Dt. Entrada",
T2."DocTotal" AS "Valor da NF",
T2."CardName" AS "Prestador de serviço",
T2."CardCode" AS "Cod Prestador",
(SELECT "TaxId0" FROM CRD7 WHERE "Address"  = '' AND "CRD7"."CardCode" = T2."CardCode") AS "CNPJ",
(SELECT SUM(T0."WTAmnt") FROM PCH5 T0  WHERE T0."AbsEntry" = T2."DocEntry" AND T0."WTCode" = 'E001') AS "PIS",
(SELECT SUM(T0."WTAmnt") FROM PCH5 T0  WHERE T0."AbsEntry" = T2."DocEntry" AND T0."WTCode" = 'E002' ) AS "CONFIS",
(SELECT SUM(T0."WTAmnt") FROM PCH5 T0  WHERE T0."AbsEntry" = T2."DocEntry" AND T0."WTCode" = 'E003') AS "CSLL",
(SELECT SUM(T0."WTAmnt") FROM PCH5 T0  WHERE T0."AbsEntry" = T2."DocEntry" AND T0."WTCode" = 'E006' ) AS "INSS",
(SELECT SUM(T0."WTAmnt") FROM PCH5 T0  WHERE T0."AbsEntry" = T2."DocEntry" AND T0."WTCode" = 'E004' ) AS "IRRF",
--T4."WTName" AS "Nome do imposto",
--T4."WTCode" AS "Cod imposto",
--T4."WTTypeId" AS "Tipo de imposto",
T2."BPLId" AS "CodFilial",
T2."BPLName" AS "Filial"
--T5."WTType" AS "Imposto"

FROM OVPM T0

INNER JOIN VPM2 T1 ON T0."DocNum" = T1."DocNum"

INNER JOIN OPCH T2 ON T1."DocEntry" = T2."DocEntry"

INNER JOIN PCH5 T3 ON T2."DocEntry" = T3."AbsEntry"

INNER JOIN OWHT T4 ON T3."WTCode" = T4."WTCode"

INNER JOIN OWTT T5 ON T4."WTTypeId" = T5."WTTypeId"

WHERE  T2."CANCELED" = 'N'



SELECT SUM(T0."WTAmnt"),T1."Serial" AS "NºNF" FROM PCH5 T0 INNER JOIN OPCH T1 ON T0."AbsEntry" = T1."DocEntry" WHERE T0."WTCode" = 'E001' GROUP BY T1."Serial" 






