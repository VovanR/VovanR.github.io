```
title: My Book Live Ubuntu бэкап
layout: post
tags:
  - 'backup'
  - 'linux'
  - 'ubuntu'
  - 'wd-mybook-live'
date: 2012-01-04
```

1.  Настраиваем статический <acronym title="Internet Protocol">IP</acronym> для хранилища <kbd>Настройки</kbd>→<kbd>Сеть</kbd> (но лучше сделать это через маршрутизатор, а на хранилище оставить <acronym title="Dynamic Host Configuration Protocol">DHCP</acronym>).

    ![Настройка статического IP](/images/my-book-live-ubuntu-backup/my-book-live-ubuntu-backup__configure-1.png)

2.  Создаем нового пользователя `vovan`:

    ![Добавление нового пользователя](/images/my-book-live-ubuntu-backup/my-book-live-ubuntu-backup__configure-2.png)


3.  Создаем для пользователя папку `vovan_shared`:

    ![Добавление папки для пользователя](/images/my-book-live-ubuntu-backup/my-book-live-ubuntu-backup__configure-3.png)


4.  Сделаем автоматически подключаемый диск (более подробно по [ссылке](https://ubuntuforums.org/showthread.php?t=1658828) и [тут](https://help.ubuntu.com/community/MountWindowsSharesPermanently)).

    ```bash
    sudo mkdir /root/smb/
    sudo chmod 700 /root/smb/
    sudo nano /root/smb/credentials
    ```

    Запишем в `credentials` логин и пароль созданного пользователя:

    ```nohighlight
    username=vovan
    password=vovanpassword
    ```

    ```bash
    sudo chown root /root/smb/credentials
    sudo chmod 600 /root/smb/credentials
    ```

    Назовем подключаемый диск как `My-Book-Live`

    ```bash
    sudo mkdir /media/My-Book-Live
    sudo apt-get install cifs-utils
    sudo apt-get install smbfs
    sudo nano /etc/fstab
    ```

    Запишем в `fstab` (это одна строка):

    ```nohighlight
    //192.168.10.110/vovan_shared /media/My-Book-Live cifs credentials=/root/smb/credentials,rw,iocharset=utf8,uid=1000,gid=1000 0 0
    ```

    Перезагрузка `fstab`:

    ```bash
    sudo mount -a
    ```


5.  Можно бэкапить:

    ```bash
    sudo -i
    cd /home/vovan && rsync -avz --progress --delete /home/vovan /media/My-Book-Live/backup --exclude ".*" --exclude "Downloads"
    ```

    А так я делаю бэкап виндовой папки "Мои документы".

    ```bash
    cd '/media/Documents/Мои документы' && rsync -avz --progress --delete '/media/Documents/Мои документы' /media/My-Book-Live/backup --exclude ".*" --exclude "Thumbs.db"
    ```
