def echo(string)
    string
end

def shout(string)
    string.upcase
end

def repeat(words, times=2)
    arr = Array.new
    while times > 0
        arr << words
        times -= 1
    end
    arr.join(" ")
end

=begin
def repeat(words, times=2)
    if times == 1
        "#{words}"
    else
    "#{words} " + repeat(words, times-1)
    end
end
=end

def start_of_word(word,part)
    word[0..part-1]
end

def first_word(string)
    string.split("\s").first
end

def titleize(words)
    smallwords = %w{and in an a of the at over under with just to my has some its it if by his her their theirs hers they him}
    
  words.capitalize.split.map{|word| smallwords.include?(word) ? word : word.capitalize}.join(" ")
  
  
end

