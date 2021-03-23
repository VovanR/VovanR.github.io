```
title: Быстрая диагностика HTML кода
layout: post
tags:
  - 'bookmarklet'
  - 'css'
  - 'diagnostics'
  - 'javascript'
date: 2012-07-22
```

![Отображение недочетов на странице](/images/css-diagnostics-bookmarklet/css-diagnostics-bookmarklet__preview.png)

Часто бывает так, что по окончании процесса верстки и сборки сайта, забываешь проверить код на наличие недочетов. Таких как ссылки со значением атрибута `href="#"` или логотип без тайтла.

Именно для поиска таких мест и придумали [диагностические css стили](//css-tricks.com/snippets/css/css-diagnostics/).

Так как каждый раз вставлять руками данный стиль дело довольно расточительное, я написал [букмарклет кнопочку](//ru.wikipedia.org/wiki/Букмарклет) для браузера, нажав которую, вы увидите все самое интересное.

<a class="bookmarklet" href="javascript:!function(t){var e=t.createElement('style'),a=document.createTextNode('div:empty,span:empty,li:empty,p:empty,td:empty,th:empty{padding:20px;border:5px dotted #ff0!important}*[alt=\'\'],*[title=\'\'],*[class=\'\'],*[id=\'\'],a[href=\'\'],a[href=\'#\']{border:5px solid #ff0!important}applet,basefont,center,dir,font,isindex,menu,s,strike,u{border:5px dotted red!important}*[background],*[bgcolor],*[clear],*[color],*[compact],*[noshade],*[nowrap],*[size],*[start],*[bottommargin],*[leftmargin],*[rightmargin],*[topmargin],*[marginheight],*[marginwidth],*[alink],*[link],*[text],*[vlink],*[align],*[valign],*[hspace],*[vspace],*[height],*[width],ul[type],ol[type],li[type]{border:5px solid red!important}input[type=\'button\'],big,tt{border:5px dotted #3f0!important}*[border],a[target],table[cellpadding],table[cellspacing],*[name]{border:5px solid #3f0!important}');e.appendChild(a),t.head.appendChild(e)}(document);void(0);" title="Кто не спрятался, я не виноват">bug!</a>

```javascript
javascript:!function(t){var e=t.createElement("style"),a=document.createTextNode('div:empty,span:empty,li:empty,p:empty,td:empty,th:empty{padding:20px;border:5px dotted #ff0!important}*[alt=""],*[title=""],*[class=""],*[id=""],a[href=""],a[href="#"]{border:5px solid #ff0!important}applet,basefont,center,dir,font,isindex,menu,s,strike,u{border:5px dotted red!important}*[background],*[bgcolor],*[clear],*[color],*[compact],*[noshade],*[nowrap],*[size],*[start],*[bottommargin],*[leftmargin],*[rightmargin],*[topmargin],*[marginheight],*[marginwidth],*[alink],*[link],*[text],*[vlink],*[align],*[valign],*[hspace],*[vspace],*[height],*[width],ul[type],ol[type],li[type]{border:5px solid red!important}input[type="button"],big,tt{border:5px dotted #3f0!important}*[border],a[target],table[cellpadding],table[cellspacing],*[name]{border:5px solid #3f0!important}');e.appendChild(a),t.head.appendChild(e)}(document);void(0);
```

Исходники проекта: [CSS Diagnostics Bookmarklet](//github.com/VovanR/css-diagnostics-bookmarklet)
