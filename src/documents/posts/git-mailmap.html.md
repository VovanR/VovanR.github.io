```
title: Git mailmap или как объединить разработчика
layout: post
tags:
  - 'development'
  - 'git'
date: 2020-07-27
```

Бывает, что разработчик коммитит под разными именами или имейлами, а это часто может сбивать с толку.
Например при работе с историей коммитов мы ищем нужный коммит от определённого разработчика, но он в те далёкие времена называл себя по-другому.

Гит позволяет объединить данные такого разработчика.

Например команда `git shortlog -s -n -e` выводит количество коммитов на каждого разработчика.
Если один разработчик коммитил под разными имейлами или именами, то вывод будет таким:
```
10 Foo Bar <foo.bar@gmail.com>
3 Foo Bar <foo.bar@ya.ru>
4 Foo B. Bar <foo.bar@example.com>
1 Foobar <foo.bar@baz.com>
```

Можно объединить такие записи.
Для этого создаём в репозитории файл `.mailmap` и описываем маппинги.
Например мы хотим объединить разработчика из вывода выше в такой вид: `Foo Bar <foo.bar@gmail.com>`.

Для этого надо:
1. Обновить имя для имейлов `<foo.bar@example.com>` и `<foo.bar@baz.com>` на `Foo Bar`.
2. Объединить имейлы `<foo.bar@ya.ru>`, `<foo.bar@example.com>` и `<foo.bar@baz.com>` на `<foo.bar@gmail.com>`.

Файл `.mailmap` будет выглядеть так:
```
Foo Bar <foo.bar@example.com>
Foo Bar <foo.bar@baz.com>
<foo.bar@gmail.com> <foo.bar@ya.ru>
<foo.bar@gmail.com> <foo.bar@example.com>
<foo.bar@gmail.com> <foo.bar@baz.com>
```

Теперь вывод команды будет правильным:
```
18 Foo Bar <foo.bar@gmail.com>
```

В файле можно оставлять комментарии, может быть полезно, если пользователей много:
```
# See: https://git-scm.com/docs/git-shortlog#_mapping_authors
# git shortlog -s -n -e

# Foo Bar
Foo Bar <foo.bar@example.com>

# Baz Qux
Baz Qux <baz.qux@example.com>
<baz.qux@example.com> <baz@example.com>
<baz.qux@example.com> <baz.q@example.com>
```

Маппинги, описанные в файле `.mailmap` влияют так же на вывод комманды `git log` — данные автора коммита обновятся и там.


## Дополнительные материалы

- [Mapping Authors](https://git-scm.com/docs/git-shortlog#_mapping_authors)
