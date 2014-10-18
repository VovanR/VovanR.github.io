```
title: Настройка Ubuntu для веб-разработчика
layout: post
tags:
  - 'DNS'
  - 'PHP'
  - 'Apache'
  - 'HTML'
  - 'Java'
  - 'Linux'
  - 'LAMP'
  - 'VirtualBox'
date: 2013-01-13
```

<p class="note">
Конкретно для Xubuntu 12.04 — 14.04. Подойдет и для других дистрибутивов, я думаю.
</p>

Оглавление:

- [Установка LAMP сервера](#anchor-lamp)
    - [Модули apache](#anchor-lamp-apache)
- [Директория проектов](#anchor-sites)
- [Добавление сайтов в apache](#anchor-site-apache)
- [Настройка локального DNS](#anchor-dns)
- [Установка Adminer](#anchor-adminer)
- [Установка среды разработки](#anchor-ide)
    - [Установка Java Platform (JDK)](#anchor-java)
    - [Установка NetBeans IDE](#anchor-netbeans)
- [Установка VirtualBox](#anchor-virtualbox)



<h3 id="anchor-lamp">Установка LAMP сервера</h3>
[источник](http://help.ubuntu.ru/wiki/lamp)

```
sudo apt-get install tasksel
sudo tasksel install lamp-server
```


Открываем в браузере [http://localhost/](http://localhost/). Если увидели: <samp>"It works!"</samp> — все сделано правильно.

Зададим веб-серверу apache его имя &mdash; для этого введем в консоле:

```
sudo nano /etc/apache2/apache2.conf
```

И добавим строку:

```
ServerName localhost
```

Вместо `localhost` можно указать ваш домен, если он настроен.

Перезагружаем apache:

```
sudo service apache2 restart
```

<div class="special">
Советую создать алиас для быстрого вызова данной команды. Использовать ее будете часто.

<pre><code>nano ~/.bash_aliases
alias apre="sudo service apache2 restart"</code></pre>

Чтобы алиас заработал сразу — можно ввести команду:

<pre><code>source ~/.bashrc</code></pre>
</div>



<h4 id="anchor-lamp-apache">Модули apache</h4>
Смотрим подключенные модули:

```
sudo a2dismod
```

Выведет список подключенных модулей, которые тут же можно отключить.
Или по-старинке:

```
ls /etc/apache2/mods-enabled/
```

Подключаем нужные модули (принцип работы тот же):

```
sudo a2enmod rewrite
```



<h3 id="anchor-sites">Директория проектов</h3>

```
mkdir ~/Sites
```

Чтобы жить было легче &mdash; создаем симлинк:

```
sudo ln -s $HOME/Sites /sites
```

<div class="warning">
Если ваш раздел зашифрован, то директорию для сайтов придется создавать в другом месте. Например:

<pre><code>mkdir /home/Sites
sudo ln -s /home/Sites /sites
sudo ln -s /home/Sites $HOME/sites</code></pre>
</div>


<h3 id="anchor-site-apache">Добавление сайтов в apache</h3>

```
sudo nano /etc/apache2/sites-available/vovan.conf
```

Добавляем запись для нового виртуального хоста (он же наш локальный сайт).

```
<VirtualHost *:80>
    DocumentRoot /sites/example/www
    ServerName example
    ServerAlias example.vovan
    ErrorLog /sites/example/error.log
    CustomLog /sites/example/access.log common
    <Directory "/sites/example/www">
        Options FollowSymLinks
        Require all granted
    </Directory>
</VirtualHost>
```

Включаем созданный хост в апач:

```
sudo a2ensite vovan
```

Новые сайты добавляем в тот же файл. Пример:

```
<VirtualHost *:80>
    DocumentRoot /sites/example/www
    ServerName example
    ServerAlias example.vovan
    ErrorLog /sites/example/error.log
    CustomLog /sites/example/access.log common
    <Directory "/sites/example/www">
        Options FollowSymLinks
        Require all granted
    </Directory>
</VirtualHost>
<VirtualHost *:80>
    DocumentRoot /sites/adminer/www
    ServerName adminer
    ServerAlias adminer.vovan
    ErrorLog /sites/adminer/error.log
    CustomLog /sites/adminer/access.log common
    <Directory "/sites/adminer/www">
        Options FollowSymLinks
        Require all granted
    </Directory>
</VirtualHost>
```

Перезагружаем Apache:

```
sudo service apache2 restart
```


Установим модуль php для работы с JSON

```
sudo apt-get install php5-json
```


<h3 id="anchor-dns">Настройка локального DNS</h3>
Установим `dnsmasq`

```
sudo apt-get install dnsmasq
```

Вносим правку в файл `/etc/dnsmasq.conf`
Находим строку с настройкой адреса `address=/`
Правим ее следующим образом:

```
address=/vovan/192.168.10.303
```

Где `vovan` &mdash; это имя нашего домена, а `192.168.10.303` &mdash; ip адрес компьютера.
Айпи нужен для того, чтобы наши сайты были доступны из виртуальных машин. Если же вам такая возможность не нужна, то можно оставить адрес по-умолчанию &mdash; `127.0.0.1`.
Узнать свой локальный айпи можно с помощью команды `ifconfig`:

```
ifconfig
```

<samp>eth0      Link encap:Ethernet  HWaddr 00:55:88:00:00:00
inet addr:<strong style="text-decoration:underline;">192.168.10.303</strong> ...</samp>

Перезапустим dnsmasq:

```
sudo service dnsmasq restart
```



<div class="special">
Теперь наши сайты доступны по адресам типа <a href="http://example.vovan">http://example.vovan</a>
</div>



<h3 id="anchor-adminer">Установка Adminer</h3>
Быстрая компактная альтернатива phpMyAdmin
Качаем: [http://www.adminer.org/](http://www.adminer.org/)

```
mkdir -p ~/Sites/adminer/www
mv ~/Downloads/adminer-3.6.1-mysql.php ~/Sites/adminer/www/index.php
```


```
sudo nano /etc/apache2/sites-available/vovan.conf
```

```
<VirtualHost *:80>
    DocumentRoot /sites/example/www
    ServerName example
    ServerAlias example.vovan
    ErrorLog /sites/example/error.log
    CustomLog /sites/example/access.log common
    <Directory "/sites/example/www">
        Options FollowSymLinks
        Require all granted
    </Directory>
</VirtualHost>
<VirtualHost *:80>
    DocumentRoot /sites/adminer/www
    ServerName adminer
    ServerAlias adminer.vovan
    ErrorLog /sites/adminer/error.log
    CustomLog /sites/adminer/access.log common
    <Directory "/sites/adminer/www">
        Options FollowSymLinks
        Require all granted
    </Directory>
</VirtualHost>
```

Перезагружаем apache:

```
sudo service apache2 restart
```



<h3 id="anchor-ide">Установка среды разработки</h3>
Большинство сред разработки написаны на Java, поэтому с нее и начнем.

<h4 id="anchor-java">Установка Java Platform (JDK)</h4>
[источник](http://habrahabr.ru/post/143113/)

1. Идем на сайт загрузок Java SE ([http://www.oracle.com/technetwork/java/javase/downloads](http://www.oracle.com/technetwork/java/javase/downloads)), и качаем пакет (`.rpm`), согласно нашей архитектуре:
Linux x86 (32-bit)
Linux x64 (64-bit)
2. Устанавливаем `alien`, по сути это конвертер пакетов который перепакует скачанные `.rpm` пакеты в нужный нам формат `.deb`, со своими хитростями.

	sudo apt-get install alien

3. Натравливаем «чужого» на скачанный rpm.

	sudo alien jdk-7u4-linux-x64.rpm --scripts

На данном этапе, будет сгенерирован `.deb` пакет, в той же директории.
4. Далее по накатанной, устанавливаем пакет, создаем симлинки и радуемся жизни.

	sudo dpkg -i jdk_1.7.009-1_i386.deb
	mkdir -p ~/.mozilla/plugins
	ln -s /usr/java/jdk1.7.0_09/jre/lib/i386/libjavaplugin_jni.so ~/.mozilla/plugins/
	ln -s /usr/java/jdk1.7.0_09/jre/lib/i386/libnpjp2.so ~/.mozilla/plugins/


Либо есть способ по-проще:

	sudo add-apt-repository ppa:webupd8team/java
	sudo apt-get update
	sudo apt-get install oracle-java7-installer


<h4 id="anchor-netbeans">Установка NetBeans IDE</h4>
Качаем: [http://netbeans.org/downloads/](http://netbeans.org/downloads/)
Устанавливаем:

	sh ~/Downloads/netbeans-7.2.1-ml-php-linux.sh



<h3 id="anchor-virtualbox">Установка VirtualBox</h3>
Устанавливаем виртуальную машину через менеджер пакетов...
Из настроек виртуальной машины нас интересует только следующее:

- **Network**

	Network &rarr; Adapter 1
		Attached to: NAT
		Advanced:
			PCnet-FAST III (Am79C973)

- **Shared Folders**

	Add shared folder
		Folder Path: /sites
			Auto-mount
