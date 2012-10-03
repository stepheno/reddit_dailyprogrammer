# Write a function that takes a string s and an integer n, and returns whether or not the string s contains at most n different characters.
#For example, ncset("aacaabbabccc", 4) would return true, because it contains only 3 different characters, 'a', 'b', and 'c', and 3 ≤ 4.
# For how many English words (yes, it's time for this dictionary again!) does ncset(word, 4) hold?

def ncset(s, n)
  s.chars.sort.join.squeeze.length > n
end

total = 0
File.open(ARGV[0]).each_line {|line| total += 1 if ncset(line,ARGV[1].to_i) }
p total
