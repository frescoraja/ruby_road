def caesar_cipher(str, shift)
	words = str.split(" ")
	alph = ('a'..'z').to_a

	words.each do |word|
		for i in 0...word.length
			word[i] = alph[(alph.find_index(word[i]) + shift) % 26]
		end
	end
	return words.join(" ")
end
