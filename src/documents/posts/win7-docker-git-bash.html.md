```
title: Запуск докер на Windows 7, Docker Toolbox, Git Bash
layout: post
tags:
  - 'docker'
  - 'virtualbox'
  - 'windows'
date: 2018-05-21
```

Установить *Docker Toolbox* https://docs.docker.com/docker-for-windows/<br>
Если уже установлен *VirtualBox*, то в установщике *Docker Toolbox* снимаем галку *VirtualBox*


Запускаем наш контейнер
```shell
docker run --rm -it -p 8080:8080 -v $(pwd)/nginx:/etc/nginx:ro --name my-nginx-server nginx
```

В директории `nginx` должен лежать конфиг-файл `nginx.conf`

Можно передать напрямую
```shell
docker run --rm -it -p 8080:8080 -v $(pwd)/nginx/nginx.conf:/etc/nginx/nginx.conf:ro --name my-nginx-server nginx
```

Посмотреть что подключилось
```shell
docker run --rm -it -p 8080:8080 -v $(pwd)/nginx/nginx.conf:/etc/nginx/nginx.conf:ro --name my-nginx-server nginx ls -al /etc/nginx
```

## Ошибка конвертирования путей
[источник](https://github.com/docker/toolbox/issues/456)

Ошибка возниает в *Git Bash* из-за конвертирования путей

<p class="warning">C:\Program Files\Docker Toolbox\docker.exe: Error response from daemon: invalid mode: \Program Files\Git\etc\nginx;ro.
See 'C:\Program Files\Docker Toolbox\docker.exe run --help'.</p>

Добавляем переменную среды `MSYS_NO_PATHCONV=1`

```shell
MSYS_NO_PATHCONV=1 docker run --rm -it -p 8080:8080 -v $(pwd)/nginx:/etc/nginx:ro --name my-nginx-server nginx
```

## Ошибка доступа к диску
[источник](https://support.divio.com/local-development/docker/how-to-use-a-directory-outside-cusers-with-docker-toolbox-on-windowsdocker-for-windows)

Ошибка ниже возникает, если запускаемый проект находится не на диске `C:`. По умолчанию виртуальная машина *Docker Toolbox* имеет доступ только к диску `C:`

<p class="warning">C:\Program Files\Docker Toolbox\docker.exe: Error response from daemon: OCI runtime create failed: container_linux.go:348: starting container process caused "process_linux.go:402: container init caused \"rootfs_linux.go:58: mounting \\\"/e/work/my-project/ngin
x/nginx.conf\\\" to rootfs \\\"/mnt/sda1/var/lib/docker/aufs/mnt/1f1bcd6fa585643c7\\\" at \\\"/mnt/sda1/var/lib/docker/aufs/mnt/1f1bcd6fa585643c7/etc/nginx/nginx.conf\\\"
caused \\\"not a directory\\\"\"": unknown: Are you trying to mount a directory onto a file (or vice-versa)? Check if the specified host path exists and is the expected type.</p>

Останавливаем машину
```shell
docker-machine stop
```

Открываем *VirtualBox*, идем в настройки виртуальной машины *Docker Toolbox*

*Settings* → *Shared Folders* → *Add share*

- Path: `E:\`
- Folder name: `e/`

Отметить *"Авто-подключение"*

Запускаем машину
```shell
docker-machine start
```

Узнать IP-адрес запущенного nginx-сервера
```shell
docker-machine ip
```
<samp>192.168.99.100</samp>

Проверяем
```shell
curl http://192.168.99.100:8080
```

## Материалы
- [How to use a directory outside `C:\Users` with Docker Toolbox on Windows/Docker for Windows](https://support.divio.com/local-development/docker/how-to-use-a-directory-outside-cusers-with-docker-toolbox-on-windowsdocker-for-windows)
- [Running nginx in debug mode](https://docs.docker.com/samples/library/nginx/#running-nginx-in-debug-mode)
- [Use volumes](https://docs.docker.com/storage/volumes/)
- [Get Started, Part 2: Containers](https://docs.docker.com/get-started/part2/)
