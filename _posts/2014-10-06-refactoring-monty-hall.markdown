---
layout: post
title: "Revisiting an Old Ruby Program"
date: 2014-10-06 19:49
comments: true
categories:
---
As an exercise in coding, I recently rewrote an [old ruby program](https://github.com/MrAlexLau/monty_hall/blob/original_program/montyHall.rb) into [a new one](https://github.com/MrAlexLau/monty_hall). Functionally the code for the new program does the exact same thing as the old one - both programs run simulations for the [Monty Hall Problem](http://en.wikipedia.org/wiki/Monty_Hall_problem). But the new one was written with the intention of being easier to read and DRY'er.

The original program was from when I was first learning ruby, and was definitely painful to read at times. Going straight down the program, here's a self-critique of some of the code.

#### Complaint #1: lack of inline boolean expressions
This is *supposed to* read a command line argument, and set it to a boolean `true` if the argument is the string "true":
``` ruby
show_details_option = false if show_details_option != "true"
```

The danger in this is that `show_details_options` would not be set at all if the `if` condition isn't met. It doesn't in this case since it was already initialized on the line before, but there's no use in taking this risk if it's perfectly avoidable.

My new version ditches the `if` statement altogether:
``` ruby
show_details = ARGV[1] == 'true'
```

#### Complaint #2: using `and` and `or` instead of `&&` and `||`
`and` and `or` are meant for flow control, not to be used as boolean operators.

What can I say? I was young, I was naive, I hadn't read [this blog post by Avdi Grimm](http://devblog.avdi.org/2010/08/02/using-and-and-or-in-ruby/).

#### Complaint #3: not using built in array methods
##### Example 1
Take this snippet:
``` ruby
possible_open_doors = []
for i in 1..total_number_of_doors
  if i != contestants_guess and i != number_of_door_with_car
    possible_open_doors << i
  end
end
```
The purpose of this was to build a new array from 1 to `total_number_of_doors` while excluding  specific values, namely `contestants_guess` and `possible_open_doors`.

My approach was to build a brand new array, while checking to make sure the new values being appended to the new array were neither `contestants_guess` nor `number_of_door_with_car`. That works, but the same effect can be achieved much more concisely with some built in array functions in ruby. The refactored result is much shorter:
``` ruby
revealable_doors = (1..total_number_of_doors).to_a - [number_of_door_with_car, contestants_guess]
```

Note that you can convert a range into an array in ruby (eg - `(1..4).to_a` becomes `[1, 2, 3, 4]`). The array difference operator (aka array subtraction) allows us to easily exclude particular values. If I wanted to exclude 1 and 4 from the array of 4 I can say `[1, 2, 3, 4] - [1, 4]` - which seems trivial with hardcoded values but becomes handy with variable values which need to be excluded.

##### Example 2
Here I'm selecting a random value from an array:
``` ruby
possible_open_doors[rand(0..possible_open_doors.length - 1)]
```

When [Array's "sample" method](http://ruby-doc.org/core-2.1.3/Array.html#method-i-sample) already does precisely the same thing:
``` ruby
possible_open_doors.sample
```

#### Complaint #4: methods that took way too many lines of code
My [original method](https://github.com/MrAlexLau/monty_hall/blob/original_program/montyHall.rb#L41-L129) used to run a simulation was 86 lines of code long. Just *a few* more than Sandi Metz's [five lines per method rule](http://rubyrogues.com/087-rr-book-clubpractical-object-oriented-design-in-ruby-with-sandi-metz/). The body of the revised version is a little closer at 9 lines (excluding whitespace):
``` ruby
def run
  @all_doors = set_up_doors

  contestants_initial_guess = contestants_first_guess
  revealed_door_number = reveal_door(contestants_initial_guess, @door_with_prize)
  final_guess = contestants_second_guess(contestants_initial_guess, revealed_door_number)

  prize_found = @all_doors[final_guess - 1][:value] == :car
  contestant_switched = (contestants_initial_guess != final_guess)
  switching_wouldve_helped = (@door_with_prize != contestants_initial_guess)

  display_game_results(final_guess, @door_with_prize, prize_found, switching_wouldve_helped)
  set_result(prize_found, contestant_switched)
end
```

Not only is this less lines of code, but also reads a lot better... going down the line of methods being called you see "set_up_doors", "contestants_first_guess", "reveal_door", etc. and can see exactly how the flow of the simulation works.

#### Conclusion
I was hesitant to even look at my original program because I knew that there would be lots of cringe-worthy moments to be had. But it's satisfying to be able to quickly identify elegant solutions to problems that used to give me a hassle - I'd recommend it as an exercise to anyone.
