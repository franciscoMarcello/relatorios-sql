SELECT 
T0."U_NomParceiroNegocio",
T0."U_Quantidade",
T0."U_TipoDocumento",
T1."U_PesoLiquido" AS "Recebimento(SC)",
T1."U_PesoLiquido",
T0."U_CodigoSafra",
T1."U_PesoLiquidoDesc",
T0."U_NomeItem",
T0."U_CodParceiroNegocio",
T0."U_CodigoItem",
T0."U_TipoContrato",
T0."Code"
FROM
"SBOGRUPOROVEMA"."@AMFS_CNTR"  
T0 INNER JOIN  "SBOGRUPOROVEMA"."@AMFS_RETR"  T1 ON T0."Code" = T1."U_CodContrato" 
WHERE T0."Canceled" = 'N' AND  T1."Canceled"  = 'N'


