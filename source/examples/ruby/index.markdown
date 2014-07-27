---
layout: page
title: "ruby"
date: 2014-01-12 22:37
comments: false
sharing: false
footer: true
---

### Using !!
Use !! to coerce nil into false:
``` ruby
false || nil => nil
!!(false || nil) => false
```

### Array.select method
See its [documentation](http://www.ruby-doc.org/core-2.1.1/Array.html#method-i-select)
``` ruby
a = [1, 2, 3, 4, 5]
a.select { |num|  num.even?  } #=> [2, 4]
a #=> [1, 2, 3, 4, 5] (the original array is preserved)
```

``` ruby
a = [1, 2, 3, 4, 5]
a.select { |num|  num > 10  } #=> []
a #=> [1, 2, 3, 4, 5] (the original array is preserved)
```

### Array.select! method
aka Array.keep_if

``` ruby
a = %w{ a b c d e f }
a.keep_if {|v| v =~ /[aeiou]/}
a #=> ["a", "e"]
```

### Catching Exceptions
Catching a generic exception (only useful for debugging):
```ruby
begin
  puts 'hai'
rescue Exception => e
  raise e.inspect # inspect this exception and catch it instead
end
```

### Hash.select method
See its [documentation](http://www.ruby-doc.org/core-2.1.0/Hash.html#method-i-select)
``` ruby
h = { "a" => 100, "b" => 200, "c" => 300 }
h.select {|k,v| k > "a"}  #=> {"b" => 200, "c" => 300}
h.select {|k,v| v < 200}  #=> {"a" => 100}
h.select {|k,v| v > 400}  #=> {}
```

### Inject
See its [documentation](http://ruby-doc.org/core-2.1.0/Enumerable.html#method-i-inject)
``` ruby
(1..3).inject(100) { |sum, n| sum + n }

#=> 106, this is the same as 100 + (1 + 2 + 3)
```

### Instance Methods
How to get the instance methods of an object:
``` ruby
a = Array.new
a.methods
```

### Loading Dev DB Schema into Test
```
rake db:test:load
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

### Random Numbers
Generating random numbers:
``` ruby
rand # a random percentage between zero and one
rand(5) # a random integer between zero and four (note that five is excluded)
rand(1..3) # a random integer between one and three


require 'securerandom'
SecureRandom.hex[0..5] # outputs a random hex string of length 5
```

### Rspec
Expectations on arguments:
``` ruby
expect(obj).to receive(:new).with do |arg1, arg2|
  expect(arg1).to eq(1)
end
```

#### Setting focus options
``` ruby
  RSpec.configure do |config|
    # ...

    # only run specs where the focus option is set
    # (or run all of them if no focus option)

    config.filter_run focus: true
    config.run_all_when_everything_filtered = true

    # ...
  end
```

#### Rspec with Capybara
Use `save_and_open_page` to help debug integration tests:
``` ruby
visit '/events/new'
save_and_open_page
```

### Stacktrace
Finding the current stacktrace:
``` ruby
Thread.current.backtrace.join("\n")
```

### Tap method
From [See John Code](http://www.seejohncode.com/2012/01/02/ruby-tap-that/)
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
