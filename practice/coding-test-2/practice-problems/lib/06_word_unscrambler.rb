def word_unscrambler(str, words)
    words.select { |word| str.split("").sort == word.split("").sort }
end
