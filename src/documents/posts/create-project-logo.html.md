```
title: Как создать логотип для проекта
layout: post
tags:
  - 'favicon'
  - 'gh-pages'
  - 'svg'
date: 2018-09-06
```


Шаблон иконки
```svg
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 256 256" width="256" height="256">
  <path d="M0 0h256v256H0z" fill="none"/>

  <circle cx="128" cy="128" r="120" fill="blue"/>
</svg>
```
![Logo template](/images/create-project-logo/logo-template.svg)


Добавить иконку в `README.md`
```md
# my-new-project

<img align="right" width="120" height="120"
     src="./logo.svg" alt="My new project logo">
```


Генерируем фавиконки с помощью [Favicon Generator](https://realfavicongenerator.net/)

```shell
  > tree
  .
  ├── public
  │   ├── android-chrome-192x192.png
  │   ├── android-chrome-512x512.png
  │   ├── apple-touch-icon.png
  │   ├── browserconfig.xml
  │   ├── favicon-16x16.png
  │   ├── favicon-32x32.png
  │   ├── favicon.ico
  │   ├── manifest.json
  │   ├── mstile-144x144.png
  │   ├── mstile-150x150.png
  │   ├── mstile-310x150.png
  │   ├── mstile-310x310.png
  │   ├── mstile-70x70.png
  │   └── safari-pinned-tab.svg
  ├── logo.svg
  ├── package.json
  └── README.md
```


## Материалы
- [Favicon Generator. For real.](https://realfavicongenerator.net/)
- [vovanr-project-logos](https://github.com/VovanR/vovanr-project-logos)
