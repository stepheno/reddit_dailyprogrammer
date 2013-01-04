#!/bin/ruby
#Description:
#Let the term "sum-pair" be a pair of integers A and B such that the sum of A and B equals a given number C.
# As an example, let C be 10. Thus, the pairs (5, 5), (1, 9), (2, 8), etc. are all sum-pairs of 10.
#Your goal is to write a program that, given an array through standard input (console), you echo out all sum-pairs of a given integer C.
#Formal Inputs & Outputs:
#Input Description:
#On the console, you will be first given an integer N. This is the number of following integers that are part of the array.
#After the N integers, you will be given an integer C which represents the sum-pair you are attempting to match.
#Output Description:
#Your program must print all unique pair of integers in the given list, where the sum of the pair is equal to integer C.
#Sample Inputs & Outputs:
#Input (Through Console)
#4
#1 -3 4 10
#5
#Output (Through Console)
#1, 4
#Note that there is only one pair printed to the console since there is only one unique pair (1, 4) that has the sum of C (5).
#Challenge Input:
#We will show the solution of this problem data-set in 7-days after the original submission.
#14
#10 -8 2 1 4 -9 6 1 9 -10 -5 2 3 7
#7
#Note:
#This is a common interviewing problem for programming jobs, so treat it as such! There is a very trivial solution, 
#but the trivial solution will run in O(N2 ) time. There are two known better solutions: one that runs in 
#O(N Log(N)) time, and another in linear time. Note that the linear-time solution requires non-linear memory allocation!e

puts "Number of integers:"
num_args = gets.to_i
puts "Your integers please:"
args = gets.split.map{ |i| i.to_i}
puts "Sum-Pair target:"
sum_pair = gets.to_i
puts "Matches:"
args.each_with_index do |x, i|
 args[i..-1].each { |y| puts "%d, %d" % [x,y] unless x + y != sum_pair }
end
