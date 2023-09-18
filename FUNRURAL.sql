set schema SBOGRUPOROVEMA;

DROP PROCEDURE "spcJBCFUNRURAL";

CREATE PROCEDURE "spcJBCFUNRURAL"( 
	DocIni date
	, DocFim date
	, BplId INTEGER
	, ByEmpresa boolean
	, Utilizacao integer
)
AS 
BEGIN

		select 
			T0."DocEntry"
			,T0."DocNum"
			,T0."CardCode"
			,T0."CardName"
			--,T4."StcCode"
			--,T4."StaCode"
			--,T4."staType"
			,T0."DocDate"
			,T0."Serial"
			,T0."SeriesStr"
			,coalesce((select sum(coalesce(T4."TaxSum",0)) from INV4  T4 where T4."DocEntry"=T0."DocEntry" and T4."StaCode" in ('FRINSS') ),0) FRINSS
			,coalesce((select sum(coalesce(T4."TaxSum",0)) from INV4  T4 where T4."DocEntry"=T0."DocEntry" and T4."StaCode" in ('FUN01BT') ),0) FUN01BT
			,coalesce((select sum(coalesce(T4."TaxSum",0)) from INV4  T4 where T4."DocEntry"=T0."DocEntry" and T4."StaCode" in ('FRRAT') ),0) FRRAT
			,coalesce((select sum(coalesce(T4."TaxSum",0)) from INV4  T4 where T4."DocEntry"=T0."DocEntry" and T4."StaCode" in ('FRSENAR') ),0) FRSENAR
			
			
			,coalesce((select sum(coalesce(T4."TaxSum",0)) from INV4  T4 where T4."DocEntry"=T0."DocEntry" and T4."StaCode" in ('FRINSS') ) ,0)
			+coalesce((select sum(coalesce(T4."TaxSum",0)) from INV4  T4 where T4."DocEntry"=T0."DocEntry" and T4."StaCode" in ('FUN01BT') ) ,0)
			+coalesce((select sum(coalesce(T4."TaxSum",0)) from INV4  T4 where T4."DocEntry"=T0."DocEntry" and T4."StaCode" in ('FRRAT') ) ,0)
			+coalesce((select sum(coalesce(T4."TaxSum",0)) from INV4  T4 where T4."DocEntry"=T0."DocEntry" and T4."StaCode" in ('FRSENAR') ),0) 			TOTAL
		from
			OINV T0
			--INNER JOIN ORDR T1 on T1."CardCode"=T1."CardCode"
			--inner join OCRD T2 on T2."CardCode"=T1."CardCode"
			--inner join INV4  T4 on T4."DocEntry"=T0."DocEntry"
		where 
			exists(
			select 1 from INV4 T4 where T4."StaCode" in ('FRINSS','FUN01BT','FRRAT','FRSENAR') and T0."DocEntry"=T4."DocEntry" 
			)
			--and T0."DocNum"=3711
			/*and exists(
				select 1 from CRD11 where CRD11."CardCode"=T2."CardCode"---identificações fiscais
			
			)*/	
		group by				
			T0."DocEntry"
			,T0."CardCode"
			,T0."CardName"
			--,T4."StcCode"
			--,T4."StaCode"
			,T0."DocDate"
			,T0."Serial"
			,T0."SeriesStr"		
			,T0."DocNum"	
			--;	
		order by 1 desc
		limit 200;
end;

call "spcJBCFUNRURAL" (TO_DATE('20100112', 'YYYYMMDD'),TO_DATE('20100112', 'YYYYMMDD'),0,true,1);