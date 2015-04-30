stopwords = %w{the a by on for of are with just but and to the my I has some in}
lines = File.readlines(ARGV[0])
line_count = lines.size
text = lines.join

#Count characters
total_characters = text.length
total_characters_nospaces = text.gsub(/\s+/,'').length

#Count Words, sentences, paragraphs
total_words = text.split.length
total_sentences = text.split(/\.|\?|!/).length
total_paragraphs = text.split(/\n\n/).length

#Make list of words in text that are not stop words,
#count them, and work out percentage of non-stop words.
all_words = text.scan(/\w+/)
good_words = all_words.select{ |word| !stopwords.include?(word) }
good_percentage = ((good_words.size.to_f / total_words.to_f) * 100).to_i

#Summarize text by cherry picking choice sentences
sentences = text.gsub(/\s+/,' ').strip.split(/\.|\?|!/)
sentences_sorted = sentences.sort_by { |sentence| sentence.length }
one_third = sentences_sorted.length/3
ideal_sentences = sentences_sorted.slice(one_third,one_third + 1)
ideal_sentences = ideal_sentences.select { |sentence| sentence =~ /is|are/ }

#Print results
puts "#{line_count} lines"
puts "#{total_characters} characters"
puts "#{total_characters_nospaces} characters excluding spaces"
puts "#{total_words} words"
puts "#{total_sentences} sentences"
puts "#{total_paragraphs} paragraphs"
puts "#{total_words/total_sentences} words per sentence (average)"
puts "#{total_sentences/total_paragraphs} sentences per paragraph (average)"
puts "#{good_percentage}% of words are good words"
puts "Summary:\n\n" + ideal_sentences.join(". ")
puts "End of Analysis"