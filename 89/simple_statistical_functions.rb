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

def variance(data_set)
  mean = arithmetic_mean(data_set)
  data_set.map{|x| x - mean}.map{|x| x * x}.reduce(:+) / data_set.length
end

def standard_dev(data_set)
  Math.sqrt(variance(data_set))
end

data_set = []
ARGF.each {|line| data_set << line.chomp.to_f }
printf "Mean: %f\nVariance: %f\nStd. Dev: %f\n", arithmetic_mean(data_set), variance(data_set), standard_dev(data_set)
