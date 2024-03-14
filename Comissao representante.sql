SELECT * FROM 
(
SELECT 
T0."CardCode",
T0."DocEntry",
T0."CardName" AS "Cliente",
T2."DocNum" AS "Nº Pagamento#",
T2."DocEntry",
T5."Price",
T0."Serial" AS "Nº Nota",
T1."InstId",
T0."Installmnt" as "Nº Parcelas",
T0."DocDate" AS "Data de lançamento",
T0."DocTotal" AS "Total Nota",
T2."DocDate" AS "Data de Pagamento",
CASE 
	WHEN	T1."PaidSum" = 0  THEN T1."AppliedSys"
	ELSE T1."PaidSum" 
END AS "Total pago",
--T3."InstlmntID" AS "Parcela",
--T3."DueDate" AS "Data de Vencimento" ,
T0."BPLId",
T0."BPLName",
T0."SlpCode",
T4."SlpName" AS "Vendedor",
T5."DiscPrcnt" AS "Desconto",
T5."U_preco_base",
T5."ItemCode" as "CodProduto",
T5."Dscription" as "Produto",
T5."U_ROV_PREBASE",
T5."U_preco_negociado",
COALESCE((SELECT SUM(COALESCE(NULLIF("U_TX_VlDeL", 0),"TaxSum")) FROM "INV4" tax WHERE tax."DocEntry" = T5."DocEntry" AND tax."staType" = 25 AND tax."LineNum" = T5."LineNum"),0) AS "desonerado",
T5."LineTotal"-COALESCE((SELECT SUM(COALESCE(NULLIF("U_TX_VlDeL", 0),"TaxSum")) FROM "INV4" tax WHERE tax."DocEntry" = T5."DocEntry" AND tax."staType" = 25 AND tax."LineNum" = T5."LineNum"),0) AS "faturado",
T5."Quantity",
T7."PymntGroup",
T11."U_regressiva",
T11."U_porcentagem",
T10."ListName",
COALESCE(T8."LineTotal",0) as "Frete"


FROM "OINV" T0
 INNER JOIN "INV6" T3 ON T3."DocEntry" = T0."DocEntry" 
 INNER JOIN "RCT2" T1 ON T1."DocEntry" = T0."DocEntry" AND
T1."DocTransId" = T0."TransId" AND T1."InstId" = T3."InstlmntID" 
 INNER JOIN "ORCT" T2 ON T2."DocEntry" = T1."DocNum"
 INNER JOIN "OSLP" T4 ON T0."SlpCode" = T4."SlpCode"
 INNER JOIN "INV1" T5 ON T0."DocEntry" = T5."DocEntry"
 INNER JOIN "OCTG" T7 ON T0."GroupNum" =T7."GroupNum"
 LEFT JOIN  "RIN21" T6 ON T0."DocNum" = T6."RefDocNum"
 LEFT JOIN  "INV21" T9 ON T0."DocNum" = T9."RefDocNum"
 LEFT JOIN "INV3" T8 ON T0."DocEntry" = T8."DocEntry"
 LEFT JOIN "OPLN" T10 ON T5."U_idTabela" = T10."ListNum"
 LEFT JOIN "@COMISSAO" T11 ON T10."U_tipoComissao" = T11."Code"
 WHERE 
T0."CANCELED" = 'N' AND
T6."RefDocNum" IS NULL AND 
(T5."Usage" = 9 or T5."Usage" = 16)
AND T0."DocDate" >= TO_DATE(20230701,'YYYYMMDD')
AND T9."RefDocNum" IS NULL
 
 UNION 
 
 SELECT 
T0."CardCode",
T0."DocEntry",
T0."CardName" AS "Cliente",
T2."DocNum" AS "Nº Pagamento#",
T2."DocEntry",
T5."Price",
T0."Serial" AS "Nº Nota",
T1."InstId",
T0."Installmnt" as "Nº Parcelas",
T0."DocDate" AS "Data de lançamento",
T12."DrawnSum" AS "Total Nota",
T2."DocDate" AS "Data de Pagamento",
CASE 
	WHEN	T1."PaidSum" = 0  THEN T1."AppliedSys"
	ELSE T1."PaidSum" 
END AS "Total pago",
--T3."InstlmntID" AS "Parcela",
--T3."DueDate" AS "Data de Vencimento" ,
T0."BPLId",
T0."BPLName",
T0."SlpCode",
T4."SlpName" AS "Vendedor",
T5."DiscPrcnt" AS "Desconto",
T5."U_preco_base",
T5."ItemCode" as "CodProduto",
T5."Dscription" as "Produto",
T5."U_ROV_PREBASE",
T5."U_preco_negociado",
COALESCE((SELECT SUM(COALESCE(NULLIF("U_TX_VlDeL", 0),"TaxSum")) FROM "INV4" tax WHERE tax."DocEntry" = T5."DocEntry" AND tax."staType" = 25 AND tax."LineNum" = T5."LineNum"),0) AS "desonerado",
T5."LineTotal"-COALESCE((SELECT SUM(COALESCE(NULLIF("U_TX_VlDeL", 0),"TaxSum")) FROM "INV4" tax WHERE tax."DocEntry" = T5."DocEntry" AND tax."staType" = 25 AND tax."LineNum" = T5."LineNum"),0) AS "faturado",
T5."Quantity",
T7."PymntGroup",
T11."U_regressiva",
T11."U_porcentagem",
T10."ListName",
COALESCE(T8."LineTotal",0) as "Frete"


FROM "OINV" T0
 INNER JOIN "INV6" T3 ON T3."DocEntry" = T0."DocEntry" 
 INNER JOIN "INV9" T12 ON T0."DocEntry" = T12."DocEntry" 
 INNER JOIN "RCT2" T1 ON T12."BaseAbs" = T1."DocEntry" AND T1."InvType"  = 203
 LEFT JOIN "ORCT" T2 ON T2."DocEntry" = T1."DocNum"
 INNER JOIN "OSLP" T4 ON T0."SlpCode" = T4."SlpCode"
 INNER JOIN "INV1" T5 ON T0."DocEntry" = T5."DocEntry"
 INNER JOIN "OCTG" T7 ON T0."GroupNum" =T7."GroupNum"
 LEFT JOIN  "RIN21" T6 ON T0."DocNum" = T6."RefDocNum"
 LEFT JOIN  "INV21" T9 ON T0."DocNum" = T9."RefDocNum"
 LEFT JOIN "INV3" T8 ON T0."DocEntry" = T8."DocEntry"
 LEFT JOIN "OPLN" T10 ON T5."U_idTabela" = T10."ListNum"
 LEFT JOIN "@COMISSAO" T11 ON T10."U_tipoComissao" = T11."Code"
 WHERE T0."CANCELED" = 'N' AND
T6."RefDocNum" IS NULL AND 
(T5."Usage" = 9 or T5."Usage" = 16)
AND T0."DocDate" >= TO_DATE(20230701,'YYYYMMDD')
AND T9."RefDocNum" IS NULL
 )
WHERE 
"Data de Pagamento" >={?DateInicio}
AND "Data de Pagamento" <={?DateFinal}

