-- Passo 0: Desativar o pager para evitar o "-- Mais --"
-- O comando abaixo desativa o pager, que é o responsável por exibir o conteúdo paginado
-- em caso de saídas muito longas (exemplo: tabelas grandes).
-- Com isso, o "More" será desativado e todo o conteúdo será exibido diretamente.
\pset pager off

-- Passo 2: Conectar ao banco de dados recém-criado
\c db_tcgpokemon_cards;

CREATE OR REPLACE VIEW vw_cards_full AS
SELECT 
    c.id AS card_id,
    c.name AS card_name,
    c.hp AS card_hp,
    t.typeName AS card_type,
    s.stageName AS card_stage,
    c.info AS card_info,
    c.attack AS card_attack,
    c.damage AS card_damage,
    c.weak AS card_weakness,
    c.ressis AS card_resistance,
    c.retreat AS card_retreat_cost,
    c.cardNumberInCollection AS card_number_in_collection,
    col.collectionSetName AS collection_name,
    col.releaseDate AS collection_release_date,
    col.totalCardsInCollection AS total_cards_in_collection
FROM 
    tbl_cards c
JOIN 
    tbl_types t ON c.type_id = t.id
JOIN 
    tbl_stages s ON c.stage_id = s.id
JOIN 
    tbl_collections col ON c.collection_id = col.id;
