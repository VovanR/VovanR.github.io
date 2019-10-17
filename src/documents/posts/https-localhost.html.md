```
title: https://localhost
layout: post
tags:
    - 'development'
    - 'docker'
    - 'ubuntu'
    - 'windows'
date: 2019-10-15
```

## 1. Создаём корневой сертификат

Генерируем ключ (RSA-2048 key)
```shell
openssl genrsa -des3 -out rootCA.key 2048
```

Генерируем корневой сертификат (Root SSL certificate)
```shell
openssl req -x509 -new -nodes -key rootCA.key -sha256 -days 1024 -out rootCA.pem
```

## 2. Добавляем корневой сертификат в список доверенных

### Ubuntu

- [Network Security Services](https://wiki.archlinux.org/index.php/Network_Security_Services) — Просмотр и управление сертификатами для браузеров
- [Mozilla NSS library](https://superuser.com/a/657177/274603) — Почему `update-ca-certificates` недостаточно
- [local-cert-generator](https://github.com/dakshshah96/local-cert-generator)

```shell
sudo cp rootCA.pem /usr/local/share/ca-certificates/rootCA.crt
sudo update-ca-certificates
```

**Добавляем корневой сертификат в Firefox и Chrome**

```shell
sudo apt install libnss3-tools
openssl pkcs12 -export -out rootCA.pfx -inkey rootCA.key -in rootCA.crt
pk12util -d sql:$HOME/.pki/nssdb -i rootCA.pfx
certutil -d sql:$HOME/.pki/nssdb -A -t "C,," -n myapp-certificate -i rootCA.pem
```
Перезагружаем браузер.

Если не помогло:

- Firefox: _Preferences_ → _Privacy & Security_ → _Certificates_ → _View Certificates..._ → _Authorities_ → _Import..._ → выбираем `rootCA.pem`
- Chrome: _Settings_ → _Privacy and security_ → _Manage certificates_ → _Authorities_ → _Import_ → выбираем `rootCA.pem`

Перезагружаем браузер.


### Windows 7

- [Installing a Self-Signed Certificate as a Trusted Root CA in Windows Vista](https://blogs.technet.microsoft.com/sbs/2008/05/08/installing-a-self-signed-certificate-as-a-trusted-root-ca-in-windows-vista/)

_Пуск_ → _Панель управления_ → _Свойства браузера_ → _Содержание_ → _Сертификаты_ → _Доверенные корневые центры сертификации_  
Жмём кнопку _«Импорт»_


### Windows 10

_Start_ → _Control Panel_ → _Network and Internet_ → _Internet Options_ → _Content_ → _Certificates_ → _Trusted Root Certification Authorities_  
_Import..._ → _Next_ → Выбрать `rootCA.pfx` → _Next_ → Заполнить _Password_ → _Next_ → _Finish_  
Security warning → _Yes_


## 3. Создаём сертификат домена

Создаём файл `server.csr.cnf` со следующим содержимым.  
В котором `CN` — доменное имя. Остальные поля заполняются как на шаге создания корневого сертификата.
```
[req]
default_bits=2048
prompt=no
default_md=sha256
distinguished_name=req_distinguished_name

[req_distinguished_name]
C=RU
ST=Saint-Petersburg
L=Saint-Petersburg
O=RandomOrganization
OU=RandomOrganizationUnit
emailAddress=hello@example.com
CN=localhost
```

Создаём файл `v3.ext`  
Где `DNS.1` — как поле `CN` в файле `server.csr.cnf`
```
authorityKeyIdentifier=keyid,issuer
basicConstraints=CA:FALSE
keyUsage = digitalSignature, nonRepudiation, keyEncipherment, dataEncipherment
subjectAltName = @alt_names

[alt_names]
DNS.1 = localhost
```

Генерируем доменный ключ
```shell
openssl req -new -sha256 -nodes -out server.csr -newkey rsa:2048 -keyout server.key -config server.csr.cnf
```

Генерируем доменный сертификат
```shell
openssl x509 -req -in server.csr -CA rootCA.pem -CAkey rootCA.key -CAcreateserial -out server.crt -days 500 -sha256 -extfile v3.ext
```

Помещаем сгенерированные ключ и сертификат в директорию для Докер-контейнера
```
nginx/etc/ssl/certs/server.crt
nginx/etc/ssl/private/server.key
```


## 4. Добавляем настройки для работы HTTPS в _NGINX-конфиг_

```diff
. . .

 http {
   server {
-    listen 7272;
+    listen 7272 ssl;

+    ssl_certificate /etc/ssl/certs/server.crt;
+    ssl_certificate_key /etc/ssl/private/server.key;
    
     . . .
```


## 5. Обновляем команду запуска _NGINX_ Докер-контейнера

```diff
 docker run --rm -it -p 7272:7272 \
   -v $(pwd)/nginx:/etc/nginx:ro \
+  -v $(pwd)/nginx/etc/ssl/certs:/etc/ssl/certs \
+  -v $(pwd)/nginx/etc/ssl/private:/etc/ssl/private \
   --name myapp-nginx nginx
```

## Дополнительные материалы

- [Twitch Extensions Boilerplate](https://github.com/twitchdev/extensions-samples/tree/master/boilerplate)
- [How to get HTTPS working on your local development environment in 5 minutes](https://medium.freecodecamp.org/how-to-get-https-working-on-your-local-development-environment-in-5-minutes-7af615770eec)
