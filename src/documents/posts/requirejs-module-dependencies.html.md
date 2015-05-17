```
title: RequireJS подключение зависимостей модуля
layout: post
tags:
  - 'amd'
  - 'javascript'
  - 'requirejs'
date: 2015-05-17
```

Чтобы избежать головной боли, я придерживаюсь следующего шаблона:
- Каждая зависимость в новой строке
- Зависимости, которые ничего не возвращают, подключаются в секции `nothing returns`

```javascript
define([
    'jquery',
    'lodash',

    // nothing returns
    'jqueryCookie',
    'jqueryPerfectScrollbar',
    'jqueryRaty',
], function (
    $,
    _
) {

    'use strict';

    // Module code...

});
```

Это упрощает рефакторинг и беглый парсинг взглядом.
