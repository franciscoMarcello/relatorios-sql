Select 
N."Serial" AS "Nº Nota",
N."DocEntry",
N."DocNum" AS "Nº Documento",
P."KeyNfe" AS "Chave de acesso",
N."DocDate" AS "Data de criação",
CASE 
	WHEN N."DocStatus" = 'C' AND N."CANCELED" = 'Y' THEN 'Cancelado'
	WHEN N."DocStatus" = 'C' AND N."CANCELED" = 'N' THEN 'Fechado'
	ELSE 'Aberto'
END
 AS "Status SAP",
S."Description" AS "Status SEFAZ",
'Nota' AS "Tipo documento",
N."BPLName" AS "Filial"
From "Process" P 
INNER JOIN OINV N ON P."DocEntry" = N."DocEntry"  AND P."DocType" = N."ObjType"
INNER JOIN "ProcessStatus" S ON P."StatusId" = S."ID"
WHERE 
P."StatusId"  NOT IN(4,17,10) 
--AND N.CANCELED = 'Y'
AND N."Model" = 39

UNION

Select 
N."Serial" AS "Nº Nota",
N."DocEntry",
N."DocNum" AS "Nº Documento",
P."KeyNfe" AS "Chave de acesso",
N."DocDate" AS "Data de criação",
CASE 
	WHEN N."DocStatus" = 'C' AND N."CANCELED" = 'Y' THEN 'Cancelado'
	WHEN N."DocStatus" = 'C' AND N."CANCELED" = 'N' THEN 'Fechado'
	ELSE 'Aberto'
END
 AS "Status SAP",
S."Description" AS "Status Sefaz",
'Entrega' AS "Tipo documento",
N."BPLName" AS "Filial"
From "Process" P 
INNER JOIN ODLN N ON P."DocEntry" = N."DocEntry"  AND P."DocType" = N."ObjType"
INNER JOIN "ProcessStatus" S ON P."StatusId" = S."ID"
WHERE 
P."StatusId"  NOT IN(4,17,10)  
--AND N.CANCELED = 'Y'
AND N."Model" = 39

UNION

Select 
N."Serial" AS "Nº Nota",
N."DocEntry",
N."DocNum" AS "Nº Documento",
P."KeyNfe" AS "Chave de acesso",
P."CreateDate" AS "Data de criação",
CASE 
	WHEN N."DocStatus" = 'C' AND N."CANCELED" = 'Y' THEN 'Cancelado'
	WHEN N."DocStatus" = 'C' AND N."CANCELED" = 'N' THEN 'Fechado'
	ELSE 'Aberto'
END
 AS "Status SAP",
S."Description" AS "Status SEFAZ",
'Devolução de nota fiscal de saida' AS "Tipo documento",
N."BPLName" AS "Filial"
From "Process" P 
INNER JOIN ORIN N ON P."DocEntry" = N."DocEntry"  AND P."DocType" = N."ObjType"
INNER JOIN "ProcessStatus" S ON P."StatusId" = S."ID"
WHERE 
P."StatusId"  NOT IN(4,17,10)  
-- AND N.CANCELED = 'Y'
AND N."Model" = 39

UNION

Select 
N."Serial" AS "Nº Nota",
N."DocEntry",
N."DocNum" AS "Nº Documento",
P."KeyNfe" AS "Chave de acesso",
P."CreateDate" AS "Data de criação",
CASE 
	WHEN N."DocStatus" = 'C' AND N."CANCELED" = 'Y' THEN 'Cancelado'
	WHEN N."DocStatus" = 'C' AND N."CANCELED" = 'N' THEN 'Fechado'
	ELSE 'Aberto'
END
 AS "Status SAP",
S."Description" AS "Status SEFAZ",
'Devolução de mercadoria' AS "Tipo documento",
N."BPLName" AS "Filial"
From "Process" P 
INNER JOIN ORDN N ON P."DocEntry" = N."DocEntry"  AND P."DocType" = N."ObjType"
INNER JOIN "ProcessStatus" S ON P."StatusId" = S."ID"
WHERE 
P."StatusId"  NOT IN(4,17,10) 
-- AND N.CANCELED = 'Y'
AND N."Model" = 39

UNION

