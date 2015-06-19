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

### Array.compact method
Remove nil records from an array. See its [documentation](http://www.ruby-doc.org/core-2.1.2/Array.html#method-i-compact).

```ruby mark:2-4 title:"Testing codefence" url:"https://github.com/octopress/codefence" link_text:"plugin link"
[ "a", nil, "b", nil, "c", nil ].compact #=> [ "a", "b", "c" ]
```

### Array.sample method
Use array.sample to pick a random element from an array:
``` ruby
[1, 4, 2].sample #=> 2
[1, 4, 2].sample #=> 4
[1, 4, 2].sample #=> 4
```

### Array.select method
See its [documentation](http://www.ruby-doc.org/core-2.1.1/Array.html#method-i-select)
``` ruby
a = [1, 2, 3, 4, 5]
a.select { |num|  num.even? } #=> [2, 4]
a #=> [1, 2, 3, 4, 5] (the original array is preserved)
```

``` ruby
a = [1, 2, 3, 4, 5]
a.select { |num|  num > 10 } #=> []
a #=> [1, 2, 3, 4, 5] (the original array is preserved)
```

### Array.select! method
aka Array.keep_if

``` ruby
a = %w{ a b c d e f }
a.keep_if {|v| v =~ /[aeiou]/}
a #=> ["a", "e"]
```

### attr_accessor, attr_reader, attr_writer, attr_accessible, attr_protected
`attr_reader` is shorthand for a getter method:
``` ruby
# this:
class Person
  attr_reader :name
end

# is the same as:
class Person
  def name
    @name
  end
end
```

`attr_writer` is shorthand for a setter method:
``` ruby
# this:
class Person
  attr_writer :name
end

# is the same as:
class Person
  def name=(str)
    @name = str
  end
end
```

`attr_accessor` is shorthand for both attr_reader and attr_writer:
``` ruby
# this:
class Person
  attr_accessor :name
end

# is the same as:
class Person
  def name
    @name
  end

  def name=(str)
    @name = str
  end
end
```

`attr_accessible` is part of ActiveRecord, and lets you **whitelist** attributes
that you can use with mass-assignment

`attr_protected` is part of ActiveRecord, and lets you **blacklist** attributes
that you can use with mass-assignment

Note 1: do not use `attr_accessible` and `attr_protected` together.
You must use one or the other.

Note 2: Rails 4 has moved away from `attr_accessible` and `attr_protected` and
instead uses the concept of strong parameters, where you explicitly whitelist
params inside the controller.
[Example](http://stackoverflow.com/a/17371364/2339716):
``` ruby
class PeopleController < ApplicationController
  def create
    Person.create(person_params)
  end

  #...

  private

  def person_params
    params.require(:person).permit(:name, :age, pets_attributes: [:name, :category])
  end
end
```

### Catching Exceptions
Catching a generic exception (only useful for debugging):
```ruby
begin
  puts 'hai'
rescue Exception => e
  raise e.inspect # re-raise and inspect this exception
end
```

### FactoryGirl
#### Skipping model validations
From this [SO post](http://stackoverflow.com/a/9322477/2339716):
``` ruby
let(:invalid_group) {
  g = FactoryGirl.build(:group, :expiry => Time.now - 3.days)
  g.save(:validate => false)
  g
}
```

### Find/Replace using Bracket Syntax
str = 'this string is a curious string'
str['string'] = 'replacement' #=> "replacement"
str #=> "this replacement is a curious string"

### Formatting dates
See http://apidock.com/ruby/DateTime/strftime

### Hash.select method
See its [documentation](http://www.ruby-doc.org/core-2.1.0/Hash.html#method-i-select)
``` ruby
h = { "a" => 100, "b" => 200, "c" => 300 }
h.select {|k,v| k > "a"}  #=> {"b" => 200, "c" => 300}
h.select {|k,v| v < 200}  #=> {"a" => 100}
h.select {|k,v| v > 400}  #=> {}
```

### Hash.slice method
Only keep the given keys in a hash (requires [active support](http://api.rubyonrails.org/classes/Hash.html#method-i-slice))):

``` ruby
require 'active_support'
h = {a: 5, b:6, c: 7}
h.slice(:a, :c) #=> {:a=>5, :c=>7}
```

### Include vs Extend
`include` is used to make a module's methods instance methods for a class

`extend` is used to make a module's methods class methods for a class

```ruby
module Extendable
  def a_class_method
    "I'm a class method"
  end
end

module Includable
  def an_instance_method
    "I'm an instance method"
  end
end

class ClassWithExtend
  extend Extendable
end

class ClassWithInclude
  include Includable
end

ClassWithExtend.a_class_method #=> "I'm a class method"
c1 = ClassWithExtend.new
c1.a_class_method #=> NoMethodError: undefined method `a_class_method' for #<ClassWithExtend:0x007fa7f24cc740>

c2 = ClassWithInclude.new
c2.an_instance_method #=> "I'm an instance method"
ClassWithInclude.an_instance_method #=> NoMethodError: undefined method `an_instance_method' for ClassWithInclude:Class
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

### Range to Array
Convert a range to an array:
``` ruby
(1..10).to_a #=> [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
```

### Retry
(from [tutorialspoint](http://www.tutorialspoint.com/ruby/ruby_loops.htm))
If retry appears in rescue clause of begin expression, restart from the beginning of the 1begin body.
``` ruby
begin
   do_something # exception raised
rescue
   # handles error
   retry  # restart from beginning
end
```

If retry appears in the iterator, the block, or the body of the for expression, restarts the invocation of the iterator call. Arguments to the iterator is re-evaluated.
```ruby
for i in 1..5
   retry if some_condition # restart from i == 1
end
```

### Rspec

#### Expectations
Expectations on arguments:
``` ruby
expect(obj).to receive(:new).with do |arg1, arg2|
  expect(arg1).to eq(1)
end
```

#### Let vs Let!
There's an example in the [documentation](https://www.relishapp.com/rspec/rspec-core/v/2-11/docs/helper-methods/let-and-let)
Use let to define a memoized helper method. The value will be cached
across multiple calls in the same example but not across examples.

Note that let is lazy-evaluated: it is not evaluated until the first time
the method it defines is invoked. You can use let! to force the method's
invocation before each example.


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

#### Stub Chain
``` ruby
# stub_chain takes in a list of subobject names, and one method name
# returns an object with each of those subobjects nested into each other
# and mocks a method that returns nil for the last argument

# eg - obj = stub_chain(%w{ account sms messages create })
# returns an object that stubs this method call:
# obj.account.sms.messages.create
# and returns nil
def stub_chain(method_chain)
  return nil if method_chain.empty?

  next_object_name = method_chain.shift
  obj = Object.new
  obj.stub(next_object_name.to_sym).and_return(stub_chain(method_chain))
  obj
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
