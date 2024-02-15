
	SELECT * FROM ODLN T0 
	INNER JOIN dln1 T1 ON T0."DocEntry" = T1."DocEntry"  WHERE 
	T1."Usage"  = 48 
	AND T0."DocDate" >='20230801'
	AND T0."DocDate" <='20230831'