Select 
N."Serial" AS "Nº Nota",
N."DocEntry",
N."DocNum" AS "Nº Documento",
P."KeyNfe" AS "Chave de acesso",
P."CreateDate" AS "Data de criação",
CASE 
	WHEN N."DocStatus" = 'C' AND N."CANCELED" = 'Y' THEN 'Cancelado'
	WHEN N."DocStatus" = 'C' AND N."CANCELED" = 'N' THEN 'Fechado'
	ELSE 'Aberto'
END
 AS "Status SAP",
S."Description" AS "Status SEFAZ",
'Nota de entrada' AS "Tipo documento",
N."BPLName" AS "Filial"
From "Process" P 
INNER JOIN OPCH N ON P."DocEntry" = N."DocEntry"  AND P."DocType" = N."ObjType"
INNER JOIN "ProcessStatus" S ON P."StatusId" = S."ID"
WHERE 
P."StatusId"  NOT IN(4,17,10) 
-- AND N.CANCELED = 'Y'
AND N."Model" = 39

UNION

Select 
N."Serial" AS "Nº Nota",
N."DocEntry",
N."DocNum" AS "Nº Documento",
P."KeyNfe" AS "Chave de acesso",
P."CreateDate" AS "Data de criação",
CASE 
	WHEN N."DocStatus" = 'C' AND N."CANCELED" = 'Y' THEN 'Cancelado'
	WHEN N."DocStatus" = 'C' AND N."CANCELED" = 'N' THEN 'Fechado'
	ELSE 'Aberto'
END
 AS "Status SAP",
S."Description" AS "Status SEFAZ",
'Recebimento de mecadoria' AS "Tipo documento",
N."BPLName" AS "Filial"
From "Process" P 
INNER JOIN OPDN N ON P."DocEntry" = N."DocEntry"  AND P."DocType" = N."ObjType"
INNER JOIN "ProcessStatus" S ON P."StatusId" = S."ID"
WHERE 
P."StatusId"  NOT IN(4,17,10) 
--AND N.CANCELED = 'Y'
AND N."Model" = 39



UNION

Select 
N."Serial" AS "Nº Nota",
N."DocEntry",
N."DocNum" AS "Nº Documento",
P."KeyNfe" AS "Chave de acesso",
P."CreateDate" AS "Data de criação",
CASE 
	WHEN N."DocStatus" = 'C' AND N."CANCELED" = 'Y' THEN 'Cancelado'
	WHEN N."DocStatus" = 'C' AND N."CANCELED" = 'N' THEN 'Fechado'
	ELSE 'Aberto'
END
 AS "Status SAP",
S."Description" AS "Status SEFAZ",
'Devolução de mercadoria de entrada' AS "Tipo documento",
N."BPLName" AS "Filial"
From "Process" P 
INNER JOIN ORPD N ON P."DocEntry" = N."DocEntry"  AND P."DocType" = N."ObjType"
INNER JOIN "ProcessStatus" S ON P."StatusId" = S."ID"
WHERE 
P."StatusId"  NOT IN(4,17,10) 
--AND N.CANCELED = 'Y'
AND N."Model" = 39

UNION 

Select 
N."Serial" AS "Nº Nota",
N."DocEntry",
N."DocNum" AS "Nº Documento",
P."KeyNfe" AS "Chave de acesso",
P."CreateDate" AS "Data de criação",
CASE 
	WHEN N."DocStatus" = 'C' AND N."CANCELED" = 'Y' THEN 'Cancelado'
	WHEN N."DocStatus" = 'C' AND N."CANCELED" = 'N' THEN 'Fechado'
	ELSE 'Aberto'
END
 AS "Status SAP",
S."Description" AS "Status SEFAZ",
'Devolução de nota de entrada' AS "Tipo documento",
N."BPLName" AS "Filial"
From "Process" P 
INNER JOIN ORPC N ON P."DocEntry" = N."DocEntry"  AND P."DocType" = N."ObjType"
INNER JOIN "ProcessStatus" S ON P."StatusId" = S."ID"
WHERE 
P."StatusId"  NOT IN(4,17,10) 
--AND N.CANCELED = 'Y'
AND N."Model" = 39
ORDER BY "Data de criação"



--SELECT * FROM "Process" WHERE "DocEntry" = 784


