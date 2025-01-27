-- Passo 0: Desativar o pager para evitar o "-- Mais --"
-- O comando abaixo desativa o pager, que é o responsável por exibir o conteúdo paginado
-- em caso de saídas muito longas (exemplo: tabelas grandes).
-- Com isso, o "More" será desativado e todo o conteúdo será exibido diretamente.
\pset pager off

-- Passo 2: Conectar ao banco de dados recém-criado
\c db_tcgpokemon_cards;

INSERT INTO tbl_cards (hp, name, type_id, stage_id, info, attack, damage, weak, ressis, retreat, cardNumberInCollection, collection_id) VALUES
(60, 'Charizard', 2, 3, 'A fire-breathing dragon Pokémon.', 'Fire Spin', '100', 'Water', NULL, '3', 4, 1),
(50, 'Charmander', 2, 1, 'A small fire Pokémon.', 'Ember', '30', 'Water', NULL, '1', 46, 1),
(70, 'Wartortle', 3, 2, 'A turtle Pokémon with water abilities.', 'Bubble', '20', 'Lightning', NULL, '1', 18, 1),
(30, 'Bulbasaur', 1, 1, 'A plant Pokémon with a seed on its back.', 'Vine Whip', '20', 'Fire', NULL, '1', 44, 1),
(80, 'Venusaur', 1, 3, 'A fully evolved plant Pokémon.', 'Solar Beam', '60', 'Fire', NULL, '2', 15, 1),
(40, 'Pikachu', 4, 1, 'An electric mouse Pokémon.', 'Thunder Shock', '10', 'Fighting', NULL, '1', 58, 1),
(70, 'Raichu', 4, 2, 'Pikachu’s evolved form with stronger electric attacks.', 'Thunderbolt', '90', 'Fighting', NULL, '2', 26, 1),
(50, 'Eevee', 10, 1, 'A normal-type Pokémon with unstable genetics.', 'Quick Attack', '20', 'Fighting', NULL, '1', 51, 2),
(80, 'Vaporeon', 3, 3, 'A water Pokémon evolved from Eevee.', 'Water Gun', '30', 'Lightning', NULL, '2', 12, 2),
(70, 'Jolteon', 4, 3, 'An electric Pokémon evolved from Eevee.', 'Pin Missile', '20', 'Fighting', NULL, '1', 7, 2),
(70, 'Flareon', 2, 3, 'A fire Pokémon evolved from Eevee.', 'Flamethrower', '50', 'Water', NULL, '2', 3, 2),
(50, 'Snorlax', 11, 1, 'A normal Pokémon known for sleeping and eating.', 'Body Slam', '30', 'Fighting', NULL, '4', 32, 2),
(70, 'Scyther', 1, 1, 'A mantis Pokémon that cuts with scythe-like arms.', 'Slash', '30', 'Fire', NULL, '0', 10, 2),
(80, 'Aerodactyl', 10, 3, 'A prehistoric Pokémon that flies with powerful wings.', 'Wing Attack', '30', 'Lightning', NULL, '2', 1, 3),
(60, 'Lapras', 3, 1, 'A gentle sea Pokémon that ferries trainers across water.', 'Water Gun', '30', 'Lightning', NULL, '1', 10, 3),
(50, 'Kabuto', 10, 1, 'An ancient Pokémon revived from a fossil.', 'Scratch', '20', 'Grass', NULL, '1', 14, 3),
(80, 'Kabutops', 10, 3, 'Kabuto’s evolved form with scythe-like arms.', 'Slash', '40', 'Grass', NULL, '2', 9, 3),
(90, 'Dragonite', 10, 3, 'A rare and powerful dragon Pokémon.', 'Hyper Beam', '50', 'Ice', 'Fighting', '3', 4, 3),
(60, 'Articuno', 3, 1, 'A legendary ice bird Pokémon.', 'Ice Beam', '40', 'Metal', NULL, '2', 2, 3),
(50, 'Ditto', 10, 1, 'A transforming Pokémon that copies its opponent.', 'Transform', NULL, 'Fighting', NULL, '1', 11, 3);
