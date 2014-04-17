---
layout: page
title: "command-line"
date: 2014-04-13 20:43
comments: false 
sharing: false 
footer: true
---

### Tailing
Only show the first 10 lines when you find POST
```
tail -f log/development.log | grep -A 10 "POST"
```
