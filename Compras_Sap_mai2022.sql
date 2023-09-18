SELECT 
(SELECT 
DISTINCT 
CASE
	WHEN "TaxId0" = '' THEN "TaxId4"
	WHEN "TaxId4" = '' THEN "TaxId0"
END 
FROM CRD7 WHERE CRD7."CardCode" = C."CardCode"  AND "Address"  = ''  )AS "CPF/CNPJ",
N."CardName" AS "Razão social",
N."DocDate" AS "Data de lançamento",
C."Phone1" AS "Contato",
C."Phone1" AS "Telefone",
C."Address" AS "Endereço",
C."City" AS "Cidade",
(SELECT "CNAEId" FROM CRD7 WHERE CRD7."CardCode" =  N."CardCode" AND  "AddrType" = ''  ) AS "CNAE",
G."GroupName" AS "Seguemento",
P."AcctName" AS "Nome da conta",
L."Dscription" AS "Produto",
O."Usage" AS "Despesa",
L."LineTotal" AS "Valor",
N."BPLName" AS "Filial"
FROM OPCH N
INNER JOIN PCH1 L ON N."DocEntry" = L."DocEntry"
INNER JOIN OCRD C ON N."CardCode" = C."CardCode"
INNER JOIN OUSG O ON L."Usage" = O."ID"
INNER JOIN OCRG G ON C."GroupCode" = G."GroupCode"
INNER JOIN OACT P ON L."AcctCode" = P."AcctCode"
WHERE 
N."DocDate" >= TO_DATE('20220501' , 'YYYYMMDD') AND 
N."DocDate" <= TO_DATE('20230530' , 'YYYYMMDD')
ORDER BY N."DocDate" 


