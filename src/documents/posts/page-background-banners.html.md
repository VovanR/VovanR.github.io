```
title: Баннеры на фоне сайта
layout: post
tags:
  - 'css'
  - 'html'
date: 2012-08-07
```

![](/images/page-background-banners/page-background-banners__preview.png)

Как поставить баннеры на фон страницы сайта? Без горизонтальной прокрутки? Элементарно: [пример](http://jsfiddle.net/VovanR/k9wec/2/).

Пример полностью скопирован с [Яндекса](http://football2012.yandex.ru/).

**CSS:**

```css
body {
    color: #000;
    font: 0.8em "Arial", "Helvetica", sans-serif;
    background: #FFF;
    margin: 0;
    padding: 0 0 1em;
    position: relative;
    z-index: 0;
}
.b-page {
    background: #445A71;
    min-width: 300px;
    margin: 0;
    padding: 0;
}
.b-page_banner_ru {
    background: #0C1D63;
}

.b-wrotator {
    text-align: center;
    width: 100%;
    height: 500px;
    position: absolute;
    z-index: 1;
    overflow: hidden;
}
    .b-wrotator__i {
        min-width: 300px;
        max-width: 400px;
        margin: 0 auto;
        position: relative;
    }
        .b-wrotator__left {
            width: 200px;
            height: 500px;
            position: absolute;
            left: -200px;
        }
        .b-page_banner_ru .b-wrotator__left {
            background: transparent url("http://placehold.it/100x500/f8abe1/fff&text=BANNER") 100% 0 no-repeat;
        }
        .b-wrotator__right {
            width: 200px;
            height: 500px;
            position: absolute;
            right: -200px;
        }
        .b-page_banner_ru .b-wrotator__right {
            background: transparent url("http://placehold.it/100x500/f8abe1/fff&text=BANNER") no-repeat;
        }

.l-width__i {
    max-width: 400px;
    min-width: 300px;
    margin: 0 auto;
    background: #FFF;
    position: relative;
    z-index: 2;
}
```

**HTML:**

```html
<!--
Баннеры по бокам страницы
Скопипащено с яндекса (http://football2012.yandex.ru/)
-->
<!DOCTYPE html>
<html>
<head>
    <title>Баннеры по бокам страницы</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body class="b-page b-page_banner_ru">

<div class="b-wrotator">
    <div class="b-wrotator__i">
        <!-- Баннер слева -->
        <a class="b-wrotator__left" href="http://ya.ru/" target="_blank"></a>

        <!-- Баннер справа -->
        <a class="b-wrotator__right" href="http://ya.ru/" target="_blank"></a>
    </div>
</div>

<div class="l-width">
    <div class="l-width__i">
        <div class="l-width__i__i">

            <!-- Здесть контент страницы -->
            <p>Content there</p>

        </div>
    </div>
</div>

</body>
</html>
```