```
title: Букмарклет для сброса кэша
layout: post
tags:
  - 'Bookmarklet'
  - 'JavaScript'
date: 2011-12-12
```

На работе часто приходится очищать кэш сайта. Собственно для того я и написал этот букмарклет.
Для установки перетянуть следующую ссылку на панель закладок:
<a class="bookmarklet" href="javascript:l=function(){setTimeout(function(){var a=window.frames['fcc'].location.pathname.split('/');if(a[a.length-2]=='admin'){f.style.display='none';m.setAttribute('style',lol+'background:#093;border:1px solid #093;color:#FFF');d.innerHTML='Success!';window.location.reload();}else{f.style.display='block';m.setAttribute('style',lol+'background:#C00;border:1px solid #C00;color:#FFF');d.innerHTML='Authorization...';}},100);};var lol='position:fixed;z-index:9999;top:9px;left:50%;margin-left:-128px;width:256px;box-shadow:0 2px 4px rgba(0,0,0,0.2);border-radius:2px;text-align:center;font:14px/25px sans-serif;overflow:hidden;';if(!document.getElementById('mcc')){var m=document.createElement('div');var f=document.createElement('iframe');var d=document.createElement('div');m.setAttribute('style',lol+'background:#F9EDBE;border:1px solid #F0C36D;color:#000');m.setAttribute('id','mcc');f.setAttribute('name','fcc');f.setAttribute('id','fcc');f.setAttribute('onLoad','l();');f.setAttribute('src','/admin/admin/clear_cache/');f.setAttribute('style','display:none;border:none;height:290px;width:100%');d.setAttribute('style','cursor:pointer');d.setAttribute('onclick','document.getElementById(\'mcc\').style.display=\'none\';return false');d.innerHTML='Clearing Cache...';m.appendChild(d);m.appendChild(f);document.body.appendChild(m);}else{var m=document.getElementById('mcc');var d=m.getElementsByTagName('div')[0];var f=document.getElementById('fcc');m.style.display='block';}void(0);" title="Сбросить кэш">clear_cache</a>

Или вставить в поле адреса закладки следующий код:

    javascript:l=function(){setTimeout(function(){var a=window.frames['fcc'].location.pathname.split('/');if(a[a.length-2]=='admin'){f.style.display='none';m.setAttribute('style',lol+'background:#093;border:1px solid #093;color:#FFF');d.innerHTML='Success!';window.location.reload();}else{f.style.display='block';m.setAttribute('style',lol+'background:#C00;border:1px solid #C00;color:#FFF');d.innerHTML='Authorization...';}},100);};var lol='position:fixed;z-index:9999;top:9px;left:50%;margin-left:-128px;width:256px;box-shadow:0 2px 4px rgba(0,0,0,0.2);border-radius:2px;text-align:center;font:14px/25px sans-serif;overflow:hidden;';if(!document.getElementById('mcc')){var m=document.createElement('div');var f=document.createElement('iframe');var d=document.createElement('div');m.setAttribute('style',lol+'background:#F9EDBE;border:1px solid #F0C36D;color:#000');m.setAttribute('id','mcc');f.setAttribute('name','fcc');f.setAttribute('id','fcc');f.setAttribute('onLoad','l();');f.setAttribute('src','/admin/admin/clear_cache/');f.setAttribute('style','display:none;border:none;height:290px;width:100%');d.setAttribute('style','cursor:pointer');d.setAttribute('onclick','document.getElementById(\'mcc\').style.display=\'none\';return false');d.innerHTML='Clearing Cache...';m.appendChild(d);m.appendChild(f);document.body.appendChild(m);}else{var m=document.getElementById('mcc');var d=m.getElementsByTagName('div')[0];var f=document.getElementById('fcc');m.style.display='block';}void(0);


<iframe allowfullscreen="allowfullscreen" frameborder="0" src="http://jsfiddle.net/VovanR/tLjLX/5/embedded/" style="height: 300px; width: 100%;"></iframe>
Для отладки файл _"newhtml1.html"_ содержит кнопку:

    <button onclick="window.location.href='../newhtml.html/'; return false;">Reload Frame</button>

Ранняя версия (создает новую вкладку, где переходит по адресу очистки кеша и закрывает вкладку):

    javascript:var secondwindow=window.open('http://'+window.location.host+'/admin/admin/clear_cache');window.setTimeout("lol()",2000);var lol=function(){if(secondwindow && !secondwindow.closed)secondwindow.close();};void(0);
