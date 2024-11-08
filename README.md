# Ruby Better Input

Whenever I tried to make an application that would be based on a command line interface (CLI) I found myself having to do some of the things included in this gem, especially when it came to "verbose", when I wanted to display a question to the user or even check if he entered the input I expected. Tired of always coding the same function I decided to make this gem.

## Installation

To install this gem just use:

```shell
gem install better_input
```


## Usage
Normally to handle user input in ruby ​you would do something like this:
```ruby
puts "What is your age?"
age = gets.chomp
```
and then if you wanted a "verbose" input you would have to do another PUTS. And it gets even worse if you want to check if the input is of the expected type:
```ruby
puts "What is your age?"

age = nil
loop do
  input = gets.chomp
  if input.match?(/^\d+$/)
    age = input.to_i
    break
  else
    puts "Please enter a valid integer for your age."
  end
end

puts "User response: #{age}"
```
Although it requires other approaches like the one I did in the gem. here are some examples of how it works with inputs in ruby ​​using the gem:
```ruby
require 'better_input'

age = Bi.input("Digite um número: ", type: "int", show_response: true)
#In a single line we asked the question and stored it in a variable, we made sure it was the type we wanted and we even made the answer appear!
```
```ruby
#Another examples:

noquestion = Bi.input()
retype = Bi.input(show_response: true)
onlyfloat = Bi.input(type: float)

name = Bi.input("What is your name?")
puts "Your name is #{name}"
```
Anyway, use your creativity, now receiving constant user input for CLI has become less laborious!

## Function before becoming a gem
This was more or less the base that I ended up making, I made some small improvements that you can find in the files present in this repository before turning it into a gem.
```ruby
def input(question = nil, show_response: false, type: "string")
  unless question.nil?
    puts question
  end

  loop do
    var = gets.chomp

    if type == "int"
      begin
        var = Integer(var)
      rescue ArgumentError
        puts "Err: Please, type a (integer) number."
        next
      end
    elsif type == "float"
      begin
        var = Float(var)
      rescue ArgumentError
        puts "Err: Please, type a (float) number."
        next
      end
    elsif type == "bool"
      if var.downcase == "true"
        var = true
      elsif var.downcase == "false"
        var = false
      else
        puts "Err: Please, type 'true' or 'false'."
        next
      end
    else
      var = var
    end

    if show_response
      puts "User Response: #{var}"
    end
    return var
  end
end
```
