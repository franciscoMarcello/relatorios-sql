
IF :object_type = '24' and (:transaction_type = 'A' or :transaction_type = 'U') THEN
	IF EXISTS(
	SELECT
		1
	FROM ORCT AS py
	WHERE 
		EXISTS(SELECT 1 FROM ORCT t WHERE py."DocEntry" <> t."DocEntry" AND py."U_pix_reference" = t."U_pix_reference" AND "Canceled" = 'N')
		AND py."DocEntry" = :list_of_cols_val_tab_del
				
	) 
       	 Then       
			error := 88;
         	error_message := 'Esse codigo de pix ja recebeu pagamento';  
	End If;
END IF;


IF :object_type = '24' OR :object_type = '13' and (:transaction_type = 'U') THEN
	IF EXISTS(
	SELECT
		1
	FROM 
		ORCT AS py
		LEFT JOIN RCT2 p2 ON (py."DocEntry" = p2."DocNum")
		LEFT JOIN INV6 inst on(inst."DocEntry" = p2."DocEntry")
	WHERE
		py."U_pix_reference" <> inst."U_pix_reference" 
		AND py."Canceled" = 'N' AND (py."DocEntry" = :list_of_cols_val_tab_del OR inst."DocEntry" = :list_of_cols_val_tab_del)				
	) 
       	 Then       
			error := 88;
         	error_message := 'Pagamento pix nao esta consistente';  
	End If;
END IF;