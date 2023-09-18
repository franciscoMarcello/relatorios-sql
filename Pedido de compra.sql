SELECT
PC."DocEntry",
PC."DocNum" AS "Nº Pedido",
PC."DocDate" AS "Data de lançamento",
SM.
COALESCE (F."Phone1",'-') AS "Telefone",
F."Address" AS "Endereço",
F."ZipCode" AS "CEP",
COALESCE (F."E_Mail",'-') AS "Email",
PC."Comments" AS "Observações",
COALESCE((SELECT 
DISTINCT 
CASE
	WHEN "TaxId0" = '' THEN "TaxId4"
	WHEN "TaxId4" = '' THEN "TaxId0"
END 
FROM CRD7 WHERE CRD7."CardCode" = PC."CardCode"  AND "Address"  = ''  ),'-')AS "CPF/CNPJ",
SM."BPLName" AS "Filial",
FROM OIGE SM 
WHERE SM."DocEntry" = 


SELECT 
PCL."DocEntry",
PCL."ItemCode" AS "Codigo do produto",
PCL."Dscription" AS "Descrição do item",
PCL."UomCode" AS "Unidade",
PCL."Quantity" AS "Quantidade",
PCL."Price" AS "Preço un. (R$)",
PCL."LineTotal" AS "SubTotal (R$)"
FROM POR1 PCL



--SELECT * FROM CRD7 WHERE "TaxId0" IS NOT NULL AND "CardCode" = 'FOR0000149'