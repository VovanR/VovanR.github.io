```
title: PHP настройка временной зоны (date.timezone)
layout: post
tags:
  - 'bug'
  - 'php'
  - 'apache'
date: 2012-08-12
```

![Вывод ошибки Xdebug'ом](/images/php-datetimezone/php-datetimezone__preview.png)

Ошибка возникает, если не настроена временная зона для <abbr title="PHP: Hypertext Preprocessor">PHP</abbr>:

<p class="warning">Warning: date() [function.date]: It is not safe to rely on the system's timezone settings. You are *required* to use the date.timezone setting or the date_default_timezone_set() function. In case you used any of those methods and you are still getting this warning, you most likely misspelled the timezone identifier. We selected 'Asia/Dubai' for 'GST/4,0/no DST' instead in /Users/vovan/blah-blah-blah/vars.class on line 43</p>

Ищем как правильно пишется наша зона на офф сайте: [Список поддерживаемых временных зон](http://www.php.net/manual/ru/timezones.asia.php)
Теперь внесем правки в конфиг PHP. Чтобы найти где он расположен, воспользуемся командой `locate`:

```bash
locate php.ini
    /Applications/Zend/ZendStudio-5.5.0/bin/php4/php.ini
    /Applications/Zend/ZendStudio-5.5.0/bin/php5/php.ini
    /Applications/Zend/ZendStudio-5.5.0/bin/phpdocumentor/php.ini
    /Users/vovan/php.ini
    /opt/local/etc/php5/php.ini
    /opt/local/etc/php5/php.ini-development
    /opt/local/etc/php5/php.ini-production
    /opt/local/etc/php5/php.ini.bak
    /private/etc/php.ini.default
```

Редактируем наши настройки:

```bash
sudo nano /Users/vovan/php.ini
```

Включаем поиск: <kbd>Ctrl</kbd>+<kbd>w</kbd>, пишем слово _zone_, жмем <kbd>Enter</kbd>:

```nohighlight
[Date]
; Defines the default timezone used by the date functions
;date.timezone =
```

Раскомментируем строку с настройкой, и вставляем нужную зону:

```nohighlight
[Date]
; Defines the default timezone used by the date functions
date.timezone = "Asia/Dubai"
```

Перезапускаем апач:

```bash
sudo apachectl restart
```
