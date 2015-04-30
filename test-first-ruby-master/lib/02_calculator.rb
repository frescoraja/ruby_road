def add(num1,num2)
    return num1 + num2
end

def subtract(num1,num2)
    return num1 - num2
end

def sum(arr)
    if arr.empty? 
        return 0
    else
        n = 0
        arr.each { |x| n += x }
        return n
    end
end

def multiply(arr)
    n = 1
    arr.each { |x| n *= x }
    return n
end

def power(num1,num2)
    return num1 ** num2
end

def factorial(num)
    start = 1
    while num > 0
        start *= num
        num -= 1
    end
    return start
end