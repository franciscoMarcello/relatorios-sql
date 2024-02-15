SELECT 
OS."DocEntry",
"U_CodEquipam",
"U_DscMotivo",
"U_DscClassMa",
"U_DtEntrada",
"U_NomeMecanico",
"U_DtEncerram",
"U_HorimOdome",
"U_ServiExect",
"U_Origem",
"U_CustoAplicacoes",
"U_CustoMecanicos",
"U_HoraEntrada",
"U_HoraEncerramento",
OS."U_Status",
"U_HoriHodoEnt",
"U_CodFazenda",
"U_CodSetor",
"U_CodTalhao",
"U_DscFazenda",
"U_CodSetor",
TH."Name" AS "DesTalhao"
FROM
"@AGRI_OSOF" OS
LEFT JOIN "@AGRI_UNPT" TH ON OS."U_CodTalhao" = TH."Code"




