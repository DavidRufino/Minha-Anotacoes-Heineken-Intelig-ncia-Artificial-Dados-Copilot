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

GO
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

GO
-- Passo 0: Desativar o pager para evitar o "-- Mais --"
-- O comando abaixo desativa o pager, que é o responsável por exibir o conteúdo paginado
-- em caso de saídas muito longas (exemplo: tabelas grandes).
-- Com isso, o "More" será desativado e todo o conteúdo será exibido diretamente.
\pset pager off

-- Passo 2: Conectar ao banco de dados recém-criado
\c db_tcgpokemon_cards;

INSERT INTO tbl_cards (hp, name, type_id, stage_id, info, attack, damage, weak, ressis, retreat, cardNumberInCollection, collection_id) VALUES
(70, 'Nidoking', 1, 3, 'A powerful and aggressive poison/ground-type Pokémon.', 'Earthquake', '50', 'Water', NULL, '3', 34, 1),
(50, 'Nidoran♀', 1, 1, 'A small, poison-type Pokémon.', 'Poison Sting', '10', 'Psychic', NULL, '1', 24, 1),
(60, 'Nidoran♂', 1, 1, 'A male poison-type Pokémon with strong horn attacks.', 'Horn Attack', '20', 'Psychic', NULL, '1', 23, 1),
(80, 'Beedrill', 1, 3, 'A poison bee Pokémon that stings with sharp needles.', 'Twin Needle', '30', 'Fire', NULL, '2', 10, 1),
(60, 'Pidgeot', 11, 3, 'A bird Pokémon known for its incredible speed.', 'Wing Attack', '40', 'Electric', NULL, '2', 22, 1),
(40, 'Pidgeotto', 11, 2, 'An evolved form of Pidgey with stronger attacks.', 'Gust', '20', 'Electric', NULL, '1', 21, 1),
(80, 'Zubat', 1, 1, 'A bat Pokémon that attacks with sharp fangs.', 'Supersonic', '10', 'Psychic', NULL, '1', 56, 2),
(70, 'Golbat', 1, 2, 'A fully evolved bat Pokémon that can fly at high speed.', 'Poison Fang', '30', 'Psychic', NULL, '2', 15, 2),
(60, 'Diglett', 10, 1, 'A small mole-like Pokémon with the ability to burrow underground.', 'Dig', '40', 'Water', NULL, '1', 28, 2),
(50, 'Dugtrio', 10, 2, 'A trio of Diglett Pokémon working together underground.', 'Earthquake', '50', 'Water', NULL, '2', 9, 2),
(80, 'Golem', 10, 3, 'A massive rock/ground Pokémon with tremendous power.', 'Stone Edge', '40', 'Water', NULL, '2', 13, 2),
(60, 'Onix', 10, 1, 'A giant rock snake Pokémon known for its hard exterior.', 'Rock Throw', '20', 'Water', NULL, '1', 18, 2),
(90, 'Alakazam', 5, 3, 'A psychic Pokémon with extraordinary intelligence.', 'Psychic', '60', 'Ghost', NULL, '2', 8, 2),
(50, 'Abra', 5, 1, 'A psychic Pokémon that can teleport.', 'Teleport', NULL, 'Bug', NULL, '1', 10, 2),
(70, 'Kadabra', 5, 2, 'The evolved form of Abra with advanced psychic powers.', 'Confusion', '40', 'Ghost', NULL, '2', 5, 2),
(70, 'Machoke', 6, 2, 'A strong fighting Pokémon that excels in physical attacks.', 'Karate Chop', '30', 'Psychic', NULL, '2', 21, 2),
(80, 'Machamp', 6, 3, 'The evolved form of Machoke, with immense physical strength.', 'Submission', '50', 'Psychic', NULL, '2', 17, 2),
(50, 'Poliwag', 3, 1, 'A small, tadpole-like Pokémon with strong swimming skills.', 'Water Gun', '20', 'Electric', NULL, '1', 2, 3),
(70, 'Poliwhirl', 3, 2, 'An evolved form of Poliwag that can breathe both air and water.', 'Bubblebeam', '40', 'Electric', NULL, '2', 16, 3),
(90, 'Politoed', 3, 3, 'A frog Pokémon that controls the weather with its abilities.', 'Hydro Pump', '50', 'Electric', NULL, '2', 19, 3),
(50, 'Machop', 6, 1, 'A small, fighting-type Pokémon with powerful limbs.', 'Low Kick', '20', 'Psychic', NULL, '1', 12, 2),
(80, 'Tentacool', 3, 1, 'A jellyfish-like Pokémon with stinging tentacles.', 'Poison Sting', '30', 'Psychic', NULL, '1', 21, 3),
(70, 'Tentacruel', 3, 2, 'A fully evolved jellyfish Pokémon that can paralyze opponents.', 'Acid', '40', 'Psychic', NULL, '2', 24, 3),
(60, 'Seel', 3, 1, 'A playful seal Pokémon that lives in cold waters.', 'Headbutt', '20', 'Electric', NULL, '1', 5, 3),
(80, 'Dewgong', 3, 3, 'A graceful seal Pokémon with the ability to freeze water.', 'Aurora Beam', '40', 'Electric', NULL, '2', 14, 3),
(50, 'Psyduck', 5, 1, 'A confused, headache-prone water Pokémon with psychic abilities.', 'Scratch', '10', 'Electric', NULL, '1', 25, 3),
(80, 'Golduck', 5, 2, 'A powerful water Pokémon that uses its psychic abilities in battle.', 'Hydro Pump', '50', 'Electric', NULL, '2', 11, 3),
(60, 'Krabby', 3, 1, 'A small crab Pokémon with pincers strong enough to crush things.', 'Vice Grip', '30', 'Electric', NULL, '1', 8, 3),
(80, 'Kingler', 3, 2, 'An evolved form of Krabby with larger pincers and great power.', 'Crabhammer', '50', 'Electric', NULL, '2', 6, 3);

GO
