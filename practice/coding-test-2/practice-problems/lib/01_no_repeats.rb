def no_repeats(year_start, year_end)
    no_repeats = []
    for i in year_start..year_end

        if no_repeat?(i)
            no_repeats << i
        end
    end
    return no_repeats
end
        
def no_repeat?(year)
    chars_seen = []
    year.to_s.each_char { |char| return false if chars_seen.include?(char)
        chars_seen << char}
    return true
end