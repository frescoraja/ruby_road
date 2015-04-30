def primes
    primesarray = []
    for i in 1..1000
        if prime?(i) == true
            primesarray << i
        end
    end
    p primesarray

end

def prime?(num)
    if num == 1
        return true
    end
    
    index = 2
    
    while index <= num/2
        if (num % index) == 0
            return false
        end
        index += 1
    end
    return true
end


