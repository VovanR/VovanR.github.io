```
title: Нэйминг (именование) переменных
layout: post
tags:
    - 'development'
date: 2018-09-10
status: draft
```

Naming conventions

## Булево

Переменная или свойство:
- `disabled`
- `enabled`
- `visible`
- `loading`


## Функция проверка условия

Функция или метод:
- `checkCustomSignUpFields`

Возвращает булево значение.


## Функция проверки состояния (предикаты)

Функция или метод:
- `isOnline`
- `isDisabled`
- `isVisible`
- `isLoading`

Возвращает булево значение.


## Вхождение

- `hasItem`

Возвращает булево значение.


## Валидация

Метод:
- `validateString`
- `validateEmail`

Функция:
- `stringValidator`
- `emailValidator`

Пример
```js
const errors = validateEmail(email)
if (errors.length > 0) {
  // . . .
}
```


## Функция сравнения

Метод:
- `compareDate(a, b)`
- `compareString(a, b)`
- `compareBoolean(a, b)`

Функция:
- `dateComparator(a, b)`
- `stringComparator(a, b)`
- `booleanComparator(a, b)`

Возвращаемое значение:
- `a === b` — `0`
- `a < b` — `-1`
- `a > b` — `1`


## Функция преобразования

Подготовка данных для отправки:
- `prepareData`

Преобразование полученных данных:
- `processFetchData`


## Функция вычислений

- `calculateDays`


## Константа

```js
BUTTON_VARIANT = {
  DANGER: 'danger',
  WARNING: 'warning',
}
```

```js
DEFAULT_BUTTON_VARIANT = BUTTON_VARIANT.WARNING
```


## Метод

- `getName`
- `setName`


## Обработчик события

`HIA` (Handle Item Action)

- `handleClick`
- `handleListItemClick`


## Класс

Базовый класс с префиксом `Base`:
- `BaseValidator`

- `EmailValidator`


## Переменная


## Количество

- `itemsCount`
- `errorsCount`


## Хэш-карта (HASH-map)

- [Мой вопрос в Твитере](https://twitter.com/VovanR/status/1362421415253803010)


- `valuesByKeys`
- `callbacksByEvents`
- `filtersByGroups`


## Каррирование

- `curriedSum`
- `curriedProcessInputData`


## Мемоизация

- `memoizedCalculateDate`


## Debounce

- `debouncedFetchData`


## Throttle

- `throttledSaveData`


## Материалы

- [90 рекомендаций по стилю написания программ на C++](https://habr.com/post/172091/)
- [Как называть переменные](https://ymatuhin.ru/front-end/how-to-name-variables/)
- [Именование в программировании](https://ru.hexlet.io/blog/posts/naming-in-programming)
- [Ошибки именования в программировании I](https://ru.hexlet.io/blog/posts/naming-errors-1)
