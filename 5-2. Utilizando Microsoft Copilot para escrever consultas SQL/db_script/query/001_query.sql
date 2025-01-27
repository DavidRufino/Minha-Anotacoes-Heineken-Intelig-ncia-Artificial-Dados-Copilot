-- Passo 0: Desativar o pager para evitar o "-- Mais --"
-- O comando abaixo desativa o pager, que é o responsável por exibir o conteúdo paginado
-- em caso de saídas muito longas (exemplo: tabelas grandes).
-- Com isso, o "More" será desativado e todo o conteúdo será exibido diretamente.
\pset pager off

-- Passo 2: Conectar ao banco de dados recém-criado
\c db_tcgpokemon_cards;

SELECT 
    card_id,
    card_name,
    card_hp,
    card_type,
    card_stage,
    card_info,
    card_attack,
    card_damage,
    card_weakness,
    card_resistance,
    card_retreat_cost,
    card_number_in_collection,
    collection_name,
    collection_release_date,
    total_cards_in_collection
FROM 
    vw_cards_full;