def common_substrings(str1, str2)
	subs1 = substring(str1)
	subs2 = substring(str2)
	longest_substring = ''
	length = 0
	subs1.each do |word|
		if subs2.include?(word)
			if word.length > length
				longest_substring = word
				length = word.length
			end
		end
	end
return longest_substring

end

def substring(word)
    all_substrings = []
    index = 0
    while index < word.length
        substringindex = 0
        while substringindex < word.length
            if substringindex >= index
                all_substrings << word[index..substringindex]
            end
            substringindex += 1
        end
        index += 1
    end
   return all_substrings
end