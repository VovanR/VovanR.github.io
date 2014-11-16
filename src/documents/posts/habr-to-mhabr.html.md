```
title: Переключаем пост на Habrahabr в мобильный вид
layout: post
tags:
  - 'bookmarklet'
  - 'javascript'
date: 2011-11-05
```

![](/images/habr-to-mhabr/habr-to-mhabr__preview.png)

Букмарклет кнопка для переключения страницы [Хабрахабр](http://habrahabr.ru/) в мобильный вид.

**Установка:**
Перетащите эту ссылку на вашу панель закладок:

<a class="b-bookmarklet" title="Habr to mHabr" href="javascript: var myurl = window.location.pathname; myurl = myurl.match(/\/\d{6}\//); location.href = 'http://habrahabr.ru/mob/post' + escape(myurl[0]); void(0);">Habr to mHabr</a>

Или создайте новую закладку, в адрес вставьте код:

```javascript
javascript: var myurl = window.location.pathname; myurl = myurl.match(/\/\d{6}\//); location.href = 'http://habrahabr.ru/mob/post' + escape(myurl[0]); void(0);
```

Затем добавить эту закладку в вашу панель закладок.
Или создать кнопку для Оперы: <kbd>правой кнопкой по любой панели</kbd>→<kbd>Настроить</kbd>→<kbd>Оформление…</kbd>→<kbd>Кнопки</kbd>→<kbd>Мои кнопки</kbd> — переместить сюда закладку, поместить созданную кнопку куда угодно.

**Использование:**
Когда находимся на странице со статьей — жмем по этой кнопке. Страница преобразуется в мобильную версию.

Я обычно интересные статьи сохраняю в веб архив _(Ctrl+s) **"Веб архив (единственный файл)"**_ в формате _**.mht**_ и читаю на телефоне через оперу мобайл.
Ранняя версия:

```javascript
javascript: var myurl = window.location.pathname; myarr = myurl.split('/'); var i = myarr.length - 2; myurl = myarr[i]; location = 'http://habrahabr.ru/mob/post/' + escape(myurl); void(0);
```
