#funny strings are strings such that
# |S(i) - S(i-1)| == |R(i)-R(i-1)|
#where R = S.reverse
#takes number of strings, then for each one prints "Funny"
#or "Not Funny"

gets.to_i.times do
    string = gets.strip
    rev = string.reverse
    x = 0
    i = string.length - 1
    funny = true
    while funny == true && x < i
        if ((string[x].ord) - (string[x-1].ord)).abs != ((rev[x].ord) - (rev[x-1].ord)).abs
            funny = false
        end
        x += 1
    end
    if funny == true
        puts "Funny"
    else
        puts "Not Funny"
    end
    
end