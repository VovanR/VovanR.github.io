```
title: Переключаем пост на Habrahabr в мобильный вид
layout: post
tags:
    - 'bookmarklet'
    - 'javascript'
date: 2011-11-05
status: old
```

![](/images/habr-to-mhabr/habr-to-mhabr__preview.png)

Букмарклет кнопка для переключения страницы [Хабрахабр](//habrahabr.ru/) в мобильный вид.

## Установка
Перетащите эту ссылку на вашу панель закладок:

<a class="bookmarklet" title="Habr to mHabr" href="javascript:!function(o){var n=o.location;n.href=n.protocol+'//m.'+n.host+n.pathname}(window);void(0);">to mHabr</a>

Или создайте новую закладку, в адрес вставьте код:

```javascript
javascript:!function(o){var n=o.location;n.href=n.protocol+'//m.'+n.host+n.pathname}(window);void(0);
```

Затем добавить эту закладку в вашу панель закладок.
Или создать кнопку для Оперы: <kbd>правой кнопкой по любой панели</kbd>→<kbd>Настроить</kbd>→<kbd>Оформление…</kbd>→<kbd>Кнопки</kbd>→<kbd>Мои кнопки</kbd> — переместить сюда закладку, поместить созданную кнопку куда угодно.

## Использование
Когда находимся на странице со статьей — жмем по этой кнопке. Страница преобразуется в мобильную версию.

Я обычно интересные статьи сохраняю в веб архив _(Ctrl+s) **"Веб архив (единственный файл)"**_ в формате _**.mht**_ и читаю на телефоне через оперу мобайл.
Ранняя версия:

Исходники проекта: [Habr To mHabr Bookmarklet](//github.com/VovanR/habr-to-mhabr-bookmarklet)
