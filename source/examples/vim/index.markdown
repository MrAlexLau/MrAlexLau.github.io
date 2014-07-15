---
layout: page
title: "vim"
date: 2014-01-12 17:56
comments: false
sharing: false
footer: true
---

### Change
Command: `c`

Advanced example: From within a single quote, eg - *'in the middle of this'*

`c` + `i` +`'`

Which stands for Change, Inside, Single Quote

### Find and Replace
Find and replace globally in a file:
```
:s/foo/bar/g
```
Find and replace between lines 8 and 10:
```
:8,10 s/foo/bar/g
```
Add c to the end of the command to be prompted for a confirmation at each find/replace:
```
:8,10 s/foo/bar/gc
```

### Repeat the Last Command
Command: `.`

### Select the Entire Line
Command: `V` (note that it's capitalized)

### Til (aka Until)
#### Exclusive Til
Command: `t`

Advanced example: From the current position, visually select until the comma

`v` + `t` +`,`

This selection *excludes* the comma itself.

### Til (aka Until)
#### Inclusive Til
Command: `f`

Advanced example: From the current position, visually select until the comma

`v` + `f` +`,`

This selection *includes* the comma itself.


### Visual Selection
Command: `v`

Advanced example: From within a single quote, eg - *'in the middle of this'*

`v` + `i` +`'`

Which stands for Visually Select, Inside, Single Quote

### Vimrc settings file
`" comments lead off with a double quote`
