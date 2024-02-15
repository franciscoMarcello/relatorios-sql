SELECT
SM."DocEntry",
SM."DocNum" AS "Nº Requsição",
SM."DocDate" AS "Data de lançamento",
SM."U_Rov_Funcionario" AS "Nome do funcionario",
SM."Comments" AS "Observações",
SM."BPLName" AS "Filial"
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
FROM IGE1 PCL



--SELECT * FROM CRD7 WHERE "TaxId0" IS NOT NULL AND "CardCode" = 'FOR0000149'


