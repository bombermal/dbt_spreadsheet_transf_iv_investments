SELECT 
	motivo
	, codigo_isin
	, quantidade_disponivel::numeric
	, instituicao
	, REPLACE(REPLACE(valor_atualizado, 'R$', ''), ',', '')::NUMERIC as valor_atualizado
	, TO_DATE(replace(vencimento, '-', '01/01/1970'), 'DD/MM/YYYY')::DATE as vencimento
	, REPLACE(REPLACE(valor_aplicado, 'R$', ''), ',', '')::NUMERIC as valor_aplicado
	, produto
	, REPLACE(REPLACE(valor_liquido, 'R$', ''), ',', '')::NUMERIC as valor_liquido
	, REPLACE(REPLACE(valor_bruto, 'R$', ''), ',', '')::NUMERIC as valor_bruto
	, quantidade_indisponivel::numeric
	, indexador
	, quantidade::numeric
	, TO_DATE(replace(data_relatorio, '-', '01/01/1970'), 'DD/MM/YYYY')::DATE as data_relatorio
FROM personal_investments.renda_fixa