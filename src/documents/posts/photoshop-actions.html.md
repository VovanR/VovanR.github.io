```
title: Photoshop экшены для верстальщика
layout: post
tags:
  - 'Photoshop'
  - 'Actions'
date: 2013-03-03
```

Рассмотрим полезные экшены (проще говоря макросы) Photoshop для облегчения работы верстальщика с макетами.

Какие действия мы делаем чаще всего? Режем!

[Скачать экшены](http://yadi.sk/d/Zf1e4V5y30B_x)



### Обрезаем прозрачные областа картинки


![Подготовка картинки с прозрачным фоном](/images/photoshop-actions/photoshop-actions__action-1.png)

<kbd>Image &rarr; Trim...</kbd>
`Based On: Transparent Pixels`
`Trim Away: Top, Left, Bottom, Right`



### Обрезаем однотонные области картинки <small>(например иконка на белом фоне)</small>


![Подготовка картинки с цветным фоном](/images/photoshop-actions/photoshop-actions__action-2.png)

<kbd>Image &rarr; Trim...</kbd>
`Based On: Bottom Right Pixel Color`
`Trim Away: Top, Left, Bottom, Right`



### Для вертикального градиента делаем шинину 1px


![Подготовка градиента](/images/photoshop-actions/photoshop-actions__action-3.png)

<kbd>Image &rarr; Canvas Size...</kbd>
Снимаем галку `"Relative"`, в поле `"Width"` пишем `"1"`.

<p class="special">
<strong>Совет:</strong> помните, что дешевле всего вертикальные градиенты хранить в <code>PNG-24</code>
</p>
