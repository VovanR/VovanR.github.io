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
А так же нужен ID и URL задачи

<a class="bookmarklet" href="javascript:!function({JIRA:JIRA,AJS:AJS,location:location}){const id=JIRA.Issue.getIssueKey(),title=id+': '+document.getElementById('summary-val').innerText,url=location.origin+'/browse/'+id,style='font-family: monospace; box-sizing: border-box; width: 100%; resize: none;',flag=AJS.flag({body:`<div><textarea style='${style}' rows='2'>${title}\n${url}</textarea><input value='${url}' style='${style}'/><input value='${id}' style='${style}'/></div>`});function copy({target:target}){target.select(),document.execCommand('copy')}flag.querySelector('textarea').addEventListener('click',copy),flag.querySelectorAll('input').forEach(el=>el.addEventListener('click',copy))}(window);void(0);" title="JIRA Issue Info">JI</a>

Код букмарклета:
```javascript
javascript:!function({JIRA:JIRA,AJS:AJS,location:location}){const id=JIRA.Issue.getIssueKey(),title=id+": "+document.getElementById("summary-val").innerText,url=location.origin+"/browse/"+id,style="font-family: monospace; box-sizing: border-box; width: 100%; resize: none;",flag=AJS.flag({body:`<div><textarea style="${style}" rows="2">${title}\n${url}</textarea><input value="${url}" style="${style}"/><input value="${id}" style="${style}"/></div>`});function copy({target:target}){target.select(),document.execCommand("copy")}flag.querySelector("textarea").addEventListener("click",copy),flag.querySelectorAll("input").forEach(el=>el.addEventListener("click",copy))}(window);void(0);
```

Исходный код:
```javascript
(function({ JIRA, AJS, location }) {
  const id = JIRA.Issue.getIssueKey();
  const name = document.getElementById("summary-val").innerText;

  const title = id + ": " + name;
  const url = location.origin + "/browse/" + id;

  const style =
    "font-family: monospace; box-sizing: border-box; width: 100%; resize: none;";

  const flag = AJS.flag({
    body: `<div><textarea style="${style}" rows="2">${title}
${url}</textarea><input value="${url}" style="${style}"/><input value="${id}" style="${style}"/></div>`
  });

  flag.querySelector("textarea").addEventListener("click", copy);
  flag
    .querySelectorAll("input")
    .forEach(el => el.addEventListener("click", copy));

  function copy({ target }) {
    target.select();
    document.execCommand("copy");
  }
})(window);
```


## Материалы

- [Компонент `Flag` для показа сообщений в JIRA](https://docs.atlassian.com/aui/7.9.5/docs/flag.html)
- [Исходный код букмарклета](https://github.com/VovanR/working-bookmarklets)
