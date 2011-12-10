use llfb;

select concat("http://graph.facebook.com/",u.alias,"/picture") as avatar
from users u
where provider='facebook' and avatar is null;

update users
set avatar=concat("http://graph.facebook.com/",u.alias,"/picture")
where provider='facebook' and avatar is null;