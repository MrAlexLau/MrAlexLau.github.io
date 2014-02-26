---
layout: page
title: "vim"
date: 2014-01-12 17:56
comments: false 
sharing: false 
footer: true
---

### Find and Replace 
Find and replace globally in a file:
`:s/foo/bar/g` 
Find and replace between lines 8 and 10:
`:8,10 s/foo/bar/g` 
Add c to the end of the command to be prompted for a confirmation at each find/replace: 
`:8,10 s/foo/bar/gc` 

### Vimrc settings file
" comments lead off with a double quote
