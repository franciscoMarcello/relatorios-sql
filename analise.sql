
	
	--CUPOM COM O CLIENTE DIFERENTE DO PARCEIRO DE CONSUMIDOR FINAL
	SELECT * FROM OINV T0 WHERE
	T0."CardCode" <> 'CLI0003676'
	AND T0."Model" = 54
	AND T0.CANCELED = 'N'
	
	
	SELECT * FROM OINV T0 WHERE
	T0."CardCode" = 'CLI0003676'
	AND T0."Model" = 39
	AND T0.CANCELED = 'N'
	
	
--Comparação sovis x sap
	CREATE VIEW "SAPXSOVIS" as
SELECT 
	SUM(CASE WHEN "UserSign" = 162 THEN 1 ELSE 0 END) AS Sovis,
	SUM(CASE WHEN "UserSign" <> 162 THEN 1 ELSE 0 END) AS Manual,
	MONTH("DocDate")  AS mes
FROM 
	ordr
WHERE	
	"DocDate" >= '20230201'
	AND "DocDate" <= CURRENT_DATE
	AND CANCELED = 'N'
GROUP BY
	MONTH("DocDate") 
	
	
	SELECT * FROM "SAPXSOVIS"
	
SELECT 
	SUM(CASE WHEN "U_id_pedido_forca" IS NOT NULL and "U_id_pedido_forca" <> '' and "U_id_pedido_forca" <> '0' THEN 1 ELSE 0 END) AS Sovis,
	SUM(CASE WHEN "U_id_pedido_forca" IS NULL or "U_id_pedido_forca" = '' OR "U_id_pedido_forca" = '0'  THEN 1 ELSE 0 END) AS Manual,
	MONTH("DocDate")  AS mes
FROM 
	OINV
WHERE	
	"DocDate" >= '20230201'
	AND "DocDate" <= CURRENT_DATE() 
	AND CANCELED = 'N'
	AND "BPLId" IN(2,4,11,17)
GROUP BY
	MONTH("DocDate")
	
SELECT 
	CASE WHEN "U_id_pedido_forca" IS NOT NULL and "U_id_pedido_forca" <> '' THEN 1 ELSE 0 END AS Sovis,
	CASE WHEN "U_id_pedido_forca" IS NULL or "U_id_pedido_forca" = '' THEN 1 ELSE 0 END AS Manual,
	"U_id_pedido_forca"
FROM 
	OINV
WHERE	
	"DocDate" >= '20230201'
	AND "DocDate" <= CURRENT_DATE() 
	AND CANCELED = 'N'
	AND "BPLId" IN(2,4,11,17)
	
	SELECT * FROM OUSR WHERE USER_CODE = 'ROVEMA'
	
	
	
	SELECT count("DocEntry") AS "Pedidos sap"
	FROM ordr
	where
	 "DocDate" >= '20230501'
	AND "DocDate" <= '20231026'
	AND CANCELED = 'N'
	

	
	
