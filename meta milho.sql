SELECT 
    "SlpName",
	"SlpCode",
	"nomeCordenador",
	"U_MNO_Municipio",
    "Ano",
	"Meta(Kg)",
	"Meta(Sc)",
	"Meta(R$)",
	"U_MNO_Mes",
	"Mes",
	SUM("Faturado(SC)") AS "Faturado(SC)",
	SUM("Faturado(kg)") AS "Faturado(kg)",
	sum("Faturado Bruto") AS "Faturado Bruto", 
	sum("Frete") AS "Frete"
FROM (
SELECT
	DISTINCT 
	T2."SlpName",
	T2."SlpCode",
	T0."DocEntry",
	cordena."nomeCordenador",
	T2."U_MNO_Municipio",
    T5."U_MNO_ANO" AS "Ano",
	T6."U_MNO_METAKG" AS "Meta(Kg)",
	T6."U_MNO_METASC" AS "Meta(Sc)",
	T6."U_MNO_METAREAIS" AS "Meta(R$)",
	T6."U_MNO_Mes",
	CASE
		WHEN UPPER("U_MNO_Mes") = 'JANEIRO' THEN 1 || '-' || T5."U_MNO_ANO"
		WHEN UPPER("U_MNO_Mes") = 'FEVEREIRO' THEN 2 || '-' || T5."U_MNO_ANO"
		WHEN UPPER("U_MNO_Mes") = 'MARÇO' THEN 3 || '-' || T5."U_MNO_ANO"
		WHEN UPPER("U_MNO_Mes") = 'ABRIL' THEN 4 || '-' || T5."U_MNO_ANO"
		WHEN UPPER("U_MNO_Mes") = 'MAIO' THEN 5 || '-' || T5."U_MNO_ANO"
		WHEN UPPER("U_MNO_Mes") = 'JUNHO' THEN 6 || '-' || T5."U_MNO_ANO"
		WHEN UPPER("U_MNO_Mes") = 'JULHO' THEN 7 || '-' || T5."U_MNO_ANO"
		WHEN UPPER("U_MNO_Mes") = 'AGOSTO' THEN 8 || '-' || T5."U_MNO_ANO"
		WHEN UPPER("U_MNO_Mes") = 'SETEMBRO' THEN 9 || '-' || T5."U_MNO_ANO"
		WHEN UPPER("U_MNO_Mes") = 'OUTUBRO' THEN 10 || '-' || T5."U_MNO_ANO"
		WHEN UPPER("U_MNO_Mes") = 'NOVEMBRO' THEN 11 || '-' || T5."U_MNO_ANO"
		WHEN UPPER("U_MNO_Mes") = 'DEZEMBRO' THEN 12 || '-' || T5."U_MNO_ANO"
		ELSE "U_MNO_Mes"
	END AS "Mes",
	SUM(T1."Quantity") AS "Faturado(SC)",
	SUM(T1."Quantity" * grupo."BaseQty" ) AS "Faturado(kg)",
	COALESCE(
	CASE
		WHEN T0."DocTotal" = 0 THEN T0."DpmAmnt"
		ELSE T0."DocTotal"
	END
	
	,0
	) AS "Faturado Bruto",
	COALESCE(T3."LineTotal", 0)AS "Frete"
FROM
	oinv T0
INNER JOIN INV1 T1 ON
	T0."DocEntry" = T1."DocEntry"
INNER JOIN OSLP T2 ON
	T0."SlpCode" = T2."SlpCode"
LEFT JOIN INV3 T3 ON
	T0."DocEntry" = T3."DocEntry"
LEFT JOIN "RIN21" T4 ON
	T0."DocNum" = T4."RefDocNum"
LEFT JOIN "@MNO_META" T5 ON
	T0."SlpCode" = T5."U_MNO_Vendedor" AND T5."U_MNO_ANO" = YEAR(T0."DocDate")
LEFT JOIN "MNO_META_LINHA" T6 ON
	T5."Code" = T6."Code" AND MONTH(T0."DocDate") = "Mes"
INNER JOIN oitm T7 ON
	T1."ItemCode" = T7."ItemCode"
LEFT JOIN "OUOM" medida ON
	T1."UomCode" = medida."UomCode"
LEFT JOIN "UGP1" grupo ON
	grupo."UgpEntry" = 4
	AND grupo."UomEntry" = medida."UomEntry"
LEFT JOIN "CORDENADORESTRUTURA" cordena ON
	T2."SlpCode" = cordena."codVendedor"
WHERE
	T0.CANCELED = 'N'
	AND T0."DocDate" >={?data1}
	AND T0."DocDate" <={?data2}
	AND T1."Usage" in(9,16)
               AND T7."U_categoria" = 'milho'
	AND T7."U_grupo_sustennutri" in('quirela', 'milho')
	AND T4."RefDocNum" IS NULL
	AND T0."U_Rov_Refaturamento" = 'NAO'
	AND T0."CardCode" NOT IN(
	SELECT
		"DflCust"
	FROM
		OBPL
	WHERE
		"DflCust" IS NOT NULL)
	AND T2."U_Integracao_sovis" = 1
	AND T2."U_filial" IS NOT NULL
GROUP BY
	T2."SlpCode",
	T2."SlpName",
	T2."U_MNO_Municipio",
	T0."DocEntry",
	T0."DocTotal",
	T5."U_MNO_ANO",
	T5."U_MNO_ANO",
	T6."U_MNO_METAKG",
	T6."U_MNO_METASC",
	T6."U_MNO_METAREAIS",
	T6."U_MNO_Mes",
	T3."LineTotal",
	T0."DpmAmnt",
	cordena."nomeCordenador"
	)
	GROUP BY
	"SlpName",
	"SlpCode",
	"nomeCordenador",
	"U_MNO_Municipio",
    "Ano",
	"Meta(Kg)",
	"Meta(Sc)",
	"Meta(R$)",
	"U_MNO_Mes",
	"Mes"