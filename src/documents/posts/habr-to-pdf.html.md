```
title: Сохранить пост Habrahabr в PDF
layout: post
tags:
  - 'bookmarklet'
  - 'javascript'
date: 2011-11-06
```

![](/images/habr-to-pdf/habr-to-pdf__preview.png)

Букмарклет, с помощью которого можно сохранять пост [Хабрахабр](http://habrahabr.ru/) в **.pdf**

**Установка:**
Перетащите эту ссылку на вашу панель закладок:

<a class="bookmarklet" href="javascript: var myurl = window.location.pathname; myurl = myurl.match(/\/\d{6}\//); location.href = 'http://html-pdf-converter.com/ru/convert?u=' + 'http://habrahabr.ru/mob/post' + escape(myurl[0]); void(0);" title="Habr to PDF">Habr to PDF</a>

Или создайте новую закладку, в адрес вставьте код:

```javascript
javascript: var myurl = window.location.pathname; myurl = myurl.match(/\/\d{6}\//); location.href = 'http://html-pdf-converter.com/ru/convert?u=' + 'http://habrahabr.ru/mob/post' + escape(myurl[0]); void(0);
```

Более подробно установка букмарклета описана в смежном посте [Переключаем пост на Habrahabr в мобильный вид](http://vovanr.com/posts/habr-to-mhabr)

**Использование:**
Находясь на странице поста — жмем на созданный букмарклет. Ссылка на пост преобразуется в мобильный вид и отсылается на онлайн конвертер [PDF Converter](http://html-pdf-converter.com/ru/)
Удобно для чтения с электронной книги.
