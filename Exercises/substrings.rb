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
    p all_substrings

end

substring("cat")
substring("mesothelioma")
substring("David") 