select * from "user" order by last_name desc ;


select * from "user" order by create_date asc limit 5;

SELECT DISTINCT u.id, u.first_name, u.last_name, u.email FROM "user" u 
left JOIN user_friend f ON f.first_user_id = u.id 
left JOIN user_friend f1 ON f1.second_user_id = u.id
where
f.first_user_id = u.id 
or
f1.second_user_id = u.id;

--------------------
SELECT u.id, u.first_name, u.last_name, u.email FROM "user" u 
inner JOIN user_friend f ON f.second_user_id = u.id
union
SELECT u.id, u.first_name, u.last_name, u.email FROM "user" u 
inner JOIN user_friend f ON f.first_user_id = u.id;


SELECT DISTINCT u.id, u.first_name, u.last_name, u.email FROM "user" u 
left JOIN user_friend f ON f.first_user_id = u.id 
left JOIN user_friend f1 ON f1.second_user_id = u.id
where
f.first_user_id = u.id 
or
f1.second_user_id = u.id;
--------------------------


select * from messages 
where 
discussion_group_id = 1
and
id_user = 1
tdfb-# order by create_date_time asc limit 1;


select mini_games.id, name from mini_games 
left join playing_games 
on playing_games.id_game  = mini_games.id
where playing_games.id is null;


select * from "user"
left join (
select distinct "user".id as id_user_actif from "user"
left join post on post.id_user = "user".id
left join messages on messages.id_user = "user".id
where
create_date_time > current_timestamp - interval '13 month'
or
post.create_date > current_date - interval '13 month'
) as user_actif on user_actif.id_user_actif = "user".id
where user_actif.id_user_actif is null;


select * from