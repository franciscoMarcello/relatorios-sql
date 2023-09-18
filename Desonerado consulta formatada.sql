SELECT 
CASE
	WHEN 1-(STA1."Rate"/100)*(STA1."U_Outros"/100) = 0 THEN $[$38.U_preco_negociado.NUMBER]
	ELSE $[$38.U_preco_negociado.NUMBER]/(1-(STA1."Rate"/100)*(STA1."U_Outros"/100))
	
END AS "Desonerado"


 FROM OSTC
 INNER JOIN STC1 ON (OSTC."Code" = STC1."STCCode")
 INNER JOIN STA1 ON (STC1."STACode" = STA1."StaCode")
 WHERE OSTC."Code" = $[$38.160.TEXT]  AND STC1."STAType"  = 25 AND STA1."SttType" = 25
 
 UNION ALL
SELECT $[$38.U_preco_negociado.NUMBER] FROM DUMMY WHERE NOT EXISTS (
SELECT 1  
 FROM OSTC
 INNER JOIN STC1 ON (OSTC."Code" = STC1."STCCode")
 INNER JOIN STA1 ON (STC1."STACode" = STA1."StaCode")
 WHERE OSTC."Code" = $[$38.160.TEXT]  AND STC1."STAType"  = 25 AND STA1."SttType" = 25)
 
 
 
 SELECT ("U_ROV_Acrecimo" - "U_ROV_Desconto" ) FROM  OCTG WHERE "GroupNum" = $[$47.4.TEXT]
