SELECT 
"BPLName" ,
SUM("DocTotal") AS "Total Faturado"
FROM OINV 
WHERE "CANCELED" = 'N' AND
"DocDate" = TO_DATE('20230523','YYYYMMDD') AND
"BPLId" IN(2,5,4,11) AND
"U_id_pedido_forca" > 0 AND "U_id_pedido_forca" IS NOT NULL AND "U_id_pedido_forca" <> ''
GROUP BY
"BPLName" 


SELECT 
"BPLName" ,
SUM("DocTotal") AS "Total Pedidos em aberto"
FROM ORDR 
WHERE "CANCELED" = 'N' AND
"DocDate" = TO_DATE('20230523','YYYYMMDD') AND
"BPLId" IN(2,5,4,11) AND
"U_id_pedido_forca" > 0 AND "U_id_pedido_forca" IS NOT NULL AND "U_id_pedido_forca" <> '' AND "DocStatus" = 'O'
GROUP BY
"BPLName" 