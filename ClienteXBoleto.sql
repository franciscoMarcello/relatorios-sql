SELECT 
C."CardCode" AS "Codigo SAP",
C."CardName" AS "Nome do Cliente",
(SELECT 
DISTINCT 
CASE
	WHEN "TaxId0" = '' THEN "TaxId4"
	WHEN "TaxId4" = '' THEN "TaxId0"
END 
FROM CRD7 WHERE CRD7."CardCode" = C."CardCode"  AND "Address"  = ''  )AS "CPF/CNPJ",
C."CreateDate" AS "Data de criação",
C."CreditLine" AS "Limite de credito",
C."CreditLine" - C."Balance" AS "Saldo",
V."SlpName",
COALESCE ((SELECT MAX("DocDate") FROM OINV WHERE OINV."CardCode" = C."CardCode"),TO_VARCHAR(0)) AS "Ultima venda",
N."Serial",
N."DocEntry",
B."OurNumber" AS "Nosso Número",
--B."Status",
P."DueDate" AS "Data de Vencimento",
P."InsTotal" AS "Valor da Parcela",
CP."DocDate" AS "Data de Pagamento",
CP."DocNum" AS "Codigo da baixa"
FROM 
OCRD C
INNER JOIN OSLP V ON C."SlpCode"  = V."SlpCode"  
INNER JOIN OINV N ON C."CardCode" = N."CardCode"
INNER JOIN INV6 P ON N."DocEntry" = P."DocEntry" 
LEFT JOIN "IV_IB_BillOfExchange" B ON N."DocEntry"  = B."DocEntry" AND B."InstallmentID" = P."InstlmntID"
LEFT JOIN "RCT2" CP2 ON CP2."DocEntry" = N."DocEntry"AND
CP2."DocTransId" = N."TransId" AND CP2."InstId" = P."InstlmntID" 
LEFT JOIN ORCT CP ON CP."DocEntry" = CP2."DocNum" 
WHERE 
 N."CANCELED" = 'N'
 AND N."BPLId" IN (2,4,11)
 AND N."DocDate" >= TO_DATE('20230701', 'YYYYMMDD')
 AND N."DocDate" <= TO_DATE('20230831', 'YYYYMMDD')
 AND B."Status" <> 5
ORDER BY N."DocDate", N."Serial"