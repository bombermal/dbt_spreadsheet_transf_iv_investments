SELECT 
	agrupamento::INTEGER
	, desdobramento::INTEGER
	, TO_DATE(replace("data", '-', '01/01/1970'), 'DD/MM/YYYY')::DATE as "data_evento"
	, codigo_de_negociacao
FROM personal_investments.eventos