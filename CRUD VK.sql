insert into users (`id`, `firstname`, `lastname`, `email`, `phone`)
values ('2000', 'Dimas', 'Rodriguez', 'dimas@yahoo.com', '89554442214');

insert into users values
('2001', 'Dimas', 'Rodriguez', 'dimas1@yahoo.com', null, '89554442215'),
('2002', 'Dimas', 'Rodriguez', 'dimas2@yahoo.com',null, '89554442216'),
('2003', 'Dimas', 'Rodriguez', 'dimas3@yahoo.com', null, '89554442217'),
('2004', 'Dimas', 'Rodriguez', 'dimas4@yahoo.com',null, '89554442218');

select * from users where id=2000;
select * from users where `phone`=89554442216;

insert into users
set
firstname = 'Dimas',
lastname = 'Rodrieguez',
email = 'dimas5@yahoo.com',
phone = '89554442219';

select distinct firstname, lastname from users;

select * 
from users
limit 1 offset 5;

select *
from users
where  id = 700 or firstname = 'Dimas';

select *
from users
where  id in (606,709,2003,1100);

update friend_requests 
set status = 'approved'
where initiator_user_id = 646 and target_user_id = 646 and status = 'requested';

delete from messages
where from_user_id = 641 and to_user_id = 641 and id = 17;

truncate messages;
