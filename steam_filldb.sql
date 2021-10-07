use steam;

insert into users
values
(1, 'Thiel', 'Mariana', 'Bahringer', 'thiel.una@example.com', '29c325eebaa05506af31e84e51c95563235d4129'),
(2, 'Wehner', 'Daren', 'Schoen', 'wehner.oda@example.org', 'fd5c26d62c8b24d757ec1396'),
(3, 'Ankunding', 'Kara', 'Cummings', 'ankunding.caitlyn@example.org', '5868ef3cc6fec9afaca80466b'),
(4, 'Ivy', 'Teagan', 'Veum', 'lacy.schumm@example.net', '27c4c99b88167afabab6aea6'),
(5, 'Magnus', 'Dena', 'Ernser', 'julio59@example.org', '5c09ed5aaca7f2a00b877a44');

insert into media_types
values
(1, 'screenshot', '2014-04-09 20:37:08', '1982-03-02 03:27:04'),
(2, 'trailer', '1978-08-23 23:16:56', '1986-04-03 19:27:56'),
(3,'photo', '1970-08-23 02:56:49', '1997-12-25 16:37:51');

insert into media 
values
(1, 1, 1, 'This is screenshot of game', 'Screenshot1', '36308',  '1973-12-18 14:20:06', '1999-08-01 13:20:43'),
(2, 2, 2, 'This is trailer of game', 'Trailer1', '231',  '1990-12-05 03:24:06', '1971-11-30 10:58:03'),
(3, 3, 3, 'This is photo of user 3', 'Photo1',  '9',  '1990-12-05 03:24:06', '1971-11-30 10:58:03'),
(4, 1, 4, 'This is screenshot', 'Screenshot2', '9',  '1990-12-05 03:24:06', '1971-11-30 10:58:03'),
(5, 2, 1, 'This is trailer of game','Trailer2', '229',  '1990-12-05 03:24:06', '1971-11-30 10:58:03'),
(6, 2, 1, 'This is trailer of game', 'Trailer3', '230',  '1990-12-05 03:24:06', '1971-11-30 10:58:03'),
(7, 3, 5, 'This is photo of user 5', 'Photo2', '9',  '1990-12-05 03:24:06', '1971-11-30 10:58:03');

insert into screenshots 
values
(1,1),
(2,4);

insert into trailers 
values
(1,2),
(2,5),
(3,6);

insert into photos 
values
(1,3),
(2,7);

insert into developers 
values
(1, 'Rockstar Games'),
(2, 'Creative Assambley'),
(3, 'Blizzard');

insert into game_genre 
values
(1, 'RPG'),
(2, 'FPS'),
(3, 'RTS'),
(4, 'Simulator');

insert into games
values
(1, 'RDR2', 1, 'Wild West Outlaws advanture', 1, 1, 2, 3500, 'rub'),
(2, 'WoW', 1, 'Warcraft', 3, NULL, 5, 30, 'usd'),
(3, 'Total War', 3, 'Total War', 2, 4, 6, 15, 'eur');

insert into profiles 
values
(1, 'f', '1973-12-17', 1, null, '1990-12-05 03:24:06', 'Russia'),
(2, 'm', '1978-08-23', 2, null, '2014-04-09 20:37:08', 'Germany'),
(3, 'f', '1983-08-23', 3, 3, '2014-04-09 20:37:08', 'France'),
(4, 'm', '1993-08-23', 1, null, '2014-04-09 20:37:08', 'France' ),
(5, 'f', '1999-08-23', 3, 7, '2014-04-09 20:37:08', 'Guiana');