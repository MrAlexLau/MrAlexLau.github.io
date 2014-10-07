---
layout: post
title: "refactoring_monty_hall"
date: 2014-10-06 19:49
comments: false
categories:
---

### Lessons Learned While Refactoring
As an exercise in coding, I recently rewrote an [old ruby program](https://github.com/MrAlexLau/monty_hall/blob/original_program/montyHall.rb) into [a new one](https://github.com/MrAlexLau/monty_hall). Functionally the code for the new program does the exact same thing as the old one - both programs run simulations for the [Monty Hall Problem](http://en.wikipedia.org/wiki/Monty_Hall_problem). But the new one was written with the intention of being easier to read and to be DRY.

The original program was from when I was first learning ruby, and was definitely painful to re-read at times. Going straight down the program, here's a self-critique of some of the code.

#### Complaint #1: lack of inline booleans expressions
Here's a pattern I saw for initializing each of the command line arguments:
``` ruby
show_details_option = ARGV[1] if ARGV[1]
show_details_option = false if show_details_option != "true"
```
This is **supposed to** read a command line argument, and set it to true if the argument is the string "true". Frankly I'm not even sure why I used that first line. All I care about is comparing the input to the string "true".
My new version is simply:
``` ruby
show_details = ARGV[1] == 'true'
```
