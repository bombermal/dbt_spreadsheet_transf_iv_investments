with proventos as (
    SELECT 
    	produto
        , TO_DATE(replace(pagamento, '-', '01/01/1970'), 'DD/MM/YYYY')::DATE as pagamento
        , tipo_de_evento
        , instituicao
        , quantidade::INTEGER
        , REPLACE(replace(preco_unitario, '-', '0'), 'R$', '')::NUMERIC AS preco_unitario
    	, REPLACE(replace(valor_liquido, '-', '0'), 'R$', '')::NUMERIC AS valor_liquido
    FROM personal_investments.proventos
)
select * from proventos