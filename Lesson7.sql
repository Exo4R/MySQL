-- Составьте список пользователей users, которые осуществили хотя бы один заказ orders в интернет магазине.

select count(o.id) as number_of_orders , u.name
from orders o
	join users u on u.id = o.user_id
group by u.name;

-- Выведите список товаров products и разделов catalogs, который соответствует товару.

select p.name, c.name 
from products p 
	join catalogs c on p.catalog_id = c.id;
	
-- Пусть имеется таблица рейсов flights (id, from, to) и таблица городов cities (label, name). Поля from, to и label содержат английские названия городов, поле name — русское. Выведите список рейсов flights с русскими названиями городов.

drop table if exists flights;
create table flights
(
id serial primary key,
from_city  text,
to_city  text
);

drop table if exists cities;
create table cities
(
label text,
name text
);

insert into flights 
values 
(1, 'moscow', 'omsk'),
(2, 'novgorod', 'kazan');

insert into cities 
values
('moscow','москва'),
('omsk', 'омск'),
('novgorod','новгород'),
('kazan', 'казань');

select id as flight_number, c.name as 'from', c2.name as 'to'
from flights f 
	join cities c on f.from_city = c.label
	join cities c2 on f.to_city = c2.label;