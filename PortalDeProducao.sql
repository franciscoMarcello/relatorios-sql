CREATE OR REPLACE  VIEW SBOGRUPOROVEMA.PAINELDEPRODUCAO AS
SELECT 
DISTINCT 
OITM."ItemCode" AS "Codigo do item",
OITB."ItmsGrpNam" AS "Linha de Produto", 
OITM."ItemName"  AS "Item",
SUM(RDR1."Quantity") AS "QTD/Pedidos",
COALESCE((SELECT "MinStock" FROM OITW WHERE "WhsCode" =500.01 AND OITW."ItemCode" = OITM."ItemCode"  ),0) AS "Estoque Minimo",
COALESCE((SELECT "OnHand" FROM OITW WHERE "WhsCode" =500.01 AND OITW."ItemCode" = OITM."ItemCode"  ),0) AS "Estoque atual",
COALESCE((SELECT "OnHand" FROM OITW WHERE "WhsCode" =500.01 AND OITW."ItemCode" = OITM."ItemCode"  )- SUM(RDR1."Quantity"),0)  AS "Produzir",
COALESCE((SELECT SUM(INV1."Quantity") FROM INV1 INNER JOIN OINV ON INV1."DocEntry" = OINV."DocEntry"  WHERE INV1."Usage" = 16 AND INV1."ItemCode" = OITM."ItemCode" AND OINV."DocStatus" = 'O' ),0) AS "Quantidade sem Previsão"
FROM ORDR 
INNER JOIN RDR1 ON ORDR."DocEntry" = RDR1."DocEntry" 
INNER JOIN OITM ON RDR1."ItemCode" = OITM."ItemCode" 
INNER JOIN OITB ON OITM."ItmsGrpCod" = OITB."ItmsGrpCod"
WHERE "DocStatus" = 'O' AND
"CANCELED" = 'N' AND
RDR1."ItemCode" LIKE 'PAC%%'AND
OITM."validFor" = 'Y' AND
RDR1."Usage" = 9
GROUP BY OITM."ItemCode" , OITM."ItemName",OITB."ItmsGrpNam";