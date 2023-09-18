SELECT 
T0."DocEntry",
CASE 
	WHEN T0."U_Status" = 'C' THEN 'Cancelado'
	WHEN T0."U_Status" = 'E' THEN 'Encerrado'
	WHEN T0."U_Status" = 'A' THEN 'Aberto'
END AS "Status",
T2."CardName" AS "Nome do fornecedor",
T0."U_CodContrato" AS "Nº Contrato",
T0."U_Data" AS "Data de lançamento",
T1."U_CodRomaneio" AS "Romaneio",
T3."CreateDate" AS "Data do romaneio",
T3."U_PlacaCaminhao" AS "Placa",
T3."U_UFPlaca" AS "UF",
T3."U_CodItem" AS "Cód Item",
(SELECT "ItemName"  FROM OITM WHERE "ItemCode" = T3."U_CodItem") AS "Descrição do item",
T1."U_Quantidade" AS "Saldo"
FROM "@AMFS_ASVC" T0
INNER JOIN "@AMFS_ASVC1" T1 ON T0."DocEntry" = T1."DocEntry"
INNER JOIN OCRD T2 ON T0."U_CodFornecedor" = T2."CardCode"
INNER JOIN "@AMFS_RETR" T3 ON T1."U_CodRomaneio"  = T3."DocEntry" 