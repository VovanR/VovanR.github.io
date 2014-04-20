```
title: Проблема схлопывания при float: left
layout: post
tags:
  - 'CSS'
  - 'HTML'
date: 2012-04-03
```

floatleft.png

Есть несколько способов борьбы со схлопыванием родительского блока.
[Пример проблемы](http://jsfiddle.net/VovanR/qqTrj/2/)

**Нулевой** &mdash; задавать размеры родительского блока с помощью свойств `width` и `height`
[Пример 0](http://jsfiddle.net/VovanR/CQ6up/2/)


**Первый** &mdash; добавить ему свойство `overflow: hidden;` Часто этого хватает. Исключение составляют случаи, когда необходимо, чтобы дочерний блок выходил за пределы родительского. Свойство `overflow: hidden;` обрезает все, что находится за пределами родительского блока.
[Пример 1](http://jsfiddle.net/VovanR/y7cbC/2/)


**Второй** &mdash; перед закрытием родительского блока, добавлять пустой блок:

	<div class="clear"></div>
	
[Пример 2](http://jsfiddle.net/VovanR/3Mhuk/1/)


**Третий** &mdash; использование `clear fix`
Берем из [CSS-Tricks](http://css-tricks.com/snippets/css/clear-fix/):

	/* Clear */
	.group:before,
	.group:after {
	    content: "";
	    display: table;
	}
	.group:after {
	    clear: both;
	}
	.group {
	    zoom: 1; /* For IE 6/7 (trigger hasLayout) */
	}

Вот что получилось:
[Пример 3](http://jsfiddle.net/VovanR/Lknps/3/)


**Четвертый** &mdash; воспользоваться свойством `display: inline-block`
[Пример 4](http://jsfiddle.net/VovanR/6yJK6/2/) или так [Пример 4.2](http://jsfiddle.net/VovanR/CTXh6/2/)

Каждый метод имеет свои достоинства и недостатки.
