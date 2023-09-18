
select
    ODPO."DocNum" as "Adto", ODPO."CardCode" as "Cod", ODPO."CardName" as "Fornecedor", ODPO."DocTotal" as "VlrAdto",
   sum(PCH9."DrawnSum") as "ValorUtilizado"
from
   ODPO
    left join PCH9 on ODPO."DocEntry" = PCH9."BaseAbs"
group by
    ODPO."DocNum", ODPO."CardCode", ODPO."CardName", ODPO."DocTotal"
having
    sum(PCH9."DrawnSum") < ODPO."DocTotal" or sum(PCH9."DrawnSum") is NULL