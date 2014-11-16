```
title: SVN открыть в редакторе все конфликты
layout: post
tags:
  - 'bash'
  - 'netbeans'
  - 'svn'
date: 2012-07-18
```

```
$ svn st
C    about.html
C    css/style.css
C    index.html
```

Для решения конфликтов после мержа, я использую NetBeans, в котором, собственно и работаю над проектами. Чтобы не открывать конфликтные файлы по-одному, сделал небольшой алиас:

```
alias stcn="svn st | awk '/^C/{ print \$2 }' | xargs '/Applications/NetBeans/NetBeans 7.1.1.app/Contents/Resources/NetBeans/bin/netbeans' -J-Dline.separator=LF"
```

Под катом описание работы скрипта.

По порядку:

1.  Выводим статус репозитория: `svn status` или сокращенно `svn st`
2.  Собираем в одну строку вторую часть строк, начинающихся с символа `C`:

    ```
    awk '/^C/{ print $2 }
    ```
3.  Командой `xargs` передаем получившийся список файлов нетбинсу.
