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
