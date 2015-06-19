---
layout: post
title: "D3 Lessons Learned: Hover Lock Button"
date: 2015-06-19 13:23
comments: true
categories:
---

As an exercise in sharpening my d3 skills, I set out to create a button that mimics the [kudos widget](http://kudosplease.com/) seen on various blogs.

The idea is to only take action once a user has hovered over the icon for a certain period of time. It's a nice, animated alternative to simply clicking a 'Like' button. Here's how my version turned out:
{% d3block MrAlexLau/raw/1189ed49f998421f29af,200px,150px %}

You can see the full source code and example [here](http://bl.ocks.org/MrAlexLau/1189ed49f998421f29af).

Though this example may seem trivial, there are a couple of important principles it demonstrates:

### Svg Element Ordering
The z-index css property is ineffective for svg's. Instead, layers are rendered in the order they are drawn - elements drawn first appear _behind_ elements drawn afterward.

So for my example, drawing the circles goes as follows:

``` javascript
  outerCircle = svg.append('circle')
      .attr('class', 'locked-on-circle')
      .attr('cy', options.outerRadius)
      .attr('cx', options.outerRadius)
      .attr('r', options.outerRadius)
      .style('fill', options.defaultColor)

  whitespaceCircle = svg.append('circle')
      .attr('class', 'locked-on-circle')
      .attr('cy', options.outerRadius)
      .attr('cx', options.outerRadius)
      .attr('r', options.outerRadius - 5)
      .style('fill', '#FFFFFF');

  loadingCircle = svg.append('circle')
    .attr('r', options.startingRadius)
    .attr('cy', options.outerRadius)
    .attr('cx', options.outerRadius)
    .attr('fill', options.defaultColor);
```

Note that the outer ring is actually 2 circles: a larger one drawn first with a background color, and a slightly smaller white one drawn inside.

### Animation Easing
You might have noticed that when you hover over the circles, the middle circle grows a little bit smaller before it gets bigger. The rate and size of this animation is controlled by its [easing function](https://github.com/mbostock/d3/wiki/Transitions#ease).

In this example in particular, I'm using `ease('back')`. You can use different easing functions to make animations occur at different rates over time. For an excellent interactive demo of easing functions, check out this [bl.ock](http://bl.ocks.org/hunzy/9929724).

### Cancelling D3 Animations
If you begin hovering over the circle, but pull the cursor away from it the icon transitions back to its original size and color. Before working on this demo I wasn't sure if I would have to call something like `transition().cancel()`, but it turns out that you can simply start a new animation to cancel an existing one.

So in my example, I'm using this animation to grow the middle circle when a user hovers over it:
``` javascript
    loadingCircle
      .transition()
      .attr('fill', options.lockedColor)
      .attr('r', options.outerRadius - 10)
      .ease('back')
      .duration(1500)
```

And to cancel my animation on the mouseleave event, I simply transition back to the original size and color:
``` javascript
  loadingCircle
    .transition()
    .attr('r', 15)
    .attr('fill', options.defaultColor);
```

### Animation Callbacks
The last trick I picked up was that animations have a callback which is triggered after they complete. Look at the `end` event here:
``` javascript
  loadingCircle
    .transition()
    .attr('fill', options.lockedColor)
    .attr('r', options.outerRadius - 10)
    .ease('back')
    .duration(1500)
    .each('end', function () {
      isLocked = true;

      outerCircle
        .style('fill', options.lockedColor)

      $('.notification').fadeIn(500);
    });
```

The `end` event's callback only gets executed if the animation completes. This plays out nicely in our example since we only want to display a "done" label if the user hovers for a certain amount of time.