select count(*), g.gamename as favorite_game
from profiles p 
join games g on p.favorite_games_id = g.id
group by favorite_game
order by 1 desc;

select count(*), gg.name as genre
from games g 
join game_genre gg on g.game_genre_id = gg.id
group by genre;

select u.accountname,m2.filename,mt.name as media_type
from media m2 
join users u on m2.user_id = u.id 
join media_types mt on mt.id = m2.media_type_id;

select count(*), u.accountname,mt.name as media_type
from media m2 
join users u on m2.user_id = u.id 
join media_types mt on mt.id = m2.media_type_id
where mt.name = 'photo'
group by u.accountname;

select g.gamename as 'Game', d.name as 'Developer'
from games g 
	join developers d on g.developers_id = d.id; 