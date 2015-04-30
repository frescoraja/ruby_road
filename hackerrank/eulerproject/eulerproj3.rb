# Outputs largest prime factor of N
def prime?(n)
    return n > 1 if n <= 3
    return false if n % 2 == 0 || n % 3 == 0
    i = 5
    while i*i <= n
        return false if (n % i == 0 || n % (i + 2) == 0)
        i += 6
    end
    true
end

gets.to_i.times do 
    n = gets.to_i
    x = 1

    while x <= n/2

        if prime?(n/x) && n % x == 0
            puts n/x
            x = n
        end
        x += 1
    end
end


