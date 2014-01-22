---
layout: page
title: "ruby"
date: 2014-01-12 22:37
comments: false 
sharing: false 
footer: true
---

### Tap method 
from [See John Code](http://www.seejohncode.com/2012/01/02/ruby-tap-that/)
``` ruby
# TRADITIONAL
object = SomeClass.new
object.key = 'value'
object
 
# TAPPED
object = SomeClass.new.tap do |obj|
  obj.key = 'value'
end
 
# CONDENSED
obj = SomeClass.new.tap { |obj| obj.key = 'value' }
``` 

