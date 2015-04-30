# computes the lowest common multiple of numbers 1 through N
# lcm 1..3 = 6
# lcm 1..10 = 2520
# lcm 1..
def gcd(a,b)
    return b if a % b == 0
    return gcd(b, a % b)
end
gets.to_i.times do
    
    n = gets.to_i
    lcm = n
    x = n-1
    while x > 1
        lcm = (lcm * x) / gcd(lcm, x)
        x -= 1
    end
    puts lcm
end