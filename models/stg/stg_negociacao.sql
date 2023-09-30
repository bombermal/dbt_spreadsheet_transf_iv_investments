with negociacao as (
    SELECT 
        TO_DATE(replace(data_do_negocio, '-', '01/01/1970'), 'DD/MM/YYYY')::DATE as data_do_negocio
        , tipo_de_movimentacao
        , mercado
        , TO_DATE(replace(prazo_vencimento, '-', '01/01/1970'), 'DD/MM/YYYY')::DATE as prazo_vencimento
        , instituicao
        , codigo_de_negociacao
        , quantidade::INTEGER
        , REPLACE(preco, 'R$', '')::NUMERIC AS preco
        , REPLACE(valor, 'R$', '')::NUMERIC AS valor
    FROM personal_investments.negociacao
)
select * from negociacao