```
title: Ubuntu сравнение папок и файлов
layout: post
tags:
    - 'diff'
    - 'linux'
    - 'meld'
    - 'ubuntu'
date: 2014-12-23
```

Как сравнить два каталога или лог-файла?

Для этого я использую программу [*Meld*](//meldmerge.org/).

## Установка

```bash
sudo apt-get install meld
```

## Использование

### Запуск из терминала

```bash
meld ./foo ../bar/baz
```

### Запуск из меню

Запускаем, сравниваем

![Сравнение логов](/images/ubuntu-diff-folders-and-files/ubuntu-diff-folders-and-files__preview.png)

Еще можно смотреть *git-диффы* и решать конфликты при мерже.

## Настройки

Не забываем добавить в игнор папки сторонних модулей `node_modules` и `bower_components`
<kbd>Meld</kbd>→<kbd>Preferences</kbd>→<kbd>File Filters</kbd>

![Игнорирование директорий](/images/ubuntu-diff-folders-and-files/ubuntu-diff-folders-and-files__ignore-dirs.png)

## Дополнительные материалы:
- [Обзор инструментов для визуального сравнения и разрешения конфликтов слияния](//habrahabr.ru/post/150001/)
