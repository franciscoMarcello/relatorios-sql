




IF EXISTS(
SELECT
1
FROM 
OINV T0 
INNER JOIN INV1 T1 ON T0."DocEntry" = T1."DocEntry"
WHERE 
(T0."U_TX_RF_TObr" = '' OR T0."U_TX_RF_TObr" IS NULL 
OR T0."U_TX_RF_TRep" = '' OR T0."U_TX_RF_TRep" IS NULL
OR T0."U_TX_RF_ICom" = '' OR T0."U_TX_RF_ICom" IS NULL
OR T0."U_TX_RF_IAquis" = '' OR T0."U_TX_RF_IAquis" IS NULL)
AND T1."Usage" = 66
AND T0."DocEntry" = 20214
)


SELECT
1
FROM 
OPCH T0 
WHERE 
T0."CardCode" 
in(
SELECT 
CRD11."CardCode"
FROM CRD11 
INNER JOIN OCRD ON OCRD."CardCode" = CRD11."CardCode" 
WHERE CRD11."TributType" IN (14,15,16,17,19)
OR
(CRD11."TributType" = 11 
AND OCRD."U_LBR_FOLHA_PGTO" = 'COM'))
AND (T0."U_TX_RF_TObr" = '' OR T0."U_TX_RF_TObr" IS NULL 
OR T0."U_TX_RF_TRep" = '' OR T0."U_TX_RF_TRep" IS NULL
OR T0."U_TX_RF_ICom" = '' OR T0."U_TX_RF_ICom" IS NULL
OR T0."U_TX_RF_IAquis" = '' OR T0."U_TX_RF_IAquis" IS NULL)
AND T0."DocEntry" = 20210


SELECT 
  	1
  	FROM
  	OINV T0
  	WHERE
  	T0."CardCode" 
	in(
	SELECT
	OCRD."CardCode"
	FROM OCRD
	WHERE
	(OCRD."U_TX_RF_IPre" = '' OR OCRD."U_TX_RF_IPre" IS null  
	OR OCRD."U_TX_RF_IsTrFolha" = '' OR OCRD."U_TX_RF_IsTrFolha" IS NULL))
	AND T0."DocEntry" = 20210

