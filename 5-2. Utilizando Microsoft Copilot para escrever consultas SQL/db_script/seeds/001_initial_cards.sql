-- Passo 0: Desativar o pager para evitar o "-- Mais --"
-- O comando abaixo desativa o pager, que é o responsável por exibir o conteúdo paginado
-- em caso de saídas muito longas (exemplo: tabelas grandes).
-- Com isso, o "More" será desativado e todo o conteúdo será exibido diretamente.
\pset pager off

-- Passo 2: Conectar ao banco de dados recém-criado
\c db_tcgpokemon_cards;

-- Insert into tbl_collections
INSERT INTO tbl_collections (collectionSetName, releaseDate, totalCardsInCollection) VALUES
('Base Set', '1999-01-09', 102),
('Jungle', '1999-06-16', 64),
('Fossil', '1999-10-10', 62);

-- Insert into tbl_types
INSERT INTO tbl_types (typeName) VALUES
('Grass'),
('Fire'),
('Water'),
('Lightning'),
('Psychic'),
('Fighting'),
('Darkness'),
('Metal'),
('Fairy'),
('Dragon'),
('Normal');

-- Insert into tbl_stages
INSERT INTO tbl_stages (stageName) VALUES
('Basic'),
('Stage 1'),
('Stage 2');

-- Insert into tbl_cards
INSERT INTO tbl_cards (hp, name, type_id, stage_id, info, attack, damage, weak, ressis, retreat, cardNumberInCollection, collection_id) VALUES
-- Base Set cards
(60, 'Charizard', 2, 3, 'A fire-breathing dragon Pokémon.', 'Fire Spin', '100', 'Water', NULL, '3', 4, 1),
(40, 'Pikachu', 4, 1, 'An electric mouse Pokémon.', 'Thunder Shock', '10', 'Fighting', NULL, '1', 58, 1),
(30, 'Bulbasaur', 1, 1, 'A plant Pokémon with a seed on its back.', 'Vine Whip', '20', 'Fire', NULL, '1', 44, 1),
(70, 'Blastoise', 3, 3, 'A large turtle Pokémon that uses water cannons.', 'Hydro Pump', '50', 'Lightning', NULL, '2', 2, 1),

-- Jungle cards
(80, 'Vaporeon', 3, 3, 'A water Pokémon evolved from Eevee.', 'Water Gun', '30', 'Lightning', NULL, '2', 12, 2),
(70, 'Scyther', 1, 1, 'A mantis Pokémon that cuts with scythe-like arms.', 'Slash', '30', 'Fire', NULL, '0', 10, 2),

-- Fossil cards
(80, 'Aerodactyl', 10, 3, 'A prehistoric Pokémon that flies with powerful wings.', 'Wing Attack', '30', 'Lightning', NULL, '2', 1, 3),
(50, 'Kabuto', 10, 1, 'An ancient Pokémon revived from a fossil.', 'Scratch', '20', 'Grass', NULL, '1', 14, 3);
