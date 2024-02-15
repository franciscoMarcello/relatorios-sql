SELECT DISTINCT T0."CardCode" AS "Codigo_PN", 
C0."CardName" AS "Razao_Social", 
C7."TaxId0" as "CNPJ",
C7."TaxId1" as "IE",
C7."TaxId4" as "CPF",
C0."Phone1" as "Telefone",
C0."E_Mail" as "Email",
C1."AddrType" as "Logradouro", 
C1."Street" as "Rua", 
C1."StreetNo" as "Numero", 
C1."Block" as "Bairro", 
C1."ZipCode" as "CEP", 
C1."City" as "Cidade",
C1."State" as "Estado",
    CASE T2."InvType" 
        WHEN '30' THEN N0."NumAtCard" 
        WHEN '24' THEN T2."DocEntry" 
        ELSE IFNULL(n0."Serial", 
        IFNULL(L0."TransId", N1."DocNum"))  
        END AS "Num_Docto", 
--CAST(IFNULL(T2."Parcela", '0') AS nvarchar(2)) AS "Parcela", 
    CASE T2."InvType" 
        WHEN '30' THEN 'LC' 
        WHEN '24' THEN 'CR' 
        WHEN '203' THEN 'AD' 
        ELSE 'NF'  END AS "Tipo_Docto", 
    CASE T2."InvType" 
        WHEN '30' THEN L0."TransId" 
        WHEN '203' THEN N1."DocEntry" 
        WHEN '24' THEN T0."DocEntry" 
        ELSE N0."DocEntry" END AS "DocEntry",
   T2."DocEntry"  AS "Doc_Origem", 
    CASE T2."InvType" 
        WHEN '30' THEN L0."RefDate" 
        WHEN '203' THEN N1."DocDate" 
        WHEN '24' THEN T0."DocDate" 
        ELSE N0."DocDate" 
    END AS "Emissao",
N0."PeyMethod",
T10."Fine" as "Multa",
T10."Interest" as "Juros",
T10."AplicarMultaAposDiaDoVencimento" as "Dias Multa",
T10."AplicarJurosAposDiaDoVencimento" as "Dias Juros",
T4."DueDate" AS "Vencimento", 
t0."BoeSum" AS "Valor_Original", 
t0."BoeSum" AS "Valor_Aberto", 
    CASE 
        WHEN T0."BoeSum" > 0 THEN 'BOL' 
        ELSE 
        CASE 
            WHEN T0."CheckSumSy" > 0 THEN 'CHQ' 
            ELSE 
            CASE 
                WHEN T0."CashSum" > 0 THEN 'DIN' 
                ELSE 
                CASE 
                    WHEN T0."TrsfrSum" > 0 THEN 'TRF' 
                    ELSE 
                    CASE 
                        WHEN T0."CreditSum" > 0 THEN 'CAR' 
                    END 
                END 
            END 
        END 
    END AS "Forma de pagamento", 
    CASE T4."BoeStatus" 
        WHEN 'G' THEN 'Gerado' 
        WHEN 'D' THEN 'Depositado' 
        WHEN 'C' THEN 'Cancelado' 
        ELSE 'Pago' 
    END AS "Status", T0."BPLId", T0."BPLName" 
FROM "ORCT" T0 
    INNER JOIN "OBOE" T4 ON T4."BoeKey" = T0."BoeAbs" 
    INNER JOIN "RCT2" T2 ON T2."DocNum" = T0."DocNum" 
    INNER JOIN "OCRD" C0 ON T0."CardCode" = C0."CardCode" 
    LEFT OUTER JOIN CRD1 C1 ON C1."CardCode" = C0."CardCode" and C1."AdresType" = 'S' 
    LEFT OUTER JOIN "CRD7" C7 ON C7."CardCode" = C0."CardCode"  AND C7."Address" = '' 
    LEFT OUTER JOIN "OINV" N0 ON T2."DocEntry" = N0."DocEntry" AND T2."InvType" = N0."ObjType" 
    LEFT OUTER JOIN "OJDT" L0 ON L0."TransId" = T2."DocEntry" AND T2."InvType" = '30' 
    AND             l0."TransId" NOT IN (SELECT T0."StornoToTr" 
        FROM "OJDT" T0 
               WHERE IFNULL(t0."StornoToTr", 0) <> 0 AND t0."TransType" = 30) 
    LEFT OUTER JOIN "OSLP" V0 ON V0."SlpCode" = N0."SlpCode" 
    LEFT OUTER JOIN "ODPI" N1 ON N1."DocEntry" = T2."DocEntry" AND T2."InvType" = N1."ObjType"
    LEFT OUTER JOIN "IV_IB_ContractBank" T10 ON T10."PayMethCode" = N0."PeyMethod"
