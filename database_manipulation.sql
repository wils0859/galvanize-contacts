alter table users add column is_human boolean;

update users set is_human = true where first_name <> 'Danny';

update users set is_human = false where first_name = 'Danny';

delete from users where is_human = true;

drop database galvanize_contacts;
