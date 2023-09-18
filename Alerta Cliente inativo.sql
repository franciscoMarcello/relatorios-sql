SELECT 
"CardCode",
"CardName" ,
"Phone1",
"E_Mail" ,
"SlpCode",
COALESCE((SELECT MAX("DocDate") FROM OINV WHERE OINV."CardCode" = OCRD."CardCode"),TO_VARCHAR(0)) AS "Ultima Venda"
FROM OCRD 
WHERE  "validFor" = 'Y' AND
"CardType" = 'C' AND 
DAYS_BETWEEN(COALESCE((SELECT MAX("DocDate") FROM OINV WHERE OINV."CardCode" = OCRD."CardCode"),TO_VARCHAR(0)),"CreateDate") >= 180