WHERE T4."BoeType" = 'I' AND (T4."BoeStatus" = 'G' OR T4."BoeStatus" = 'D') 

UNION ALL 

SELECT DISTINCT 
T0."CardCode" AS "Codigo_PN", 
C0."CardName" AS "Razao_Social", 
C7."TaxId0" as "CNPJ",
C7."TaxId1" as "IE",
C7."TaxId4" as "CPF",
C0."Phone1" as "Telefone",
C0."E_Mail" as "Email",
C1."AddrType" as "Logradouro", 
C1."Street" as "Rua", 
C1."StreetNo" as "Numero", 
C1."Block" as "Bairro", 
C1."ZipCode" as "CEP", 
C1."City" as "Cidade",
C1."State" as "Estado",
    CASE T2."InvType" 
        WHEN '30' THEN N0."NumAtCard" 
        WHEN '24' THEN T2."DocEntry" 
        ELSE IFNULL(n0."Serial", IFNULL(L0."TransId", N1."DocNum")) 
    END AS "Num_Docto", 
  
    CASE T2."InvType" 
        WHEN '30' THEN 'LC' 
        WHEN '24' THEN 'CR' 
        WHEN '203' THEN 'AD' 
        ELSE 'NF' 
    END AS "Tipo_Docto",
    CASE T2."InvType" 
        WHEN '30' THEN L0."TransId" 
        WHEN '203' THEN N1."DocEntry" 
        WHEN '24' THEN T0."DocEntry" 
        ELSE N0."DocEntry" END AS "DocEntry",
 T2."DocEntry" AS "Doc_Origem", 
    CASE T2."InvType" 
        WHEN '30' THEN L0."RefDate" 
        WHEN '203' THEN N1."DocDate" 
        WHEN '24' THEN T0."DocDate" 
        ELSE N0."DocDate" 
    END AS "Emissao",
    N0."PeyMethod", 
    T10."Fine" as "Multa",
	T10."Interest" as "Juros",
	T10."AplicarMultaAposDiaDoVencimento" as "Dias Multa",
	T10."AplicarJurosAposDiaDoVencimento" as "Dias Juros",
    t3."PayDate" AS "Vencimento", T3."CreditSum" AS "Valor_Original", 
    T3."CreditSum" AS "Valor_Aberto", 
    CASE 
        WHEN T0."BoeSum" > 0 THEN 'BOL' 
        ELSE 
        CASE 
            WHEN T0."CreditSum" > 0 THEN 'CAR' 
        END 
    END AS "Forma de pagamento", 
    CASE T3."Deposited" 
        WHEN 'Y' THEN 'Pago' 
        ELSE 'Em aberto' 
    END AS "Status", T0."BPLId", T0."BPLName" 
