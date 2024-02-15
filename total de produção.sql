SELECT sum("PlannedQty") AS "Total produzido SAP", sum("PlannedQty") - 356288.5680 AS "Diferença sigafran",
356288.5680/sum("PlannedQty")-1 AS "Diferança porcentagem" FROM OWOR
WHERE "Status"  = 'L' 
AND ("ItemCode" LIKE '%PDC%' OR "ItemCode" LIKE '%INS%')
AND "Type"  = 'S' 
AND "CloseDate" >= '20231001' 
AND "CloseDate" <= '20231006'



SELECT SUM("U_LbrOne_Batelada") AS "Batelada" ,"ItemCode" AS "Codigo" , "ProdName" AS "Formula", sum("PlannedQty") AS "Total produzido" FROM OWOR o 
WHERE   ("ItemCode" LIKE '%PDC%' OR "ItemCode" LIKE '%INS%')
AND "Type"  = 'S' 
AND "CreateDate"  >= '20231001' 
AND "CreateDate" <= '20231006'
AND "Status"  = 'L' 
GROUP BY "ItemCode" , "ProdName"


SELECT "DocEntry","DocNum", "CreateDate" AS "Data inicio", "CloseDate" AS "Data final", "U_LbrOne_Batelada" AS "Batelada" ,"ItemCode" AS "Codigo" , "ProdName" AS "Formula", "PlannedQty" AS "Total produzido" FROM OWOR o 
WHERE  "ItemCode" = 'PDC0000080'
AND "Type"  = 'S' 
AND "CreateDate"  >= '20230910' 
AND "CreateDate" <= '20231006'
AND "Status"  = 'L' 
ORDER BY "DocEntry" 



