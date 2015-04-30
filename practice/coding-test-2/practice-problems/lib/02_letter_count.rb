def letter_count(str)
    char_counts = {}
    str.each_char do |char|
        next if char == " "
        char_counts[char] = 0 unless char_counts.include?(char)
        char_counts[char] += 1
    end
    char_counts
end
