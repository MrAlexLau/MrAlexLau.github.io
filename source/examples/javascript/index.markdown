---
layout: page
title: "javascript"
date: 2014-01-12 17:56
comments: false 
sharing: false 
footer: true
---

## Counting Keys in an Object
``` javascript
elms = { a: 1, b: 2, c: 3 }
Object.keys(elms).length
```

## Optional Params
From [this StackOverflow answer](http://stackoverflow.com/a/148918):
``` javascript
optionalArg = (typeof optionalArg === "undefined") ? "defaultValue" : optionalArg;
```
