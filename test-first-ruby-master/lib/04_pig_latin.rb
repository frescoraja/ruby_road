def translate(words)
	vowels = %w{a e i o u}
	phrase = words.split(/\s/)
	phrase.map! { |word|
		#word starts with vowel - append 'ay'
		if vowels.include?(word[0])
			word << 'ay'

			#if word starts with 'qu' - drop 'qu' and append 'quay'
		elsif word.downcase.start_with?('qu')
			if word.capitalize == word  # checks to see if it was capitalized
				
				word = (word[2..-1].downcase + "quay").capitalize
			else
				word = word[2..-1] + "quay"
			end
		else

			#if word starts with any number of consonants
			index = word =~ /[aeiouy]/

			if word[index] == 'u' && word[index-1] == 'q'
				index += 1
			end

			#checks to see if capitalized
			if word.capitalize == word
				word = ((word[index..-1] + word[0..index-1]).downcase + "ay").capitalize
			else
				word = word[index..-1] + word[0..index-1] + "ay"
			end
		end
		index = word =~ /[.?,:;]/
		if index != nil
			word = word[0..index-1] + word[index+1..-1] + word[index]
		end
		word
	}

	phrase.join(" ")
end