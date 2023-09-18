SELECT 
T0."TransNum" AS "Nº Transação",
T0."TransType" AS "Tipo de documento" , 
T0."DocDate" AS "Data de lançamento" ,
T0."ItemCode" AS "Codigo do item",
T0."Dscription" AS "Nome do item",
T0."OutQty" AS "Quantidade que saiu",
T0."InQty" AS "Quantidade que entrou",
T0."Price" AS "Preço",
T0."Warehouse" AS "Deposito",
T0."TransValue" AS "Valor da transação",
T0."OpenValue" AS "Valor em aberto",
T1."InvntryUom" AS "UM",
T1."ItmsGrpCod" AS "Codigo do grupo de item",
T4."ItmsGrpNam" AS "Nome do grupo de item",
T2."WhsName" AS "Nome do Depósito",
T2."BPLid",
T3."BPLName"  AS "Filial"
FROM oinm T0
INNER JOIN OITM T1 ON T0."ItemCode" = T1."ItemCode" 
INNER JOIN OWHS T2 ON T0."Warehouse" = T2."WhsCode" 
INNER JOIN OBPL T3 ON T2."BPLid" = T3."BPLId" 
INNER JOIN OITB T4 ON T1."ItmsGrpCod" = T4."ItmsGrpCod" 
WHERE 
T0."DocDate" >= TO_DATE('20230801','YYYYMMDD')
AND T0."DocDate" <=TO_DATE('20230801','YYYYMMDD')




