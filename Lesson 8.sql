-- Пусть задан некоторый пользователь. Из всех пользователей соц. сети найдите человека, который больше всех общался с выбранным пользователем (написал ему сообщений).

select count(*), from_user_id sender, to_user_id me
from users
	join messages m on users.id = m.to_user_id
where
users.id=601
group by sender
order by 1 Desc;

-- Подсчитать общее количество лайков, которые получили пользователи младше 10 лет

select count(*) as total_likes, u.firstname, timestampdiff(year,p.birthday,current_date()) as 'age'
from media m 
	join likes l on m.id = l.media_id
	join users u on u.id = m.user_id
	join profiles p on u.id = p.user_id
where 'age' < 10 -- Не получается убрать значения меньше 10
group by u.firstname 
order by 1 desc;

-- Определить кто больше поставил лайков (всего): мужчины или женщины.

select count(*), p.gender as Gender
from likes l 
	join users u on u.id = l.user_id
	join profiles p on u.id = p.user_id
where p.gender = 'f'
union
select count(*), p.gender as Gender
from likes l 
	join users u on u.id = l.user_id
	join profiles p on u.id = p.user_id
where p.gender = 'm'
group by Gender
order by 1 desc;

