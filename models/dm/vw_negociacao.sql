with negociacao as (
    SELECT 
        data_do_negocio
        , tipo_de_movimentacao
        , mercado
        , prazo_vencimento
        , instituicao
        , codigo_de_negociacao
        , case 
        	when codigo_de_negociacao like '%11' then 1 else 0
        end is_fi
        , case 
        	when codigo_de_negociacao like '%33'
        		then substring(codigo_de_negociacao, 1, 6)
	        when codigo_de_negociacao like '%11' 
        		then substring(codigo_de_negociacao, 1, 4)
        		else substring(codigo_de_negociacao, 1, 5)
        end codigo
        , quantidade
        , preco
        , valor as custo
    FROM personal_investments.stg_negociacao
)
, cotacao as (
	SELECT 
		codigo_de_negociacao
		, cotacao_atual as cotacao_unitario
	FROM personal_investments.stg_cotacao
)
, tbl as (
	select        
        data_do_negocio
        , tipo_de_movimentacao
        , mercado
        , prazo_vencimento
        , instituicao
        , codigo
        , codigo_de_negociacao
        , is_fi
        , quantidade
        , custo
        , preco as custo_unitario
        , cotacao_unitario
        , (cotacao_unitario * quantidade) as cotacao_atualizada
    from negociacao
    left join cotacao using (codigo_de_negociacao)
   )
select *
from tbl