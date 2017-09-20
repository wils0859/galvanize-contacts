select first_name, last_name from users where date_of_birth > '2000-jan-01' order by last_name desc;

select biography from users where biography like '%man%';

select u.first_name, u.last_name, c.type, c.value from users u join contacts c on c.user_id = u.id where u.id = 3;

select first_name from users where date_of_birth < '2000-jan-01';

select u.first_name, u.last_name, count(c.user_id) from users u join contacts c on c.user_id = u.id group by u.id;
