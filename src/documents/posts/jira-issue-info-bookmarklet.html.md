```
title: Букмарклет тултипа информации по задаче из JIRA
layout: post
tags:
    - 'bookmarklet'
    - 'development'
    - 'javascript'
date: 2018-10-31
```

![](/images/jira-issue-info-bookmarklet/jira-issue-info-bookmarklet__preview.png)

Мне надо составлять строку формата `"<issue_id>: <issue_name>"`, например есть задача `FOO-5` с названием "Fix number input"
Строка должна получиться следующего вида: "FOO-5: Fix number input"
А так же нужен URL задачи

<a class="bookmarklet" href="javascript:!function(){var e=JIRA.Issue.getIssueKey();AJS.flag({title:e+': '+document.getElementById('summary-val').innerText,body:window.location.origin+'/browse/'+e})}();void(0);" title="JIRA Issue Info">JI</a>

Код букмарклета:
```javascript
javascript:!function(){var e=JIRA.Issue.getIssueKey();AJS.flag({title:e+': '+document.getElementById('summary-val').innerText,body:window.location.origin+'/browse/'+e})}();void(0);
```

Исходный код:
```javascript
(function(){
    var id = JIRA.Issue.getIssueKey();
    AJS.flag({
        title: id + ': ' + document.getElementById('summary-val').innerText,
        body: window.location.origin + '/browse/' + id
    });
})();
```


## Материалы

- [Компонент `Flag` для показа сообщений в JIRA](https://docs.atlassian.com/aui/7.9.5/docs/flag.html)
