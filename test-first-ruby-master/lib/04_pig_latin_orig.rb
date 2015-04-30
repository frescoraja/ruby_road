##translates string of english words to pig latin. retains punctuation, capitalization, and

def translate(english)
    phrase = english.split(/\s/)
    phrase.map! { |word|
        
        ## simple case - word starts with vowel, append "ay"
        if word.downcase.start_with?('a','e','i','o','u')
            word << "ay"
            
            ## word starts with "qu" - remove "qu" and append "quay"
        elsif word.downcase.start_with?('qu')
        if word[0].ord < 91 && word[0].ord > 64  ##check if capitalized
                word = (word[2..-1] + "quay").capitalize
            else
                word = word[2..-1] + "quay"
            end
        else
        ## word starts with other consonants
            index = word.downcase =~ /[aeiouy]/
            if (word[index-1..index]).downcase == 'qu' ## checks if qu is in string
                 index += 1
               end
            if word[0].ord < 91 && word[0].ord > 64 ##check if capitalized
                word = (word[index..-1] + word[0..index-1] + "ay").capitalize
            else
                word = (word[index..-1] + word[0..index-1] + "ay").downcase
            end
        end
        index = word =~ /[?.,:;]/ ## checks for punctuation, moves to end of word
        if index != nil
            word = word[0..index-1] + word[index+1..-1] + word[index]
        end
        word
        
        }
    phrase.join(" ")
end