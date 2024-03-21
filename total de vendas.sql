SELECT DISTINCT 
T0."DocEntry",
T0."CardCode",
T0."CardName",
T0."DocTotal",
T0."DpmAmnt",
T0."Serial",
T0."Comments",
T1."ItemCode",
T1."Dscription",
T1."Quantity",
T0."DocDate",
T1."DiscPrcnt",
T1."UomCode",
T4."SlpCode",
T1."Commission",
T4."SlpName",
T0."BPLId" ,
COALESCE (T6."LineTotal",'0') AS "Frete",
T7."PymntGroup",
T7."GroupNum",
grupo."BaseQty",
T9."U_categoria",
T9."U_linha_sustennutri" ,
T9."U_grupo_sustennutri" 


FROM "OINV"  T0 
INNER JOIN "INV1"  T1 ON T0."DocEntry" = T1."DocEntry" 
INNER JOIN oitm T9 ON T1."ItemCode" = T9."ItemCode"
INNER JOIN  "OSLP"  T4 ON T0."SlpCode" = T4."SlpCode"
INNER JOIN OCTG T7 ON T0."GroupNum" = T7."GroupNum" 
LEFT JOIN RIN21 T5 ON T0."DocNum" = T5."RefDocNum"
LEFT JOIN INV3 T6 ON T0."DocEntry" = T6."DocEntry" 
LEFT JOIN "OUOM" medida ON T1."UomCode" = medida."UomCode"
LEFT JOIN "UGP1" grupo ON grupo."UgpEntry" = 4 AND grupo."UomEntry" = medida."UomEntry"
WHERE T5."RefDocNum"  IS NULL AND
T0."CANCELED" = 'N' AND
(T1."Usage"  = 9 OR  T1."Usage"  = 16)

  AND  T0."DocDate" >={?Data}AND T0."DocDate" <={?DataFinal} 
and T0."U_Rov_Refaturamento" = 'NAO'