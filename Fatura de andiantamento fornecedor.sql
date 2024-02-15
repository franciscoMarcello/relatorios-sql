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
 case
    when  sum(pch9."DrawnSum") OVER (PARTITION BY odpo."DocNum") IS NULL   then 'Não utilizado'
    when   odpo."DocTotal"  - sum(pch9."DrawnSum") OVER (PARTITION BY odpo."DocNum") = 0 then 'Sem saldo'
    else 'Com saldo'
    End as "Status"
from
    odpo
    left join pch9 on odpo."DocEntry" = pch9."BaseAbs"
    LEFT JOIN OPCH o ON pch9."DocEntry" = o."DocEntry" 
    WHERE odpo."DocDate" >= TO_DATE('20230901', 'YYYYMMDD')
    AND odpo."DocDate" <=TO_DATE('20230930', 'YYYYMMDD')
   


