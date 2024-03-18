
SELECT
T2."SlpCode",
T2."SlpName",

T2."U_MNO_Municipio",

T5."U_MNO_ANO" as "Ano",

T6."U_MNO_METAKG" AS "Meta(Kg)",

T6."U_MNO_METASC" AS "Meta(Sc)",

T6."U_MNO_METAREAIS" AS "Meta(R$)",

T6."U_MNO_Mes" AS "Mes",

SUM(T1."Quantity") AS "Faturado(SC)",

SUM(T1."Quantity" *grupo."BaseQty" ) AS "Faturado(kg)",

SUM( DISTINCT  T0."DocTotal") AS "Faturado Bruto",

sum(DISTINCT COALESCE(T3."LineTotal",0))AS  "Frete"

FROM oinv T0


INNER JOIN INV1 T1 ON T0."DocEntry" = T1."DocEntry" 

INNER JOIN OSLP T2 ON T0."SlpCode" = T2."SlpCode" 

LEFT JOIN INV3 T3 ON T0."DocEntry" = T3."DocEntry"
 
LEFT JOIN "RIN21" T4 ON T0."DocNum" = T4."RefDocNum"
LEFT JOIN "@MNO_META" T5 ON T0."SlpCode"=T5."U_MNO_Vendedor"

left join "@MNO_META_LINHA" T6 ON T5."Code" = T6."Code"
INNER JOIN oitm T7 ON T1."ItemCode" = T7."ItemCode"
LEFT JOIN "OUOM" medida ON T1."UomCode" = medida."UomCode"
LEFT JOIN "UGP1" grupo ON grupo."UgpEntry" = 4 AND grupo."UomEntry" = medida."UomEntry"

WHERE T0.CANCELED = 'N'
AND T0."DocDate" >={?Data}

AND T0."DocDate" <={?Data1}

AND (T1."Usage"  = 9 OR  T1."Usage"  = 16)
AND T7."U_categoria"  = 'bov' 
AND T4."RefDocNum"  IS NULL 
AND T0."CardCode" NOT IN(SELECT "DflCust" FROM OBPL WHERE "DflCust" IS NOT NULL)
AND T2."U_Integracao_sovis" = 1 
AND T2."U_filial" IS NOT NULL

GROUP BY 
T2."SlpCode",
T2."SlpName",
T5."U_MNO_ANO",
T2."U_MNO_Municipio",
T5."U_MNO_ANO",
T6."U_MNO_METAKG",
T6."U_MNO_METASC",
T6."U_MNO_METAREAIS",
T6."U_MNO_Mes"
