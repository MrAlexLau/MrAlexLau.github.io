---
layout: page
title: "vim"
date: 2014-01-12 17:56
comments: false
sharing: false
footer: true
---

### Centering the Current Line
`zz` - vertically centers the current line on the screen

### Change
Command: `c`

#### Examples:

`ce` - delete the current word and enter insertion mode
`c$` - delete until the end of the line and enter insertion mode

Advanced example: From within a single quote, eg - *'in the middle of this'*

`ci'`

Which stands for Change, Inside, Single Quote

### Delete Shortcuts
From vimtutor:

`daw` - "delete at word" - deletes the current word regardless of the cursor position

`dw` - delete until the start of the next word

`de` - delete until the end of the current word

`d$` - delete until the end of the current line

### File Status
`Ctrl + g` - See the current file and cursor position

### Find and Replace
Find and replace on all instances on the current line:
`
:s/foo/bar/g
`
### Find and Replace
Find and replace globally in a file:

`
:%s/foo/bar/g
`

Find and replace between lines 8 and 10:

`
:8,10 s/foo/bar/g
`

Add c to the end of the command to be prompted for a confirmation at each find/replace:

`
:8,10 s/foo/bar/gc
`

### Highlight Matching Parentheses
While the cursor is ), ], }, press `%`

### Jump to the Beginning/End of the File
Jump to the beginning of the file: `gg`

Jump to the beginning of the file: `G`

### Jump to the Beginning of the Line
Command: `0`

### Registers
Use registers to store multiple values that you can copy and paste. From [this excellent stackoverflow answer](http://stackoverflow.com/a/1498026/2339716):


> Registers in Vim let you run actions or commands on text stored within them. To access a register, you type "a before a command, where a is the name of a register. If you want to copy the current line into register k, you can type

`
"kyy
`

> Or you can append to a register by using a capital letter

`
"Kyy
`


> You can then move through the document and paste it elsewhere using

`
"kp
`

> To access all currently defined registers type

`
:reg
`

### The Open Command
Command: `O` - insert a new line above the current line where the cursor is

Command: `o` - insert a new line below the current line where the cursor is

### The Overwrite Command
Command: `R` - enter overwrite mode

### Repeat the Last Command
Command: `.`

### Running External Commands
Command: `!<external command>`

Example: `!ls` - executes the file list command in the current directory

### Searching
Search: `/`

Search for Previous Match: `?`

Find next match: `n`

Find next match, searching backwards: `N`

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

### Write and Quit
Command: `x`

Shorthand for write and quit together (normally `wq`)

### Vimrc settings file
`" comments lead off with a double quote`
