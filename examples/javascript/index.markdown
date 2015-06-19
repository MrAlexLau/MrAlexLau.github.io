---
layout: page
title: "javascript"
date: 2014-01-12 17:56
comments: false
sharing: false
footer: true
---

## Jquery Add
[[Documentation](http://api.jquery.com/add/)] Combine multiple selectors together into one big selection:
```javascript
$('div').add('p').css('background-color', 'green')
```

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


## Mocking the userAgent String
(useful for testing)
From [this StackOverflow answer](http://stackoverflow.com/a/1307088):
``` javascript
navigator.__defineGetter__('userAgent', function(){
    return 'foo' // customized user agent
});
```
