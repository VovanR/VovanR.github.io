```
title: Как использовать Bower в Django
layout: post
tags:
  - 'bower'
  - 'django'
date: 2014-11-20
```

## Установка *Bower*
У вас должен быть установлен *Node.js* и *Git*.
Для установки *Node.js* на локальной машине, я советую использовать [Node Version Manager](https://github.com/creationix/nvm).
Теперь ставим [Bower](http://bower.io/)
```
npm install -g bower
```

## Настройки для *Bower*
Создаем в корне проекта файл `.bowerrc`
```json
{
  "directory": "./bower_components/vendor"
}
```

И файл `bower.json`
```json
{
  "name": "myproject",
  "version": "0.0.0",
  "dependencies": {
    "bootstrap": "~3.3.1",
    "jquery": "~2.1.1",
    "modernizr": "~2.8.3",
    "normalize-css": "~3.0.1"
  },
  "private": true
}
```

## Установка пакетов
В корне проекта запускаем:
```
bower install
```

## Настройка *Django*
Чтобы пакеты бовера стали доступны через `staticfiles`, добавим директорию в настройках проекта (`settings.py`)
```python
STATICFILES_DIRS = (
    . . .
    os.path.join(BASE_DIR, 'bower_components'),
)
```

## Вызов библиотек в шаблоне
Подключаем `{% load staticfiles %}` в шаблоне нашего приложения.
Теперь мы можем подключать библиотеки так: `{% static 'vendor/jquery/dist/jquery.min.js' %}`

### Пример подключения *jQuery* из *CDN*
За основу взят шаблон [HTML5 Boilerplate](
https://github.com/h5bp/html5-boilerplate/blob/master/dist/index.html)
```django
<!doctype html>
<html class="no-js" lang="">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title></title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="apple-touch-icon" href="apple-touch-icon.png">
    <!-- Place favicon.ico in the root directory -->

{% load staticfiles %}
{% block styles %}
    <link rel="stylesheet" href="{% static 'vendor/normalize-css/normalize.css' %}">
    <link rel="stylesheet" href="{% static 'css/main.css' %}">
{% endblock styles %}

    {# Модернизр нельзя убирать из `head`, так как он добавляет поддержку #}
    {# HTML5 тэгов в старых браузерах #}
    <script src="{% static 'vendor/modernizr/modernizr.js' %}"></script>
</head>
<body>
    <!--[if lt IE 8]>
        <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
    <![endif]-->

    <!-- Add your site or application content here -->
    <p>Hello world! This is HTML5 Boilerplate.</p>

{% block scripts %}
    <script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <script>window.jQuery || document.write('<script src="{% static 'vendor/jquery/dist/jquery.min.js' %}"><\/script>')</script>

    <script src="{% static 'js/plugins.js' %}"></script>
    <script src="{% static 'js/main.js' %}"></script>
{% endblock scripts %}

{% block analytics %}
    <!-- Google Analytics: change UA-XXXXX-X to be your site's ID. -->
    <script>
    (function(b,o,i,l,e,r){b.GoogleAnalyticsObject=l;b[l]||(b[l]=
    function(){(b[l].q=b[l].q||[]).push(arguments)});b[l].l=+new Date;
    e=o.createElement(i);r=o.getElementsByTagName(i)[0];
    e.src='//www.google-analytics.com/analytics.js';
    r.parentNode.insertBefore(e,r)}(window,document,'script','ga'));
    ga('create','UA-XXXXX-X','auto');ga('send','pageview');
    </script>
{% endblock analytics %}
</body>
</html>
```

## Дополнительные материалы:
[Bower: зачем фронтенду нужен менеджер пакетов](http://nano.sapegin.ru/all/bower)
