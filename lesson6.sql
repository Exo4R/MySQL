-- Пусть задан некоторый пользователь. Из всех друзей этого пользователя найдите человека, который больше всех общался с нашим пользователем.
Select count(*), from_user_id 
from messages
where from_user_id in (
select initiator_user_id from friend_requests where target_user_id = 601 and `status` = 'approved'
union
select target_user_id from friend_requests where initiator_user_id = 601 and `status` = 'approved')
group by from_user_id
order by 1 desc -- можно добавить limit 1;

-- Подсчитать общее количество лайков, которые получили 10 самых молодых пользователей.

-- Определить кто больше поставил лайков (всего) - мужчины или женщины?

-- Найти 10 пользователей, которые проявляют наименьшую активность в использовании социальной сети.

