#!/usr/bin/ruby
def maxXor(l, r)
    x = l
    maxor = 0
    while x <= r
        y = x
        while y <= r
            maxor = maxor > x ^ y ? maxor : x ^ y
            y += 1
        end
        x += 1
    end
    return maxor
end     
l = gets.to_i
r = gets.to_i
print maxXor(l, r)