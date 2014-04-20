```
title: Быстрая диагностика HTML кода
layout: post
tags:
  - 'Bookmarklet'
  - 'JavaScript'
  - 'CSS'
  - 'Diagnostics'
date: 2012-07-22
```

css-diagnostics-bookmarklet.png Отображение недочетов на странице

Часто бывает так, что по окончании процесса верстки и сборки сайта, забываешь проверить код на наличие недочетов. Таких как ссылки со значением атрибута `href="#"` или логотип без тайтла.
Именно для поиска таких мест и придумали [диагностические css стили](http://css-tricks.com/snippets/css/css-diagnostics/).

Так как каждый раз вставлять руками данный стиль дело довольно расточительное, я написал [букмарклет кнопочку](http://ru.wikipedia.org/wiki/Букмарклет) для браузера, нажав которую, вы увидите все самое интересное.
<a class="bookmarklet" href="javascript:(function addStylesheetRules(){var decls=[['div:empty,span:empty,li:empty,p:empty,td:empty,th:empty',['padding','20px'],['outline','5px dotted yellow',true]],['*[alt=\'\'],*[title=\'\'],*[class=\'\'],*[id=\'\'],a[href=\'\'],a[href=\'#\']',['outline','5px solid yellow',true]],['applet,basefont,center,dir,font,isindex,menu,s,strike,u',['outline','5px dotted red',true]],['*[background],*[bgcolor],*[clear],*[color],*[compact],*[noshade],*[nowrap],*[size],*[start],*[bottommargin],*[leftmargin],*[rightmargin],*[topmargin],*[marginheight],*[marginwidth],*[alink],*[link],*[text],*[vlink],*[align],*[valign],*[hspace],*[vspace],*[height],*[width],ul[type],ol[type],li[type]',['outline','5px solid red',true]],['input[type=\'button\'],big,tt',['outline','5px dotted #33FF00',true]],['*[outline],a[target],table[cellpadding],table[cellspacing],*[name]',['outline','5px solid #33FF00',true]]];var style=document.createElement('style');document.getElementsByTagName('head')[0].appendChild(style);if(!window.createPopup){style.appendChild(document.createTextNode(''));}var s=document.styleSheets[document.styleSheets.length-1];for(var i=0,dl=decls.length;i&lt;dl;i++){var j=1,decl=decls[i],selector=decl[0],rulesStr='';if(Object.prototype.toString.call(decl[1][0])==='[object Array]'){decl=decl[1];j=0;}for(var rl=decl.length;j&lt;rl;j++){var rule=decl[j];rulesStr+=rule[0]+':'+rule[1]+(rule[2]?'!important':'')+';\n';}if(s.insertRule){s.insertRule(selector+'{'+rulesStr+'}',s.cssRules.length);}else{s.addRule(selector,rulesStr,-1);}}})();void(0);" title="Кто не спрятался, я не виноват">bug!</a>

    javascript:(function addStylesheetRules(){var decls=[['div:empty,span:empty,li:empty,p:empty,td:empty,th:empty',['padding','20px'],['outline','5px dotted yellow',true]],['*[alt=""],*[title=""],*[class=""],*[id=""],a[href=""],a[href="#"]',['outline','5px solid yellow',true]],['applet,basefont,center,dir,font,isindex,menu,s,strike,u',['outline','5px dotted red',true]],['*[background],*[bgcolor],*[clear],*[color],*[compact],*[noshade],*[nowrap],*[size],*[start],*[bottommargin],*[leftmargin],*[rightmargin],*[topmargin],*[marginheight],*[marginwidth],*[alink],*[link],*[text],*[vlink],*[align],*[valign],*[hspace],*[vspace],*[height],*[width],ul[type],ol[type],li[type]',['outline','5px solid red',true]],['input[type="button"],big,tt',['outline','5px dotted #33FF00',true]],['*[outline],a[target],table[cellpadding],table[cellspacing],*[name]',['outline','5px solid #33FF00',true]]];var style=document.createElement('style');document.getElementsByTagName('head')[0].appendChild(style);if(!window.createPopup){style.appendChild(document.createTextNode(''));}var s=document.styleSheets[document.styleSheets.length-1];for(var i=0,dl=decls.length;i&lt;dl;i++){var j=1,decl=decls[i],selector=decl[0],rulesStr='';if(Object.prototype.toString.call(decl[1][0])==='[object Array]'){decl=decl[1];j=0;}for(var rl=decl.length;j&lt;rl;j++){var rule=decl[j];rulesStr+=rule[0]+':'+rule[1]+(rule[2]?'!important':'')+';\n';}if(s.insertRule){s.insertRule(selector+'{'+rulesStr+'}',s.cssRules.length);}else{s.addRule(selector,rulesStr,-1);}}})();void(0);

Функцию вставки стилей я взял с сайта MDN [insertRule](https://developer.mozilla.org/en/DOM/CSSStyleSheet/insertRule#Example_2) и немного обфусцировал.
