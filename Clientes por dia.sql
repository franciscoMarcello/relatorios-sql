
SELECT DISTINCT  
T0."CardCode",
T0."CardName",
T0."CreateDate",
(SELECT 
DISTINCT 
CASE
	WHEN "TaxId0" = '' THEN "TaxId4"
	WHEN "TaxId4" = '' THEN "TaxId0"
END 
FROM CRD7 WHERE CRD7."CardCode" = T0."CardCode"  AND "Address"  = ''  )AS "CPF/CNPJ",
T2."SlpCode",
T3."City" ,
T0."Phone1" AS "Telefone",
T0."Phone2" AS "Telefone 2",
T2."SlpName" 
FROM "OCRD" T0
INNER JOIN OSLP T2 ON T0."SlpCode" = T2."SlpCode"
INNER JOIN "CRD1" T3 ON T0."CardCode" = T3."CardCode" 
  WHERE T0."CardType"  = 'C' 