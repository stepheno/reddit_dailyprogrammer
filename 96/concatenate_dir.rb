#!/bin/ruby
# Write a program that concatenates all text files (*.txt) in a directory, numbering file names in alphabetical order. Print a header containing some basic information above each file.
# For example, if you have a directory like this:
# ~/example/abc.txt
# ~/example/def.txt
# ~/example/fgh.txt
# And call your program like this:
# nooodl:~$ ./challenge97easy example
# The output would look something like this:
# === abc.txt (200 bytes)
# (contents of abc.txt)
# 
# === def.txt (300 bytes)
# (contents of def.txt)
# 
# === ghi.txt (400 bytes)
# (contents of ghi.txt)
# For extra credit, add a command line option '-r' to your program that makes it recurse into subdirectories alphabetically, too, printing larger headers for each subdirectory.
# 
#

directory = ARGV[0].nil? ? '.' : ARGV[0]
Dir.entries(directory).sort.each do |file|
  next if file == '.' or file == '..'
  file = directory + "/" +file
  if File.file?(file) 
    f = File.open(file)
    printf "=== %s (%d bytes)\n" ,file, f.size 
    f.each_line{|f| print f}
  end
end
