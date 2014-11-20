```
title: Как не использовать a(href="#")
layout: post
tags:
  - 'javascript'
  - 'html'
date: 2014-11-08
```

Решил разобраться чем заменить *HTML* тэг `a` при верстке контролов, которые программируются яваскриптом.

Тесты всех вариантов, описанных ниже: [jsfiddle.net/VovanR/omt6am8z/](http://jsfiddle.net/VovanR/omt6am8z/).

Рассмотрим что можно использовать, а от чего лучше отказаться:

## a(href="link_anywhere")
Для обеспечения перехода к странице по ссылке, если отключен *JavaScript*.

Пример №1: ссылка авторизации `a(href="/login/")` — открывает форму авторизации, а если *JavaScript* отключен, то осуществляет переходит на страницу авторизации.

Пример №2: ссылка `a(href="#anchor-page-header")` — анимация скроллинга к началу страницы. Без *JavaScript* происходит перемещение к началу страницы, если шапке сайта задан `id="anchor-page-header"` или там создан якорь `a(name="anchor-page-header")`.

## a(href="#")
Не использовать.

## a(href="javascript:void(0)")
Использовать только для букмарклетов.

Например [букмарклет для перехода на главную страницу](/posts/go-home-bookmarklet):
```html
<a href="javascript:window.location.href=window.location.protocol+'//'+window.location.host;void(0);" title="На главную">Index</a>
```

<a href="javascript:window.location.href=window.location.protocol+'//'+window.location.host;void(0);" class="b-bookmarklet" title="На главную">Index</a>


## a(href="") или a(href)
Не использовать.

## a
Не использовать.
Равносильно `span`.

## span
Использовать, если не нужна навигация клавишей <kbd>Tab</kbd> или с помощью плагина [VimFx](https://addons.mozilla.org/EN-US/firefox/addon/vimfx/).

## span(tabindex="0")
Использовать.

## button(type="button")
Использовать.

## Таблица возможностей

<table class="b-super-table">
<thead>
<tr>
<th></th>
<th class="b-super-table__type"><div><code>a(href="link_anywhere")</code></div></th>
<th class="b-super-table__type"><div><code>a(href="#")</code></div></th>
<th class="b-super-table__type"><div><code>a(href="javascript:void(0)")</code></div></th>
<th class="b-super-table__type"><div><code>a(href="")</code> и <code>a(href)</code></div></th>
<th class="b-super-table__type"><div><code>a</code></div></th>
<th class="b-super-table__type"><div><code>span</code></div></th>
<th class="b-super-table__type"><div><code>span(tabindex="0")</code></div></th>
<th class="b-super-table__type"><div><code>button(type="button")</code></div></th>
</tr>
</thead>
<tbody>
<tr>
<td class="b-super-table__problem">Не нужет <code>preventDefault</code></td>
<td><span class="b-super-table__false">✗</span></td>
<td><span class="b-super-table__false">✗</span></td>
<td><span class="b-super-table__true">✓</span></td>
<td><span class="b-super-table__false">✗</span></td>
<td><span class="b-super-table__true">✓</span></td>
<td><span class="b-super-table__true">✓</span></td>
<td><span class="b-super-table__true">✓</span></td>
<td><span class="b-super-table__true">✓</span></td>
</tr>
<tr>
<td class="b-super-table__problem">Навигация по <kbd>Tab</kbd></td>
<td><span class="b-super-table__true">✓</span></td>
<td><span class="b-super-table__true">✓</span></td>
<td><span class="b-super-table__true">✓</span></td>
<td><span class="b-super-table__true">✓</span></td>
<td><span class="b-super-table__false">✗</span></td>
<td><span class="b-super-table__false">✗</span></td>
<td><span class="b-super-table__true">✓</span></td>
<td><span class="b-super-table__true">✓</span></td>
</tr>
<tr>
<td class="b-super-table__problem">Вызов по <kbd>Enter</kbd></td>
<td><span class="b-super-table__true">✓</span></td>
<td><span class="b-super-table__true">✓</span></td>
<td><span class="b-super-table__true">✓</span></td>
<td><span class="b-super-table__true">✓</span></td>
<td><span class="b-super-table__false">✗</span></td>
<td><span class="b-super-table__false">✗</span></td>
<td><span class="b-super-table__false">✗</span></td>
<td><span class="b-super-table__true">✓</span></td>
</tr>
<tr>
<td class="b-super-table__problem">Вызов по <kbd>Space</kbd></td>
<td><span class="b-super-table__false">✗</span></td>
<td><span class="b-super-table__false">✗</span></td>
<td><span class="b-super-table__false">✗</span></td>
<td><span class="b-super-table__false">✗</span></td>
<td><span class="b-super-table__false">✗</span></td>
<td><span class="b-super-table__false">✗</span></td>
<td><span class="b-super-table__false">✗</span></td>
<td><span class="b-super-table__true">✓</span></td>
</tr>
<tr>
<td class="b-super-table__problem">При отключенном <em>JavaScript</em></td>
<td><span class="b-super-table__true">✓</span></td>
<td><span>-</span></td>
<td><span>-</span></td>
<td><span>-</span></td>
<td><span>-</span></td>
<td><span>-</span></td>
<td><span>-</span></td>
<td><span>-</span></td>
</tr>
<tr>
<td class="b-super-table__problem">Нет <em>URL</em> при наведении</td>
<td><span class="b-super-table__false">✗</span></td>
<td><span class="b-super-table__false">✗</span></td>
<td><span class="b-super-table__false">✗</span></td>
<td><span class="b-super-table__false">✗</span></td>
<td><span class="b-super-table__true">✓</span></td>
<td><span class="b-super-table__true">✓</span></td>
<td><span class="b-super-table__true">✓</span></td>
<td><span class="b-super-table__true">✓</span></td>
</tr>
</tbody>
</table>

## Дополнительные материалы:
- [Правильные ссылки](http://www.artlebedev.ru/tools/technogrette/html/links/)
- [Почему `<a href="javascript:...">` - плохо](http://javascript.ru/unsorted/why_href_js_is_bad)
