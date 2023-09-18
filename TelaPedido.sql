ALTER VIEW SBOGRUPOROVEMA.TIPOPEDIDO AS
SELECT
			"ID" AS "IDTIPOPEDIDOERP",
			0 AS "IDEMPRESAERP",
			CASE 
				WHEN "ID" = 9 THEN 'Venda'
				WHEN "ID" = 16 THEN 'Venda Futura'
				ELSE "Usage"
			END
			AS "DESCRICAO",
			1 AS "COLUNAVENDA",
			1 AS "COLUNATROCA",
			1 AS "COLUNABONIFICACAO",
			0 AS "GERAIMPOSTO",
			0 AS "FATURA",
			0 AS "IMPRIME",
			0 AS "NEGATIVAESTOQUELOCAL",
			0 AS "HABILITAORDEMCOMPRA",
			0 AS "SOLICITACONTRASENHA",
			0 AS "SOLICITAMOTIVOTIPOPEDIDO",
			CASE 
				WHEN "ID" = 9 OR "ID" = 16 THEN 1
				ELSE 0
			END
			AS "SITUACAO",
			'V' AS "TIPO",
			'N' AS "SUBTRAIVALOR",
			'N' AS "BLOQSALDONEGATIVO",
			'N' AS "BLOQSEMVENDA"
		FROM
			OUSG;