
-- Процедуры
drop procedure if exists game_offers;
delimiter //
create procedure game_offers (in for_game_id BIGINT)
	begin
-- Same game genre
		select g2.gamename
		from games g1 
		join profiles p on g1.id = p.favorite_games_id 
		join games g2 on g1.game_genre_id = g2.game_genre_id 
		where p.favorite_games_id = for_game_id
			and g2.id <> for_game_id
		order by rand()
		limit 10;
	end //

delimiter ;

drop procedure if exists sp_add_user;
create procedure sp_add_user (accountname VARCHAR (75), firstname VARCHAR (75), lastname VARCHAR (75),email VARCHAR (125),)
								photos_id BIGINT,home_country VARCHAR (100),out tran_result VARCHAR(200))
begin
		declare '_rollback' BOOL default 0;
		declare code varchar (100);
		declare error_string varchar (100);
		declare last_user_id int;
		declare continue handler for sqlexception
		begin
			set `_rollback` = 1;
		
			get stacked diagnostics condition 1
			code = returned_sqlstate, error_string = message_text;
			
		set tran_result := concat ('Error occured! Code =', code, 'Text', error_string);
		end;
	start transaction;

	insert into users (accountname, firstname,lastname,email)
		values (accountname,firstname,lastname,email);
	insert into profiles (user_id,photos_id,home_country)
		values (@last_user_id, photos_id, home_country)

		if `_rollback` then rollback;
		else 
			set tran_result := 'OK';
			commit;
		end if;
end;

-- Представления
create or replace view view_user_files
as
select u.accountname,m2.filename,mt.name as media_type
from media m2 
join users u on m2.user_id = u.id 
join media_types mt on mt.id = m2.media_type_id;


create or replace view view_games_by_developers
as
select g.gamename as 'Game', d.name as 'Developer'
from games g 
	join developers d on g.developers_id = d.id; 

select * from view_games_by_developers;

-- Триггеры
delimiter //
create trigger check_user_age_before_update before update on profiles
for each row 
begin 
	if new.birthday >= now() then 
		signal sqlstate '45000' set MESSAGE_TEXT = 'Birthday must be in the past!';
	end if;
end//

delimiter ;

