```
title: Автоматический деплой GitHub Pages через Travis CI
layout: post
tags:
  - 'deploy'
  - 'gh-pages'
  - 'travis'
date: 2018-05-15
```

Задача: есть репозиторий организации на гитхабе ([inside-demo/webpack-global-vendor-demo](https://github.com/inside-demo/webpack-global-vendor-demo)).<br>
Надо после изменения ветки `master` собирать демо на [GitHub Pages](https://pages.github.com/) ([inside-demo.github.io/webpack-global-vendor-demo](https://inside-demo.github.io/webpack-global-vendor-demo/)).

Этапы деплоя:
1. Установить зависимости: `npm install`
1. Собрать проект: `npm run build`
1. Добавить директорию `build`
1. Закоммитить в ветку `gh-pages`

## Создаем GitHub-токен для деплоя из Travis CI
[источник](https://help.github.com/articles/creating-a-personal-access-token-for-the-command-line/)

Переходим на [https://github.com/settings/tokens](https://github.com/settings/tokens)<br>
Жмем *"Generate new token"*<br>
Называем токен `inside-demo/webpack-global-vendor-demo`<br>
Отмечаем только *"public_repo"*<br>
Копируем токен

## Подключаем Travis CI
Переходим на страницу [https://travis-ci.org/profile/inside-demo](https://travis-ci.org/profile/inside-demo)<br>
Жмем *"Sync account"*<br>
Когда синхронизация закончится, появится наш репозиторий<br>
Переходим в [https://travis-ci.org/inside-demo/webpack-global-vendor-demo](https://travis-ci.org/inside-demo/webpack-global-vendor-demo)<br>
Включаем проект *"Activate repository"*<br>
Перезагружаем страницу

### Добавляем GitHub-токен в травис
[источник](https://docs.travis-ci.com/user/environment-variables#Defining-Variables-in-Repository-Settings)

Жмем *"More options"* → *"Settings"*<br>
Создаем в *"Environment Variables"*

- Name: `GITHUB_TOKEN`
- Value: `Вставляем сгенерированный GitHub-токен`

Жмем *"Add"*

## Добавляем настройки деплоя в `.travis.yml`
[источник](https://docs.travis-ci.com/user/deployment/pages/)

Создаем в проекте файл `.travis.yml`<br>
Добавляем секцию `deploy`<br>
Добавляем запуск сборки перед деплоем в секцию `before_deploy`<br>
Так как билд добавлен в `.gitignore`, необходимо переписать файл `.gitignore`

```yaml
language: node_js
node_js: node

before_deploy:
  - npm run build
  - echo -e "node_modules\npackage-lock.json" > .gitignore

deploy:
  provider: pages
  skip-cleanup: true
  github-token: $GITHUB_TOKEN
  keep-history: true
  on:
    branch: master
```

Если в проекте есть тесты, которые запускаются на разных версиях *NodeJS*, то надо обновить правило `on` в секции `deploy`, чтобы сборка собиралась один раз

```yaml
language: node_js
node_js:
  - 10
  - 8

before_deploy:
  - npm run build
  - echo -e "node_modules\npackage-lock.json" > .gitignore

deploy:
  provider: pages
  skip-cleanup: true
  github-token: $GITHUB_TOKEN
  keep-history: true
  on:
    branch: master
    node: 10
```

## Материалы
- [GitHub Pages Deployment](https://docs.travis-ci.com/user/deployment/pages/)
- [Customizing the Build. The Build Lifecycle](https://docs.travis-ci.com/user/customizing-the-build#The-Build-Lifecycle)

## Примеры
- https://github.com/geops/ole2/blob/master/.travis.yml
- https://github.com/inside-demo/webpack-global-vendor-demo/blob/master/.travis.yml
- https://github.com/VovanR/VovanR.github.io/blob/02bba9784ecc73d5454e8be1df8947119858134a/.travis.yml