FROM "ORCT" T0 
    INNER JOIN "RCT3" T1 ON T1."DocNum" = T0."DocNum" 
    INNER JOIN "RCT2" T2 ON T2."DocNum" = T0."DocNum" 
    INNER JOIN "OCRD" C0 ON T0."CardCode" = C0."CardCode" 
    LEFT OUTER JOIN CRD1 C1 ON C1."CardCode" = C0."CardCode" and C1."AdresType" = 'S' 
    LEFT OUTER JOIN "CRD7" C7 ON C7."CardCode" = C0."CardCode"  AND C7."Address" = '' 
    LEFT OUTER JOIN "OINV" N0 ON N0."DocEntry" = T2."DocEntry" AND T2."InvType" = N0."ObjType" 
    LEFT OUTER JOIN "ODPI" N1 ON N1."DocEntry" = T2."DocEntry" AND T2."InvType" = N1."ObjType" 
    LEFT OUTER JOIN "OJDT" L0 ON L0."TransId" = T2."DocEntry" AND T2."InvType" = '30' AND
             l0."TransId" NOT IN (SELECT T0."StornoToTr" 
        FROM "OJDT" T0 
               WHERE IFNULL(t0."StornoToTr", 0) <> 0 AND t0."TransType" = 30) 
    LEFT OUTER JOIN "OSLP" V0 ON V0."SlpCode" = N0."SlpCode" 
    INNER JOIN "OCRH" T3 ON T3."RctAbs" = T1."DocNum" AND T3."RcptLineId" = T1."LineID" 
    LEFT OUTER JOIN "IV_IB_ContractBank" T10 ON T10."PayMethCode" = N0."PeyMethod"
WHERE T3."Deposited" <> 'Y' AND (T3."Canceled" = 'N' AND T3."Storno" = 'N') 
--fimq2
UNION ALL
 
SELECT DISTINCT T0."CardCode" AS "Codigo_PN", 
C0."CardName" AS "Razao_Social", 
C7."TaxId0" as "CNPJ",
C7."TaxId1" as "IE",
C7."TaxId4" as "CPF",
C0."Phone1" as "Telefone",
C0."E_Mail" as "Email",
C1."AddrType" as "Logradouro", 
C1."Street" as "Rua", 
C1."StreetNo" as "Numero", 
C1."Block" as "Bairro", 
C1."ZipCode" as "CEP", 
C1."City" as "Cidade",
C1."State" as "Estado",
    CASE T2."InvType" 
        WHEN '30' THEN N0."NumAtCard" 
        WHEN '24' THEN T2."DocEntry" 
        ELSE IFNULL(N0."Serial", IFNULL(L0."TransId", N1."DocNum")) 
    END AS "Num_Docto", 
   
    CASE T2."InvType" 
        WHEN '30' THEN 'LC' 
        WHEN '24' THEN 'CR' 
        WHEN '203' THEN 'AD' 
        ELSE 'NF' 
    END AS "Tipo_Docto", 
    CASE T2."InvType" 
        WHEN '30' THEN L0."TransId" 
        WHEN '203' THEN N1."DocEntry" 
        WHEN '24' THEN T0."DocEntry" 
        ELSE N0."DocEntry" END AS "DocEntry",
T2."DocEntry" AS "Doc_Origem", 
    CASE T2."InvType" 
        WHEN '30' THEN L0."RefDate" 
        WHEN '203' THEN N1."DocDate" 
        WHEN '24' THEN T0."DocDate" 
        ELSE N0."DocDate" 
    END AS "Emissao", 
    N0."PeyMethod",
    T10."Fine" as "Multa",
    T10."Interest" as "Juros",
    T10."AplicarMultaAposDiaDoVencimento" as "Dias Multa",
    T10."AplicarJurosAposDiaDoVencimento" as "Dias Juros",
    T1."DueDate" AS "Vencimento", T1."CheckSum" AS "Valor_Original", 
    T1."CheckSum" AS "Valor_Aberto", 
    CASE 
        WHEN T0."BoeSum" > 0 THEN 'BOL' 
        ELSE 
        CASE 
            WHEN T0."CheckSumSy" > 0 THEN 'CHQ' 
        END 
    END AS "Forma de pagamento", 
    CASE "Deposited" 
        WHEN 'N' THEN 'Em aberto' 
        ELSE 'Pago' 
    END AS "Status", T0."BPLId", T0."BPLName" 
