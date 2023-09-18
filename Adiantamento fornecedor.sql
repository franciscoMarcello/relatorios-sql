SELECT
    odpo."DocNum" as "Nº Doc",
    odpo."DocEntry",
    odpo."CardCode" as "Codigo do forncedor",
    odpo."CardName" as "Fornecedor",
    odpo."DocTotal" as "Valor do adiantamento",
    odpo."DocDate" AS "Data de lançamento AD",
    (SELECT MAX("Dscription") FROM DPO1 WHERE DPO1."DocEntry" = odpo."DocEntry") AS "Tipo de adiantamento",
    odpo."BPLId",
    odpo."BPLName" AS "Filial",
    o."DocDate" AS "Data de lançamento",
    o."DocEntry",
    o."DocNum" AS "Nº Doc",
    o."Serial" AS "Nº NF",
    pch9."DrawnSum" AS "Valor utilizado",
    IFNULL( odpo."DocTotal" - SUM(pch9."DrawnSum"), odpo."DocTotal" ) AS "SALDO"
from
    odpo
    left join pch9 on odpo."DocEntry" = pch9."BaseAbs"
    LEFT JOIN OPCH o ON pch9."DocEntry" = o."DocEntry" 
    WHERE odpo."DocDate" >= 
    AND odpo."DocDate" <=
    GROUP BY 
    odpo."DocNum",
    odpo."DocEntry",
    odpo."CardCode" ,
    odpo."CardName" ,
    odpo."DocTotal" ,
    odpo."DocDate" ,
    odpo."BPLId",
    odpo."BPLName",
    o."DocDate" ,
    o."DocEntry",
    o."DocNum",
    o."Serial",
    pch9."DrawnSum"

    
    
    SELECT "Dscription" FROM DPO1
    
