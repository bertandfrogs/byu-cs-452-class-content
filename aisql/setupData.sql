insert into Family (family_id, common_name, latin_name) VALUES
(1, 'Ducks, Geese, and Waterfowl', 'Anatidae'),
(2, 'New World Quail', 'Odontophoridae'),
(3, 'Pheasants, Grouse, and Allies', 'Phasianidae'),
(4, 'Pigeons and Doves', 'Columbidae'),
(5, 'Hummingbirds', 'Trochilidae'),
(6, 'Herons, Egrets, and Bitterns', 'Ardeidae'),
(7, 'Hawks, Eagles, and Kites', 'Accipitridae');

insert into Bird (bird_id, common_name, latin_name, family_id) VALUES
(1, 'American Wigeon', 'Mareca americana', 1),
(2, 'Canada Goose', 'Branta canadensis', 1),
(3, 'Trumpeter Swan', 'Cygnus buccinator', 1),
(4, 'Ruddy Duck', 'Oxyura jamaicensis', 1),
(5, 'California Quail','Callipepla californica', 2),
(6, 'Wild Turkey', 'Meleagris gallopavo', 3),
(7, 'Ring-necked Pheasant', 'Phasianus colchicus', 3),
(8, 'Rock Pigeon', 'Columba livia', 4),
(9, 'Eurasian Collared-Dove', 'Streptopelia decaocto', 4),
(10, 'Mourning Dove', 'Zenaida macroura', 4),
(11, 'Ruby-throated Hummingbird', 'Archilochus colubris', 5),
(12, 'Calliope Hummingbird', 'Selasphorus calliope', 5),
(13, 'Black-crowned Night Heron', 'Nycticorax nycticorax', 6),
(14, 'Snowy Egret', 'Egretta thula', 6),
(15, 'Great Blue Heron', 'Ardea herodias', 6),
(16, 'Coopers Hawk', 'Astur cooperii', 7),
(17, 'Bald Eagle', 'Haliaeetus leucocephalus', 7),
(18, 'Red-tailed Hawk', 'Buteo jamaicensis', 7);

insert into Region (region_id, name) VALUES
(1, 'Canada'),
(2, 'United States'),
(3, 'Mexico');

insert into Location (location_id, name, latitude, longitude, region_id) VALUES
(1, 'Point Pelee National Park', 41.9617, -82.5186, 1),
(2, 'Cape May', 38.9351, -74.9060, 2),
(3, 'Bosque del Apache NWR', 33.8046, -106.8910, 2),
(4, 'Everglades National Park', 25.2866, -80.8987, 2),
(5, 'El Triunfo Biosphere Reserve', 15.6622, -92.8069, 3);

insert into User (user_id, username, first_name, last_name, email, password, region_id) VALUES
(1, 'feathered.fred23', 'Fred', 'Anderson', 'fred.anderson@example.com', '#$&%#$#$', 2),
(2, 'avianAle', 'Ale', 'Soto', 'ale.soto@example.com', '#$&%#$#$', 3),
(3, 'warbler_will', 'William', 'Miller', 'will.miller@example.com', '#$&%#$#$', 2),
(4, 'hawkHope_89', 'Hope', 'Davies', 'hope.davies@example.com', '#$&%#$#$', 1),
(5, 'sam.swift', 'Sam', 'Thompson', 'sam.thompson@example.com', '#$&%#$#$', 2),
(6, 'falconFaith', 'Faith', 'Hughes', 'faith.hughes@example.com', '#$&%#$#$', 2),
(7, 'crane.craig12', 'Craig', 'Taylor', 'craig.taylor@example.com', '#$&%#$#$', 1),
(8, 'robin_rachel', 'Rachel', 'Moore', 'rachel.moore@example.com', '#$&%#$#$', 2),
(9, 'jakeJay', 'Jake', 'Brooks', 'jake.brooks@example.com', '#$&%#$#$', 2),
(10, 'frida_finch', 'Frida', 'Lopez', 'frida.lopez@example.com', '#$&%#$#$', 3);

insert into Audio (audio_id, audio_url) VALUES 
(1, 's3audiourl'),
(2, 's3audiourl'),
(3, 's3audiourl'),
(4, 's3audiourl'),
(5, 's3audiourl'),
(6, 's3audiourl');

insert into Photo (photo_id, photo_url) VALUES 
(1, 's3photourl'),
(2, 's3photourl'),
(3, 's3photourl'),
(4, 's3photourl'),
(5, 's3photourl'),
(6, 's3photourl');

insert into Observation (obs_id, user_id, bird_id, location_id, obs_date, photo_id, audio_id) VALUES
(1, 4, 1, 1, '2023-01-28', NULL, NULL),
(2, 4, 6, 5, '2024-09-02', NULL, NULL),
(3, 3, 17, 3, '2024-03-11', NULL, NULL),
(4, 8, 15, 3, '2023-03-12', NULL, 6),
(5, 9, 5, 3, '2024-07-15', NULL, NULL),
(6, 7, 14, 3, '2025-04-11', NULL, NULL),
(7, 7, 17, 4, '2024-08-12', NULL, NULL),
(8, 2, 17, 1, '2023-11-26', 1, NULL),
(9, 10, 17, 5, '2023-11-17', NULL, NULL),
(10, 4, 12, 5, '2024-09-17', 6, NULL),
(11, 5, 8, 3, '2024-04-08', NULL, NULL),
(12, 10, 3, 5, '2023-11-09', NULL, NULL),
(13, 9, 6, 5, '2023-05-02', NULL, 1),
(14, 2, 11, 2, '2025-03-19', NULL, NULL),
(15, 8, 16, 1, '2024-07-01', NULL, NULL),
(16, 7, 11, 3, '2024-02-07', NULL, 2),
(17, 6, 5, 4, '2024-10-15', NULL, NULL),
(18, 3, 18, 1, '2025-03-26', NULL, NULL),
(19, 7, 1, 3, '2024-11-29', NULL, NULL),
(20, 5, 16, 4, '2023-03-26', 2, NULL),
(21, 8, 7, 5, '2023-07-02', NULL, NULL),
(22, 8, 11, 4, '2025-03-22', NULL, 5),
(23, 2, 16, 4, '2024-06-29', NULL, NULL),
(24, 2, 12, 1, '2024-08-01', NULL, NULL),
(25, 1, 13, 5, '2025-02-18', 3, 3),
(26, 3, 18, 4, '2023-12-21', NULL, NULL),
(27, 6, 4, 1, '2024-05-30', NULL, NULL),
(28, 5, 8, 2, '2025-01-28', NULL, NULL),
(29, 5, 11, 5, '2024-06-29', NULL, NULL),
(30, 10, 16, 4, '2023-12-12', 4, NULL),
(31, 10, 14, 2, '2024-10-16', NULL, NULL),
(32, 4, 8, 3, '2024-07-26', NULL, NULL),
(33, 9, 1, 5, '2023-01-17', NULL, 4),
(34, 5, 8, 1, '2024-06-13', NULL, NULL),
(35, 3, 7, 2, '2025-03-09', 5, NULL);