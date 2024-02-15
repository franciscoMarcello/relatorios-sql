SELECT SUM( C."U_Quantidade" - R."U_PesoLiquidoDesc" ),SUM(  R."U_PesoLiquidoDesc" ) SALDO FROM "@AMFS_CNTR" C
INNER JOIN "@AMFS_RETR" R ON C."Code" = R."U_CodContrato"
WHERE C."Code" = 257


