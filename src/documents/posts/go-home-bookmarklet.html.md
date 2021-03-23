```
title: Букмарклет для перехода на главную страницу
layout: post
tags:
  - 'bookmarklet'
  - 'javascript'
date: 2011-12-13
```

![](/images/go-home-bookmarklet/go-home-bookmarklet__preview.png)

Часто надо перейти на главную страницу сайта. Для этого приходится убирать лишнее в адресной строке.

Но и такую тривиальную задачу можно повесить на отдельную кнопочку:

<a class="bookmarklet" href="javascript:!function(l){l.href=l.protocol+'//'+l.host}(window.location);void(0);" title="На главную">Index</a>

```javascript
javascript:!function(l){l.href=l.protocol+"//"+l.host}(window.location);void(0);
```

И, чтобы быстро зайти в админку, находясь на любой странице сайта:

<a class="bookmarklet" href="javascript:!function(l){l.href=l.protocol+'//'+l.host+'/admin/'}(window.location);void(0);" title="Админка">Admin</a>

```javascript
javascript:!function(l){l.href=l.protocol+"//"+l.host+"/admin/"}(window.location);void(0);
```

<fieldset>
<legend>Сгенерировать буркмарклет</legend>
	<dl class="form">
		<dt>
			<label for="p-go-home-link">Цель:</label>
		</dt>
		<dd>
			<input id="p-go-home-link" onchange="generateBookmarklet();" onkeyup="generateBookmarklet();" type="text" style="width:100%" value="admin">
		</dd>
	</dl>
	<dl class="form">
		<dt>
			<label for="p-go-home-name">Название:</label>
		</dt>
		<dd>
			<input id="p-go-home-name" onchange="setBookmarkletName();" onkeyup="setBookmarkletName();" type="text" style="width:100%" value="PushMe">
		</dd>
	</dl>
	<dl class="form">
		<dt>
			<label for="p-go-home-result">URL:</label>
		</dt>
		<dd>
			<input id="p-go-home-result" class="big" onclick="this.select();" readonly type="text" style="width:100%" value="javascript:window.location.href=window.location.protocol+'//'+window.location.host+'/admin/';void(0);">
		</dd>
	</dl>
	<dl class="form">
		<dt>
			<label for="p-go-home-button">Букмарклет:</label>
		</dt>
		<dd>
			<a id="p-go-home-button" class="bookmarklet" href="javascript:window.location.href=window.location.protocol+'//'+window.location.host+'/admin/';void(0);">PushMe</a>
		</dd>
	</dl>
</fieldset>

<script>
window.generateBookmarklet = function() {
	var link = document.getElementById('p-go-home-link').value;
	var result = "javascript:!function(l){l.href=l.protocol+'//'+l.host+'/";
	if (link != '') {
		result += link;
	}
	result += "'}(window.location);void(0);";
	document.getElementById('p-go-home-result').value = result;
	document.getElementById('p-go-home-button').href = result;
};
window.setBookmarkletName = function() {
    document.getElementById('p-go-home-button').innerText = document.getElementById('p-go-home-name').value;
};
</script>

Работает это довольно просто: `window.location.protocol` — возвращает протокол (обычно `https:`), и `window.location.host` — возвращает хост (например `draft.blogger.com`). Результат применяем к адресу страницы — `window.location.href`

Пример:

Находимся на странице `https://vovanr.com/2011/12/blog-post.html`. Щелкаем букмарклет — попадаем на `https://vovanr.com/`
