# mailrail

Mailrail is a simple mail reminder.
You post text,and Mailrail will send at the time appointed.

## mail
```
subject : < remindText > 

< remindText > ,someone reminds you.

;) We are mailrail.c, a simple mail reminder.
https://mailrail-c.herokuapp.com/
Have a good life <3
```

## table
|mails||
|-|-|
|id|integer|
|remindText|string|
|mailAddress|string|
|sendTime|datetime|

## version
ruby 2.6.8p205

## dev start
```bash
bundle install --without:production
rails s
```

