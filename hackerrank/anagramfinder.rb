#takes number of tests, then for each test takes a string,
#returning number of unordered anagrams contained within
#string..
#"abba" - a, b, ab, abb - 4
gets.to_i.times do
    string = gets.strip.split(//)
    count = 0
    length = 1
    while length < string.length
        i = 0
        while i < string.length
            str1 = string[i,length]
            j = i + 1
            while (j + length) <= string.length
                str2 = string[j,length]
                if str2.sort == str1.sort
                    count += 1
                end
                j += 1
            end
         i += 1
        end
        length += 1
    end
    puts count
end