---
layout: post
title: "Autostarting Homebrew Packages"
date: 2013-10-27 19:48
comments: true
author: Alex Lau
categories: homebrew protip mac-osx
---
[Homebrew](http://brew.sh) has made my life a lot easier when setting up new mac development environments. To install a new package is as easy as typing `brew install mysql` on the command line. (Other programs I commonly install with Homebrew are git, mongodb, and postgresql.)

Sometimes you want a program to start a daemon (background) process when you log in. For example, I can start mongodb's daemon with the `mongod` command, but it'd be nicer if it just started automatically. 

Fortunately Homebrew has a way to do this! Simply type `brew info mongo`. If mongod isn't set up to run automatically, the last bit of output will look like this:
    To have launchd start mongodb at login:
        ln -sfv /usr/local/opt/mongodb/*.plist ~/Library/LaunchAgents
    Then to load mongodb now:
        launchctl load ~/Library/LaunchAgents/homebrew.mxcl.mongodb.plist
    Or, if you don't want/need launchctl, you can just run:
        mongod

Note how you not only see how to start mongodb upon login, but also it shows you the name of mongo's daemon process, mongod. 