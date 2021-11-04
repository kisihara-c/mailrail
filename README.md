# mailrail

Mailrail is a simple mail reminder.
You post text,and Mailrail will send at the time appointed.

## mail
```
subject : reserved success

you reserved a mailrail.

text:< remindText >
time:About < sendTime >

;) We are mailrail.c, a simple mail reminder.
https://mailrail-c.herokuapp.com/
Have a good dream <3

If you didn't do it, ignore them, and please contact us.
Sorry.
```


```
subject : < remindText > 

< remindText > ,someone reminds you.

;) We are mailrail.c, a simple mail reminder.
https://mailrail-c.herokuapp.com/
Have a good dream <3
```

## table
|mails||
|-|-|
|id|integer|
|remind_str|string|
|dest_address|string|
|sending_at|datetime|
|is_sent|boolean|

## version
ruby 2.6.8p205

## dev start
```bash
bundle install --without production
rails s
```

```bash
git remote add heroku https://git.heroku.com/mailrail-c.git
git push heroku main
```
