#!/bin/ruby
# For today's challenge, you should calculate some simple statistical values based on a list of values. Given this data set, write functions that will calculate:
# The mean value
# The variance
# The standard deviation
# Obviously, many programming languages and environments have standard functions for these (this problem is one of the few that is really easy to solve in Excel!), but you are not allowed to use those! The point of this problem is to write the functions yourself.
# Thanks to Cosmologicon for suggesting this problem at /r/dailyprogrammer_ideas!

def arithmetic_mean(data_set)
  data_set.reduce(:+) / data_set.length
end

def variance(data_set,mean)
  data_set.map{|x| x - mean}.map{|x| x * x}.reduce(:+) / data_set.length
end

def standard_dev(variance)
  Math.sqrt(variance)
end

data_set = []
ARGF.each {|line| data_set << line.chomp.to_f }
data_set.sort
mean = arithmetic_mean(data_set)
set_variance = variance(data_set,mean)
printf "Arithmetic Mean: %f\n" , mean
printf "Variance: %f\n" , set_variance
printf "Standard Deviation: %f\n" , standard_dev(set_variance)
#print data_set
