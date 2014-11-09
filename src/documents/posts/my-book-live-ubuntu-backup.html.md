```
title: My Book Live Ubuntu бэкап
layout: post
tags:
  - 'Backup'
  - 'Linux'
  - 'WD My Book Live'
date: 2012-01-04
```

[Источник](http://statuscritical.co.za/node/40)


1.  Настраиваем статический <acronym title="Internet Protocol">IP</acronym> для хранилища <kbd>Настройки</kbd>→<kbd>Сеть</kbd> (но лучше сделать это через маршрутизатор, а на хранилище оставить <acronym title="Dynamic Host Configuration Protocol">DHCP</acronym>).

    ![Настройка статического IP](/images/my-book-live-ubuntu-backup/my-book-live-ubuntu-backup__configure-1.png)

2.  Создаем нового пользователя `vovan`:

    ![Добавление нового пользователя](/images/my-book-live-ubuntu-backup/my-book-live-ubuntu-backup__configure-2.png)


3.  Создаем для пользователя папку `vovan_shared`:

    ![Добавление папки для пользователя](/images/my-book-live-ubuntu-backup/my-book-live-ubuntu-backup__configure-3.png)


4.  Сделаем автоматически подключаемый диск (более подробно по [ссылке](http://ubuntuforums.org/showthread.php?t=1658828) и [тут](https://help.ubuntu.com/community/MountWindowsSharesPermanently)).

    ```
    sudo mkdir /root/smb/
    sudo chmod 700 /root/smb/
    sudo nano /root/smb/credentials
    ```

    Запишем в `credentials` логин и пароль созданного пользователя:

    ```
    username=vovan
    password=vovanpassword
    ```

    ```
    sudo chown root /root/smb/credentials
    sudo chmod 600 /root/smb/credentials
    ```

    Назовем подключаемый диск как `My-Book-Live`

    ```
    sudo mkdir /media/My-Book-Live

    sudo apt-get install cifs-utils
    sudo apt-get install smbfs

    sudo nano /etc/fstab
    ```

    Запишем в `fstab` (это одна строка):

    ```
    //192.168.10.110/vovan_shared /media/My-Book-Live cifs credentials=/root/smb/credentials,rw,iocharset=utf8,uid=1000,gid=1000 0 0
    ```

    Перезагрузка `fstab`:

    ```
    sudo mount -a
    ```


5.  Можно бэкапить:

    ```
    sudo -i

    cd /home/vovan && rsync -avz --progress --delete /home/vovan /media/My-Book-Live/backup --exclude ".*" --exclude "Downloads"
    ```

    А так я делаю бэкап виндовой папки "Мои документы".

    ```
    cd '/media/Documents/Мои документы' && rsync -avz --progress --delete '/media/Documents/Мои документы' /media/My-Book-Live/backup --exclude ".*" --exclude "Thumbs.db"
    ```
