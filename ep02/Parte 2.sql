select  seller_state,
        count(seller_id) as quantidade_sellers
from tb_sellers

-- Where para filtrar na tabela | Having para filtrar as agregações

-- Filtro pré agregação, na tabela original
-- where seller_state in ('RJ', 'SP', 'PR')
-- where seller_state = 'RJ' OR seller_state = 'SP' OR seller_state = 'PR'

-- agregação
group by seller_state

-- filtro pós-agrregação
having quantidade_sellers > 10
order by quantidade_sellers desc

