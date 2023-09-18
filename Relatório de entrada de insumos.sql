SELECT
T0."DocEntry",
T0."DocNum",
T0."U_Status" as "Status Romaneio"
,T1."U_CodigoFilial",
T0."U_DataEntrada",
T0."CreateDate",
T0."U_DscFazenda",
T0."U_DtEmissaoNota",
T0."U_NumeroNota",
T1."U_NomeItem",
T1."Code",
T1."U_NomParceiroNegocio",
T1."U_Status" as "Status Registro",
T0."U_PlacaCaminhao",
T0."U_Motorista",
T0."U_NomeTransportador",
T0."U_NumeroTicket",
T0."U_PesoLiquidoDesc",
T0."U_PesoBruto",
T0."U_PesoTara",
T0."U_PesoLiquido",
T1."U_Quantidade",
T0."U_PesoNota",
T0."U_CodTransportador",
T0."U_Diferenca",
T2."U_CodUnRecep",
T2."U_DscUnRecep",
T1."U_NumeroContrato",
T0."U_DscSafra",
T0."U_Moeda",
T1."U_CodParceiroNegocio",
T1."U_CodigoItem",
T4."Quantity"
FROM "@PECU_REGR"  T0
LEFT JOIN "@PECU_RCIS"  T1 ON T0."U_CodRegistroCompra" = T1."Code"
LEFT JOIN "@AGRI_BOLC"  T2 ON T0."U_NumeroBoletim" = T2."DocNum"
LEFT JOIN OIGN T3 ON T0."DocEntry" = T3."U_CodOrigemAgri" 
INNER JOIN IGN1 T4 ON T3."DocEntry" = T4."DocEntry" 









