```
title: Настройка Ubuntu для веб-разработчика
layout: post
tags:
    - 'apache'
    - 'atom'
    - 'dns'
    - 'dnsmasq'
    - 'html'
    - 'ie'
    - 'java'
    - 'lamp'
    - 'linux'
    - 'nodejs'
    - 'php'
    - 'ubuntu'
    - 'virtualbox'
date: 2013-01-13
status: popular
```

<p class="note">Проверено на Xubuntu 12.04 – 16.10. Подойдет и для других дистрибутивов.</p>

- [Установка *LAMP* сервера](#anchor-lamp)
    - [Модули *Apache*](#anchor-lamp-apache)
- [Директория проектов](#anchor-sites)
- [Добавление сайтов в *Apache*](#anchor-site-apache)
- [*PHP*](#anchor-php)
    - [Модули *PHP*](#anchor-php-modules)
    - [Настройки *PHP* (php.ini)](#anchor-php-ini)
- [Настройка локального *DNS*](#anchor-dns)
- [Установка *Adminer*](#anchor-adminer)
- [Установка *Node.js*](#anchor-nodejs)
- [Установка среды разработки](#anchor-ide)
    - [Установка *Java Platform (JDK)*](#anchor-java)
    - [Установка *NetBeans IDE*](#anchor-netbeans)
    - [Установка *Atom*](#anchor-atom)
- [Установка *VirtualBox*](#anchor-virtualbox)
    - [Установка *Internet Explorer*](#anchor-ie-vm)



<h3 id="anchor-lamp">Установка <acronym title="Linux, Apache, MySQL, and PHP">LAMP</acronym> сервера</h3>

[источник](http://help.ubuntu.ru/wiki/lamp)

```bash
sudo apt-get install tasksel
sudo tasksel install lamp-server
```

Открываем в браузере `http://localhost/` Если увидели: <samp>It works!</samp> — все сделано правильно.

Зададим веб-серверу *Apache* его имя — для этого введем в консоле:

```bash
sudo nano /etc/apache2/apache2.conf
```

И добавим строку:

```nohighlight
ServerName localhost
```

Вместо `localhost` можно указать ваш домен, если он настроен.

Перезапустим *Apache*:

```bash
sudo service apache2 restart
```

<div class="special">
<p>Советую создать алиас для быстрого вызова данной команды. Использовать ее будете часто.</p>

<pre class="highlight"><code class="hljs bash">nano ~/.bash_aliases
alias apre="sudo service apache2 restart"</code></pre>

<p>Чтобы алиас заработал сразу — можно ввести команду:</p>

<pre class="highlight"><code class="hljs bash">source ~/.bashrc</code></pre>
</div>



<h4 id="anchor-lamp-apache">Модули <em>Apache</em></h4>

Смотрим подключенные модули:

```bash
sudo a2dismod
```

Выведет список подключенных модулей, которые тут же можно отключить.

Или по-старинке:

```bash
ls /etc/apache2/mods-enabled/
```

Подключаем нужные модули (принцип работы тот же):

```bash
sudo a2enmod rewrite
```



<h3 id="anchor-sites">Директория проектов</h3>

```bash
mkdir ~/Sites
```

Чтобы жить было легче — создаем симлинк:

```bash
sudo ln -s $HOME/Sites /sites
```

<div class="warning">
<p>Если ваш раздел зашифрован, то директорию для сайтов придется создавать в другом месте:</p>

<pre class="highlight"><code class="hljs bash">sudo mkdir /home/public_html
cd /home/public_html
sudo mkdir \`whoami\`
sudo chown \`whoami\`:\`whoami\` \`whoami\`
chmod +x \`whoami\`
ln -s /home/public_html/\`whoami\` /home/\`whoami\`/Sites
sudo ln -s /home/public_html/\`whoami\` /sites</code></pre>
</div>


<h3 id="anchor-site-apache">Добавление сайтов в <em>Apache</em></h3>

```shell
sudo nano /etc/apache2/sites-available/vovan.conf
```

Добавляем запись для нового виртуального хоста (он же наш локальный сайт):

```apache
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

Включаем созданный хост в *Apache*:

```shell
sudo a2ensite vovan
```

Новые сайты добавляем в тот же файл:

```apache
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

Перезапустим *Apache*:

```shell
sudo service apache2 restart
```


<h3 id="anchor-php"><em>PHP</em></h3>

<h4 id="anchor-php-modules">Модули <em>PHP</em></h4>

Установим модуль *PHP* для работы с *JSON*:

```shell
sudo apt-get install php5-json
```

Модуль *PHP* для работы с картинками:

```shell
sudo apt-get install php5-gd
```

Кэширование:

```shell
sudo apt-get install php5-memcache
```

<h4 id="anchor-php-ini">Настройка <em>PHP</em> <small>(php.ini)</small></h4>

```shell
sudo nano /etc/php5/apache2/php.ini
```

Меняем следующие настройки:

```nohighlight
short_open_tag On
error_reporting = E_ALL
post_max_size = 128M
upload_max_filesize = 512M
date.timezone = "Europe/Moscow"
```

Свою временную зону смотрим по адресу [http://ru2.php.net/manual/en/timezones.php](http://ru2.php.net/manual/en/timezones.php)


<h3 id="anchor-dns">Настройка локального <acronym title="Domain Name System">DNS</acronym></h3>

Установим *Dnsmasq*:

```shell
sudo apt-get install dnsmasq
sudo nano /etc/dnsmasq.conf
```

Находим строку с настройкой адреса `address=/` (включаем поиск: <kbd>Ctrl</kbd>+<kbd>w</kbd>, пишем слово `address=/`, жмем <kbd>Enter</kbd>)

Правим ее следующим образом:

```nohighlight
address=/vovan/192.168.10.303
```

Где `vovan` — это имя нашего домена, а `192.168.10.303` — *IP* адрес компьютера.

Айпи нужен для того, чтобы наши сайты были доступны из виртуальных машин. Если же вам такая возможность не нужна, то можно оставить адрес по-умолчанию — `127.0.0.1`

Узнать свой локальный айпи можно с помощью команды `ifconfig`

```shell
ifconfig
```

<samp>eth0      Link encap:Ethernet  HWaddr 00:55:88:00:00:00
inet addr:<strong style="text-decoration:underline;">192.168.10.303</strong> ...</samp>

Перезапустим *Dnsmasq*:

```shell
sudo service dnsmasq restart
```

<p class="special">Теперь наши сайты доступны по адресам типа <a href="http://example.vovan">http://example.vovan</a></p>



<h3 id="anchor-adminer">Установка <em>Adminer</em></h3>

Быстрая компактная альтернатива *phpMyAdmin*. Качаем: [http://www.adminer.org/](http://www.adminer.org/)

```shell
mkdir -p ~/Sites/adminer/www
mv ~/Downloads/adminer-4.2.2.php ~/Sites/adminer/www/index.php
chmod 755 ~/Sites/adminer/www/index.php
sudo nano /etc/apache2/sites-available/vovan.conf
```

```apache
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

Перезапустим *Apache*:

```shell
sudo service apache2 restart
```

По адресу `http://adminer.vovan` мы можем управлять локальными *MySQL* базами.


<h3 id="anchor-nodejs">Установка <em>Node.js</em></h3>

Ставим по инструкции ([installation-instructions](https://github.com/nodesource/distributions#installation-instructions)):

```shell
curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
sudo apt-get install nodejs
```

Чтобы избежать проблем с правами — переопределим местонахождение пакетов ([fixing-npm-permissions](https://docs.npmjs.com/getting-started/fixing-npm-permissions)):

```shell
mkdir -p ~/.npm-global/bin
npm config set prefix '~/.npm-global'
```



<h3 id="anchor-ide">Установка среды разработки</h3>

Большинство сред разработки написаны на *Java*, поэтому с нее и начнем.

<h4 id="anchor-java">Установка <em>Java Platform (JDK/JRE)</em></h4>

```shell
sudo add-apt-repository ppa:webupd8team/java && sudo apt-get update
sudo apt-get install oracle-java8-installer oracle-java8-set-default
```


<h4 id="anchor-netbeans">Установка <em>NetBeans IDE</em></h4>

Качаем: [https://netbeans.org/downloads/](https://netbeans.org/downloads/)

Устанавливаем:

```shell
sh ~/Downloads/netbeans-7.2.1-ml-php-linux.sh
```


<h4 id="anchor-atom">Установка <em>[Atom](https://atom.io/)</em></h4>

Качаем `.deb`
```shell
sudo dpkg -i ~/Downloads/atom-amd64.deb
```

Чтобы никогда не увидеть ошибку <samp>TypeError: Unable to watch path</samp> ([typeerror-unable-to-watch-path](https://github.com/atom/atom/blob/master/docs/build-instructions/linux.md#typeerror-unable-to-watch-path)):

```shell
sudo sysctl fs.inotify.max_user_watches=32768
echo 32768 | sudo tee -a /proc/sys/fs/inotify/max_user_watches
```

Делаем *Atom* редактором по-умолчанию — заменим `gedit.desktop` на `atom.desktop`

```shell
sudo atom /usr/share/applications/defaults.list
```



<h3 id="anchor-virtualbox">Установка <em>VirtualBox</em></h3>

Устанавливаем виртуальную машину через менеджер пакетов...

Из настроек виртуальной машины нас интересует только следующее:

- **Network**
```nohighlight
Network → Adapter 1
	Attached to: NAT
	Advanced:
		PCnet-FAST III (Am79C973)
```

- **Shared Folders**
```nohighlight
Add shared folder
	Folder Path: /sites
		Auto-mount
```


<h4 id="anchor-ie-vm">Установка <em>Internet Explorer</em></h4>

Качаем и ставим нужные версии: [https://dev.modern.ie/tools/vms/](https://dev.modern.ie/tools/vms/)

Теперь, запущенный локально сайт, например `http://localhost:3000` на виртуалке будет доступен по адресу `http://10.0.2.2:3000/` А те, что добавлены в апач, по тем же ссылкам: `http://adminer.vovan` например.
