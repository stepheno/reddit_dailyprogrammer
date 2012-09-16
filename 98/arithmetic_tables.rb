#!/bin/ruby
#Write a program that reads two arguments from the command line:
#a symbol, +, -, *, or /
#a natural number n (≥ 0)
#And uses them to output a nice table for the operation from 0 to n, like this (for "+ 4"):
#+  |  0  1  2  3  4
#-------------------
#0  |  0  1  2  3  4 
#1  |  1  2  3  4  5
#2  |  2  3  4  5  6
#3  |  3  4  5  6  7
#4  |  4  5  6  7  8
#If you want, you can format your output using the reddit table syntax:
#|+|0|1
#|:|:|:
#|**0**|0|1
#|**1**|1|2
#Becomes this:
#+   0   1
#0   0   1
#1   1   2
#

#case ARGV[0]
#when "+"
#  operator ||= :+
#when "-"
#  operator ||= :-
#when "*"
#  operator ||= :*
#when "/"
#  operator ||= :/
#else
#  abort("What the hell?")
#end
#
operator = ARGV[0].to_sym
num = ARGV[1].to_i
print "|" + ARGV[0] 
puts (0..num).reduce("") {|s,n| s << "|" + n.to_s }
puts "|:" * num
(0..num).map do |x|
  puts "|**" + x.to_s + "**" + (0..num).reduce("") { |s,y|
   begin
    s <<  "|" + x.send(operator,y).to_s 
   rescue ZeroDivisionError 
    s << "|NaN"
   end
  }
end
