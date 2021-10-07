drop database if exists steam;
create database steam;
use steam;

drop table if exists users;
create table users (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	accountname VARCHAR (75),
	firstname VARCHAR (75),
	lastname VARCHAR (75),
	email VARCHAR (125) unique,
	password_hash VARCHAR (100),
	index users_accountname_idx (accountname)
	);
	
drop table if exists profiles;
create table profiles(
	user_id BIGINT unsigned not null unique,
	gender CHAR(1),
	birthday DATE,
	favorite_games_id BIGINT unsigned NULL,
	photos_id BIGINT unsigned NULL,
	created_at DATETIME default NOW(),
	home_country VARCHAR (100),
	
	foreign key (user_id) references users(id)
	);
	
drop table if exists games;
create table games(
	id BIGINT unsigned not null unique,
	gamename VARCHAR (100),
	game_genre_id BIGINT unsigned not null,
	game_description TEXT,
	developers_id BIGINT unsigned not null unique,
	screenshots_id BIGINT unsigned null,
	trailers_id BIGINT unsigned null,
	price BIGINT unsigned null,
	currancy CHAR(3),
	index games_gamename_idx (gamename)
	);

drop table if exists media_types;
create table media_types(
	id SERIAL,
	name VARCHAR(255),
	created_at DATETIME DEFAULT NOW(),
    updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP
    );
   
drop table if exists media;
create table media(
	id SERIAL,
    media_type_id BIGINT UNSIGNED NOT NULL,
    user_id BIGINT UNSIGNED NOT NULL,
  	body text,
    filename VARCHAR(255),    	
    size INT,
    created_at DATETIME DEFAULT NOW(),
    updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP,
    
    foreign key (user_id) references users(id),
    foreign key (media_type_id) references media_types(id)
 	);

drop table if exists photos;
create table photos(
	id SERIAL,
	media_id BIGINT unsigned NOT NULL,

    foreign key (media_id) references media(id)
	);

drop table if exists screenshots;
create table screenshots(
	id SERIAL,
	media_id BIGINT unsigned NOT NULL,

    foreign key (media_id) references media(id)
    );
   
drop table if exists trailers;
create table trailers(
	id SERIAL,
	media_id BIGINT unsigned NOT NULL,

    foreign key (media_id) references media(id)
    );

drop table if exists game_genre;
create table game_genre(
	id SERIAL,
	name VARCHAR(255)
	);

drop table if exists developers;
create table developers(
	id SERIAL,
	name VARCHAR(255)
	);
	
alter table profiles
add constraint fk_games
foreign key (favorite_games_id) references games(id);

alter table profiles
add constraint fk_photo
foreign key (photos_id) references media(id);

alter table games
add constraint fk_game_genre
foreign key (game_genre_id) references game_genre(id);

alter table games
add constraint fk_developers
foreign key (developers_id) references developers(id);

alter table games
add constraint fk_screenshots
foreign key (screenshots_id) references media(id);

alter table games
add constraint fk_trailers
foreign key (trailers_id) references media(id);
	
