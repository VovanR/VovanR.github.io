```
title: Букмарклет для перехода на главную страницу
layout: post
tags:
  - 'Bookmarklet'
  - 'JavaScript'
date: 2011-12-13
```

Go_Home.png

Часто надо перейти на главную страницу сайта. Для этого приходится убирать лишнее в адресной строке.
Но и такую тривиальную задачу можно повесить на отдельную кнопочку:

<a class="b-bookmarklet" href="javascript:window.location.href=window.location.protocol+'//'+window.location.host;void(0);" title="На главную">Home</a>

```javascript
javascript:window.location.href=window.location.protocol+'//'+window.location.host;void(0);
```

И, чтобы быстро зайти в админку, находясь на любой странице сайта:

<a class="b-bookmarklet" href="javascript:window.location.href=window.location.protocol+'//'+window.location.host+'/admin/';void(0);" title="Админка">Admin</a>

```javascript
javascript:window.location.href=window.location.protocol+'//'+window.location.host+'/admin/';void(0);
```

<p class="special">**Новинка:** Теперь вы можете в более удобной форме сгенерировать для себя похожую кнопочку. Под катом находится форма генератор. Жми Читать дальше:</p>

<fieldset>
<legend>Сгенерировать буркмарклет</legend>
	<dl class="form">
		<dt>
			<label for="p-go-home-link">Цель:</label>
		</dt>
		<dd>
			<input id="p-go-home-link" onchange="ppp();" onkeyup="ppp();" type="text" value="admin">
		</dd>
	</dl>
	<dl class="form">
		<dt>
			<label for="p-go-home-result">Выхлоп:</label>
		</dt>
		<dd>
			<input id="p-go-home-result" class="big" onclick="this.select();" readonly type="text" value="javascript:window.location.href=window.location.protocol+'//'+window.location.host+'/admin/';void(0);">
		</dd>
	</dl>
	<dl class="form">
		<dt>
			<label for="p-go-home-button">Кнопка:</label>
		</dt>
		<dd>
			<a id="p-go-home-button" class="b-bookmarklet" href="javascript:window.location.href=window.location.protocol+'//'+window.location.host+'/admin/';void(0);">PushMe</a>
		</dd>
	</dl>
</fieldset>

<script>
ppp = function() {
	var link = document.getElementById('p-go-home-link').value;
	var result = "javascript:window.location.href=window.location.protocol+'//'+window.location.host+'/";
	if (link != '') {
		result += link;
		result += "/";
	}
	result += "';void(0);";
	document.getElementById('p-go-home-result').value = result;
	document.getElementById('p-go-home-button').href = result;
};
</script>

Работает это довольно просто: `window.location.protocol` &mdash; возвращает протокол (обычно `http:`), и `window.location.host` &mdash; возвращает хост (например `draft.blogger.com`). Результат применяем к адресу страницы &mdash; `window.location.href`

Пример:
Находимся на странице `http://vovanr.com/2011/12/blog-post.html`. Щелкаем букмарклет &mdash; попадаем на `http://vovanr.com/`
