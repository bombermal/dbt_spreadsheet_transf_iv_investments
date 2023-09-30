with cotacao as (
    SELECT 
        codigo_de_negociacao
        , REPLACE(REPLACE(cotacao_atual, '#N/A', '0'), ',', '.')::numeric  as cotacao_atual
    FROM personal_investments.cotacao
)
select * from cotacao