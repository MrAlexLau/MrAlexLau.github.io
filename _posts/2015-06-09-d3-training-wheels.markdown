---
layout: post
title: "D3 Training Wheels"
date: 2015-06-09 16:28
comments: true
categories: d3
---

I've been working with d3 quite a bit lately. It's a subject I've been interested in for a while, but never had a passion project to really use it with until I had a project at work that required it. Putting this post together as a reference to some resources I wish I had known about when I first started.

## [D3 Gallery](https://github.com/mbostock/d3/wiki/Gallery)
Mike Bostock is the creator of d3 - and is basically a visualization god. This page on the d3 wiki is a collection of charts and graphs. It's a great starting place to see exactly what's possible, and most of the examples provide source code.

## [Dashing D3](https://www.dashingd3js.com/)
This tutorial took me from zero to sixty with d3. It does an amazing job at organizing sections into consumable portions. Not only is it the best walkthrough of d3 I've come across to date, it's also one of the best tutorials I've ever read, period.

## [Bl.ocks.org](http://bl.ocks.org/)
Another creation from Mike Bostock. I discovered this site by seeing it frequently referenced on StackOverflow. What you do is create a [github gist](https://gist.github.com/), apply the same path to bl.ocks.org, and the bl.ocks website will automagically display your visualization.

For example, Mike has created a gist at https://gist.github.com/mbostock/1353700. Since this gist has a file named `index.html`, bl.ocks is smart enough to display a preview of the visualization at http://bl.ocks.org/mbostock/1353700. (Note that `/mbostock/1353700/` is the same in both urls.)

I prefer this to jsfiddle/codepen when dealing with d3 examples since it's easier to read longer bits of code in the longform that bl.ocks displays them in. And because each example is a github gist under the covers, forking and modifying examples in my local dev environment is trivial.
