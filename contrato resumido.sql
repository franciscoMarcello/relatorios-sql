
SELECT 
T0."Code",
T0."U_NumeroContrato" AS "Nº Contrato",
T1."Name",
T0."U_CodParceiroNegocio",
T0."U_NomParceiroNegocio", 
T0."U_Status",
T0."U_NomeItem",
T0."U_Quantidade"/(SELECT "BaseQty"  FROM UGP1 WHERE "UgpEntry" = 4 AND "UomEntry"  = 3) AS "KG", 
T0."U_Total" AS "Receita(R$)", 
T0."U_Quantidade"/(SELECT "BaseQty"  FROM UGP1 WHERE "UgpEntry" = 4 AND "UomEntry"  = 3) / 60 AS "Sacos(60kg)", 
T0."U_Saldo", 

COALESCE((SELECT  
SUM(nl."Quantity" * GRUPO."BaseQty"/(SELECT "BaseQty"  FROM UGP1 WHERE "UgpEntry" = 4 AND "UomEntry"  = 3)) AS "Soma"
FROM "@AGRI_CTVD"  C 
LEFT JOIN "@AGRI_UNPF"  F ON C."U_CodigoFazenda"=F."Code"
LEFT JOIN "@AGRI_RMSD"  R ON C."Code" = R."U_CodContratoVenda" 
LEFT JOIN "INV1"  NL ON NL."DocEntry" = R."U_CodDocumento" 
LEFT JOIN "OUOM" medida ON nl."UomEntry" = medida."UomEntry"
LEFT JOIN "UGP1" grupo ON grupo."UgpEntry" = 4 AND grupo."UomEntry" = medida."UomEntry"
WHERE R."U_CodContratoVenda" = T0."Code" 
AND R."U_Status" = 'E'),0) AS "Quantidade entregue",
COALESCE(SUM(CASE WHEN T2."U_Status" <> 'C' THEN T2."U_PesoLiquidoDesc" END),0) AS "total",
T0."U_QtdNF",
T0."U_CodItem",
T0."U_CodPeriodoProducao",
T0."U_DscPeriodoProducao",
T0."U_CodUnidadeMedida",
T0."U_CodMoeda"
FROM "@AGRI_CTVD"  T0 
LEFT JOIN "@AGRI_UNPF"  T1 ON T0."U_CodigoFazenda"=T1."Code"
LEFT JOIN "@AGRI_RMSD"  T2 ON T0."Code"=T2."U_CodContratoVenda" 

GROUP BY 
T0."U_QtdNF",
T0."U_CodItem",
T0."U_CodParceiroNegocio",
T0."U_NumeroContrato",
T0."Code", 
T1."Name",
T0."U_NomParceiroNegocio", 
T0."U_Status",
T0."U_NomeItem",
T0."U_Quantidade", 
T0."U_Total", 
T0."U_PesoTonelada",
T0."U_Saldo",
T0."U_QtdEntregue",
T0."U_CodPeriodoProducao",
T0."U_DscPeriodoProducao",
T0."U_CodUnidadeMedida",
T0."U_CodMoeda"


