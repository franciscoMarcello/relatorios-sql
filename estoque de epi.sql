SELECT 
O."DocEntry",
"DocNum" AS "Nº Doc",
O."DocDate" AS "Data de lançamento",
O."BPLId",
O."BPLName" AS "Filial",
L."ItemCode" AS "Codigo do item",
L."Dscription" AS "Item",
GI."ItmsGrpNam" AS "Grupo de itens",
GI."ItmsGrpCod" AS "Codigo do grupo do item",
L."Quantity" AS "Qunatidade",
L."Price" AS "Preço",
L."StockPrice" AS "Preço do estoque",
L."LineTotal" AS "Total saida"
FROM OIGE O
INNER JOIN IGE1 L  ON O."DocEntry"  = L."DocEntry" 
INNER JOIN OITM I ON L."ItemCode" = I."ItemCode"
INNER JOIN OITB GI ON I."ItmsGrpCod" = GI."ItmsGrpCod" 



SELECT "ItmsGrpCod" , "ItmsGrpNam"  FROM OITB ORDER BY "ItmsGrpNam" 