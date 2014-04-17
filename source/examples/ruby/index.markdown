---
layout: page
title: "ruby"
date: 2014-01-12 22:37
comments: false
sharing: false
footer: true
---

### Array.select method
see its [documentation](http://www.ruby-doc.org/core-2.1.1/Array.html#method-i-select)
``` ruby
[1,2,3,4,5].select { |num|  num.even?  }   #=> [2, 4]
[1,2,3,4,5].select { |num|  num > 10  }   #=> []
```

### Hash.select method
see its [documentation](http://www.ruby-doc.org/core-2.1.0/Hash.html#method-i-select)
``` ruby
h = { "a" => 100, "b" => 200, "c" => 300 }
h.select {|k,v| k > "a"}  #=> {"b" => 200, "c" => 300}
h.select {|k,v| v < 200}  #=> {"a" => 100}
h.select {|k,v| v > 400}  #=> {}
```

### Inject
see its [documentation](http://ruby-doc.org/core-2.1.0/Enumerable.html#method-i-inject)
``` ruby
(1..3).inject(100) { |sum, n| sum + n }

#=> 106, this is the same as 100 + (1 + 2 + 3)
```

### Loops
``` ruby
# these loops all execute 5 times

# while loop
i = 1
while i <= 5
  puts 'this is a while loop'
  i += 1
end

# do while loop (begin/end/while in ruby)
i = 1
begin
  puts 'this is a do while loop'
  i += 1
end while i <= 5

# for loop
for i in 1..5
  puts 'this is a for loop'
end

# looping with a times block
5.times do
  puts 'this is a times block'
end

```

### Rspec
Expectations on arguments:
``` ruby
  expect(obj).to receive(:new).with do |arg1, arg2|
    expect(arg1).to eq(1)
  end
```

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