FROM ORCT T0 
    INNER JOIN RCT1 T1 ON T1."DocNum" = T0."DocNum" 
    INNER JOIN "RCT2" T2 ON T2."DocNum" = T0."DocNum" 
    INNER JOIN OCRD C0 ON T0."CardCode" = C0."CardCode" 
    LEFT OUTER JOIN CRD1 C1 ON C1."CardCode" = C0."CardCode" and C1."AdresType" = 'S' 
    LEFT OUTER JOIN "CRD7" C7 ON C7."CardCode" = C0."CardCode" AND C7."Address" = '' 
    LEFT OUTER JOIN "OINV" N0 ON T2."DocEntry" = N0."DocEntry" AND T2."InvType" = N0."ObjType" 
    LEFT OUTER JOIN "OJDT" L0 ON L0."TransId" = T2."DocEntry" AND T2."InvType" = '30' AND
             l0."TransId" NOT IN (SELECT T0."StornoToTr" 
        FROM "OJDT" T0 
               WHERE IFNULL(t0."StornoToTr", 0) <> 0 AND t0."TransType" = 30) 
    LEFT OUTER JOIN "OSLP" V0 ON V0."SlpCode" = N0."SlpCode" 
    LEFT OUTER JOIN "ODPI" N1 ON N1."DocEntry" = T2."DocEntry" AND T2."InvType" = N1."ObjType" 
    INNER JOIN "OCHH" CH ON CH."CheckKey" = T1."CheckAbs" 
    LEFT OUTER JOIN "IV_IB_ContractBank" T10 ON T10."PayMethCode" = N0."PeyMethod"
WHERE "Deposited" = 'N' AND CH."Canceled" = 'N' 

--fimq3
UNION ALL 


SELECT DISTINCT T2."CardCode" AS "Codigo_PN", 
T2."CardName" AS "Razao_Social", 
C7."TaxId0" as "CNPJ",
C7."TaxId1" as "IE",
C7."TaxId4" as "CPF",
T2."Phone1" as "Telefone",
T2."E_Mail" as "Email",
C1."AddrType" as "Logradouro", 
C1."Street" as "Rua", 
C1."StreetNo" as "Numero", 
C1."Block" as "Bairro", 
C1."ZipCode" as "CEP", 
C1."City" as "Cidade",
C1."State" as "Estado",
T0."Serial" AS "Num_Docto", 
'NF' AS "Tipo_Docto",
 T0."DocEntry" AS "DocEntry",
 T0."DocNum" AS "Doc_Origem", 
 T0."DocDate" AS "Emissao",
 T0."PeyMethod",
 T10."Fine" as "Multa",
 T10."Interest" as "Juros",
 T10."AplicarMultaAposDiaDoVencimento" as "Dias Multa",
 T10."AplicarJurosAposDiaDoVencimento" as "Dias Juros", 
    T1."DueDate" AS "Vencimento", 
    T1."InsTotal" AS "Valor_Original", 
    T1."InsTotal" - T1."PaidToDate" AS "Valor_Aberto", 
     'Titulo Aberto' AS "Forma de pagamento", 
     'Em aberto' AS "Status", T0."BPLId", 
    T0."BPLName" 
FROM OINV T0 
    INNER JOIN INV6 T1 ON T1."DocEntry" = T0."DocEntry" 
    INNER JOIN OCRD T2 ON T2."CardCode" = T0."CardCode" 
    LEFT OUTER JOIN CRD1 C1 ON C1."CardCode" = T2."CardCode" AND  C1."AdresType" = 'S' 
    LEFT OUTER JOIN "CRD7" C7 ON C7."CardCode" = T0."CardCode"  AND C7."AddrType" = '' 
    LEFT OUTER JOIN "IV_IB_ContractBank" T10 ON T10."PayMethCode" = T0."PeyMethod"
WHERE T1."Status" = 'O' AND (T1."InsTotal" - IFNULL(T1."PaidToDate", 0) - IFNULL(t1."TotalBlck", 0)) > 0 

--fimq4
UNION ALL 

SELECT DISTINCT T1."ShortName" AS "Codigo_PN", 
Tc."CardName" AS "Razao_Social", 
C7."TaxId0" as "CNPJ",
C7."TaxId1" as "IE",
C7."TaxId4" as "CPF",
TC."Phone1" as "Telefone",
TC."E_Mail" as "Email",
C1."AddrType" as "Logradouro", 
C1."Street" as "Rua", 
C1."StreetNo" as "Numero", 
C1."Block" as "Bairro", 
C1."ZipCode" as "CEP", 
C1."City" as "Cidade",
C1."State" as "Estado",
T0."TransId" AS "Num_Docto", 
    'LC' AS "Tipo_Docto", 
