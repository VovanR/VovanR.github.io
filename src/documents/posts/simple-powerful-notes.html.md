```
title: Как и где вести свои заметки
layout: post
tags:
  - 'development'
date: 2014-12-23
```

Я пробовал разные системы ведения заметок, но все они имели следующие недостатки:
- Перегруженность интерфейса
- Уродование форматирования заметки
- Долгий отклик. Все, что работает не мгновенно — не подходит
- Медленный поиск по записям
- Доступность не на всех платформах

В итоге пришел к простой связке: *Markdown* + *Dropbox* + *Sublime Text*

## Хранилище заметок *Dropbox*
Можно использовать любое другое облачное хранилище.
Структура каталога у меня выглядит следующим образом:
```
~/Dropbox/Notes/
├── AMD.md
├── Backbone.md
├── Bash.md
├── com.VovanR.md
├── Config.md
├── CSS.md
├── Django.md
├── Fishes.md
├── Git.md
├── Guitar.md
├── HTML.md
├── JavaScript.md
├── Markdown.md
├── MODx.md
├── PHP.md
├── Projects.md
├── Python.md
├── RegExp.md
├── SVN.md
├── TO-DO.md
├── TRASH.md
└── Vim.md
```
Это дает мне доступ к заметкам с любого устройства в любое время.
Заметки в актуальном состоянии везде и всегда.

## Язык разметки *Markdown*
Простой, понятный, мощный, популярный, [стандартизированный](//commonmark.org/).
Заметки легко экспортировать в любую систему, так как *Markdown* поддерживется везде.

## Текстовый редактор *Sublime Text*
Быстрый, гибкий, дружелюбный.
Можно использовать любой другой легковесный редактор. Главное, чтобы он автоматически сохранял измененные файлы (<kbd>Ctrl</kbd>+<kbd>s</kbd> — наш враг).
На компьютере у меня создан проект для данной директории. Проект находится в другой папке, чтобы не вызывать конфликтов от разных систем:
```
~/Documents/Notes/
├── Notes.sublime-project
└── Notes.sublime-workspace
```
Важно включить настройку автосохранения файла при потере фокуса
```
{
  "save_on_focus_lost": true
}
```
Для удобства и нормальной подсветки синтаксиса я ставлю плагин [MarkdownEditing](//sublime.wbond.net/packages/MarkdownEditing)

![Заметки в Sublime Text](/images/simple-powerful-notes/simple-powerful-notes__preview.png)

## Заметки со смартфона
У меня андроид, поэтому открываю заметки в [JotterPad X](//2appstudio.com/jotterpadx/) подключенный к *Dropbox*. Но подойдет любой другой удобный редактор `markdown`.

## Примеры
Структура заметки
<pre><code class="markdown"># <Название раздела>

----

## <Название заметки>
See: <ссылка на источник>
<Описание, если надо>
```<Язык разметки>
<Код заметки>
```
</code></pre>

Живой пример `~/Dropbox/Notes/Bash.md`:
<pre><code class="markdown"># Bash

----

## Копирование текста в консоле
```bash
sudo apt-get install xclip
```


## Установка старой версии пакета
```bash
apt-cache showpkg libnss3-tools
sudo apt-get install libnss3-tools=2:3.15.1-1ubuntu1
```


## Архивация
See: http://www.thegeekstuff.com/2010/04/unix-tar-command-examples/
```bash
tar cvf archive_name.tar dirname/
tar cvzf archive_name.tar.gz dirname/
tar cvfj archive_name.tar.bz2 dirname/
```
</code></pre>
