SELECT  A.ID,
		P.DESCRICAO, 
		P.DISPONIVEL,
		P.DEVOLVER,
		IA.DT_DEVOLUCAO, 
		IA.VALOR_DIARIA, 
		IA.VALOR_TOTAL, 
		IA.QTDE_DIAS_ATRASO, 
		IA.VALOR_MULTA,
		IA.DEVOLVIDO,
		A.SUBTOTAL,
		A.TOTAL_MULTA,
		A.TOTAL
FROM ALUGUEL A
INNER JOIN ITENSALUGUEL IA ON A.ID = IA.CD_ALUGUEL
INNER JOIN PRODUTO P ON P.ID = IA.CD_PRODUTO
WHERE A.CD_CLIENTE = 1



SELECT *
FROM ALUGUEL