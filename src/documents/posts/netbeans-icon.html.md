```
title: Иконка NetBeans
layout: post
tags:
  - 'Linux'
  - 'NetBeans'
date: 2011-10-08
```

Источник [Sunny Talks Tech: High-Res Dock Icons from Netbeans](http://sunnytalkstech.blogspot.com/2010/01/high-res-dock-icons-from-netbeans.html)

![](/images/netbeans-icon/netbeans-icon__preview.jpg)

По-умолчанию NetBeans устанавливается с иконкой небольшого размера (32×32), что выглядит убого. Заменим ее на иконку большого разрешения (128×128).

```
cd ~/netbeans-7.0/nb/

ls
build_info docs netbeans.png update_tracking
config modules shortcuts_mac.pdf var
core netbeans.icns shortcuts.pdf VERSION.txt

sudo yum install libicns-utils

icns2png -x -s 128 -d 32 netbeans.icns

ls
build_info modules shortcuts_mac.pdf VERSION.txt
config netbeans_128x128x32.png shortcuts.pdf
core netbeans.icns update_tracking
docs netbeans.png var

mv netbeans.png netbeans.png.bak
mv netbeans_128x128x32.png netbeans.png
```

![](/images/netbeans-icon/netbeans.png)
