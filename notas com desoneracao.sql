SELECT * FROM OPCH T0 
INNER JOIN PCH4 T1 ON T0."DocEntry" = T1."DocEntry" 









SELECT * FROM PCH4 WHERE PCH4."DocEntry" = 42293




SELECT DISTINCT  opch."Serial"  
 FROM OSTC
 INNER JOIN STC1 ON (OSTC."Code" = STC1."STCCode")
 INNER JOIN STA1 ON (STC1."STACode" = STA1."StaCode")
 INNER JOIN pch1 ON pch1."TaxCode"  = ostc."Code" 
 INNER JOIN opch ON pch1."DocEntry" = opch."DocEntry" 
 WHERE  STC1."STAType" IN(25,28,36) AND STA1."SttType" IN(25,28,36)
 and
 opch."CANCELED" = 'N'
 AND opch."DocDate" >= '20230101'
 
 
 
 SELECT * FROM ostt
