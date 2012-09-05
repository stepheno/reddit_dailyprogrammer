#!/bin/ruby
# Your intermediate task today is to write a function that can create "filler text", i.e. text that doesn't actually mean anything, but from a distance could plausibly look like a real language. This is very useful, for instance, if you're a designer and want to see what a design would look like with text in it, but you don't actually want to write the text yourself.
# 
# The rules are:
# 
#     The argument to function is the approx number of words.
#     The text is made up of sentences with 3-8 words
#     Each word is made up of 1-12 chars
#     Sentences have first word capitalized and a period at the end
#     After each sentence there is a 15% chance of a linebreak and an additional 50% chance of this line break being a paragraph break.
# 
# An example of what the text might look like can be found here.

words = []
File.open('/usr/share/dict/words').each_line { |line| words << line.downcase.strip if line.length <= 12 }

def filler_text(num_words, dict)
    fill_text = []
    rando = Random.new()
    while fill_text.length < num_words do
        sentence = dict.sample(rando.rand(3..8))
        sentence.first.capitalize!
        sentence.last.insert(-1,'.')
        if rando.rand(100) < 15 
            sentence.last.insert(-1,"\n")
            if rando.rand(2) < 1
                sentence.last.insert(-1,"\n")
            end
        end
        fill_text += sentence
    end
    fill_text.reduce('') {|text,word| text + word + " "}
end

puts filler_text(ARGV[0].to_i,words)
