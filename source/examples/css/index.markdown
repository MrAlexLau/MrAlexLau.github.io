---
layout: page
title: "css / sass"
date: 2014-05-06 19:16
comments: false
sharing: false
footer: true
---

### All Except Last Child Selector
``` css
:not(:last-child) {
  /* styles */
}
```

### Extend in Sass
Given the example from the [sass documentation](http://sass-lang.com/documentation/file.SASS_REFERENCE.html#extend), given this sass:
``` css
.error {
  border: 1px #f00;
  background-color: #fdd;
}
.seriousError {
  @extend .error;
  border-width: 3px;
}
```

its compiled css is:
``` css
.error, .seriousError {
  border: 1px #f00;
  background-color: #fdd;
}

.seriousError {
  border-width: 3px;
}
```

Note that the styles are comma separated, decreasing the amount of duplicate code (rather than re-rendering each style inside the `.seriousError` selector). [This can lead to some unintended behavior](http://css-tricks.com/the-extend-concept/):
 - If you extend another selector, selectors nested under the original are also extended
 - You cannot extend a selector which is nested, eg - `@extend div span` will not work

As a rule of thumb, you can use `@extend` instead of including a `@include a_mixin` when there are no arguments to be passed. Use caution when the selector you're extending from has nested selectors though.

### Color Functions in Sass
[This link](http://sass-lang.com/documentation/Sass/Script/Functions.html) has a list of all of them. Notably:

**lighten($color, $amount)** - Makes a color lighter

**darken($color, $amount)** - Makes a color darker

**grayscale($color)** - Converts a color to grayscale

**complement($color)** - Returns the complement of a color

** invert($color)** -  Returns the inverse of a color

### Each loops in Sass
From the [sass documentation](http://sass-lang.com/documentation/file.SASS_REFERENCE.html#extend):
```
@each $animal in puma, sea-slug, egret, salamander {
  .#{$animal}-icon {
    background-image: url('/images/#{$animal}.png');
  }
}
```

### For loops in Sass
From the [sass documentation](http://sass-lang.com/documentation/file.SASS_REFERENCE.html#extend):
```
@for $i from 1 through 3 {
  .item-#{$i} { width: 2em * $i; }
}
```

### Mixins in Sass
The [sass documentation](http://sass-lang.com/documentation/file.SASS_REFERENCE.html#extend) has a good example that demonstrates mixins:
``` css
@mixin sexy-border($color, $width: 1in) {
  border: {
    color: $color;
    width: $width;
    style: dashed;
  }
}
p { @include sexy-border(blue); }
h1 { @include sexy-border(blue, 2in); }
```
is compiled to:
``` css
p {
  border-color: blue;
  border-width: 1in;
  border-style: dashed;
}

h1 {
  border-color: blue;
  border-width: 2in;
  border-style: dashed;
}
```

Mixins also support keyword arguments, so you can explicitly name the parameters in the `@include` statement and include them out of order. Here's an example that works with the `sexy-border` mixin above:
``` css
h1 { @include sexy-border($width: 1in, $color: blue); }
```

### Placeholder Selectors in Sass
Placeholder selectors can only be used with the `@extend` directive. If they're not referenced at all, they render no output in the compiled css.
``` css
%error {
  border: 1px #f00;
  background-color: #fdd;
}
%not-used {
  // these styles aren't rendered anywhere
  // since %not-used is not extended anywhere in this file
  color: red;
  font-weight: bold;
}
.seriousError {
  @extend %error;
  border-width: 3px;
}
```
is compiled to:
``` css
.seriousError {
  border: 1px #f00;
  background-color: #fdd;
}

.seriousError {
  border-width: 3px;
}
```

### While loop in Sass
From the [sass documentation](http://sass-lang.com/documentation/file.SASS_REFERENCE.html#extend):
``` css
$i: 6;
@while $i > 0 {
  .item-#{$i} { width: 2em * $i; }
  $i: $i - 2;
}
```

### Watching a Sass File
Automatically recompiles scss into css:
``` bash
sass --watch style.scss:style.css
```