T0."TransId"  AS "DocEntry",
T0."TransId" AS "Doc_Origem", 
T0."TaxDate" AS "Emissao", 
'CB' as "PeyMethod",
'1' as "Multa",
'1' as "Juros",
'1' as "Dias Multa",
'1' as "Dias Juros",
T1."DueDate" AS "Vencimento", 
    T1."Debit" AS "Valor_Original", 
    T1."BalDueDeb" AS "Valor_Aberto", 
    'Titulo Aberto' AS "Forma de pagamento", 
    'Em aberto' AS "Status", 
    T1."BPLId", 
    T1."BPLName" 
FROM JDT1 T1 
    INNER JOIN OJDT T0 ON T1."TransId" = T0."TransId" 
    INNER JOIN OCRD TC ON TC."CardCode" = T1."ShortName" 
    LEFT OUTER JOIN CRD1 C1 ON C1."CardCode" = TC."CardCode" and C1."AdresType" = 'S' 
    LEFT OUTER JOIN "CRD7" C7 ON C7."CardCode" = T1."ShortName"  AND C7."Address" = '' 
WHERE T1."BalDueDeb" > '0' AND T0."TransType" = '30' AND t0."TransId" NOT IN (SELECT T0."StornoToTr" 
    FROM OJDT T0 
    WHERE IFNULL(t0."StornoToTr", 0) <> 0 AND t0."TransType" = 30) AND t0."TransId" NOT IN (SELECT a."DocEntry" 
    FROM "RCT2" a 
        INNER JOIN "ORCT" b ON a."DocNum" = b."DocEntry"  and  a."DocLine" = T1."Line_ID"
    WHERE a."InvType" = 30 AND b."Canceled" = 'N') 

--fimq5
UNION ALL 

SELECT DISTINCT 
T2."CardCode" AS "Codigo_PN", 
T2."CardName" AS "Razao_Social", 
C7."TaxId0" as "CNPJ",
C7."TaxId1" as "IE",
C7."TaxId4" as "CPF",
T2."Phone1" as "Telefone",
T2."E_Mail" as "Email",
C1."AddrType" as "Logradouro", 
C1."Street" as "Rua", 
C1."StreetNo" as "Numero", 
C1."Block" as "Bairro", 
C1."ZipCode" as "CEP", 
C1."City" as "Cidade",
C1."State" as "Estado",
    IFNULL(T0."Serial", t0."DocNum") AS "Num_Docto",  
    'AD' AS "Tipo_Docto", 
    T0."DocEntry" AS "DocEntry",
    T0."DocNum" AS "Doc_Origem", 
    T0."DocDate" AS "Emissao",
    T0."PeyMethod", 
    T10."Fine" as "Multa",
    T10."Interest" as "Juros",
    T10."AplicarMultaAposDiaDoVencimento" as "Dias Multa",
    T10."AplicarJurosAposDiaDoVencimento" as "Dias Juros",
    T1."DueDate" AS "Vencimento", 
    T1."InsTotal" AS "Valor_Original", 
    T1."InsTotal" - T1."PaidToDate" AS "Valor_Aberto", 
    'Ad em Aberto' AS "Forma de pagamento", 
    'Em aberto' AS "Status", 
    T0."BPLId", 
    T0."BPLName" 
FROM ODPI T0 
    INNER JOIN DPI6 T1 ON T1."DocEntry" = T0."DocEntry" 
    INNER JOIN OCRD T2 ON T2."CardCode" = T0."CardCode" 
    LEFT OUTER JOIN CRD1 C1 ON C1."CardCode" = T2."CardCode" and C1."AdresType" = 'S' 
    LEFT OUTER JOIN "CRD7" C7 ON C7."CardCode" = T0."CardCode" AND  C7."Address" = ''  
    LEFT OUTER JOIN "IV_IB_ContractBank" T10 ON T10."PayMethCode" = T0."PeyMethod"
WHERE T1."Status" = 'O' AND (T1."InsTotal" - IFNULL(T1."PaidToDate", 0) -
 IFNULL(t1."TotalBlck", 0)) > 0 

ORDER BY 25
