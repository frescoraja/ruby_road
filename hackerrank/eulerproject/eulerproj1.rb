#return sum of all i < n where i|3 || i|5
# where n = 10, i = 3, 5, 6, 9 , sum = 23
# where n = 100, i = 3, 5, 6, 9, 10, 12 .. 99 , sum = 2318

gets.to_i.times do
    n = gets.to_i
    x = n-1
    while x % 3 != 0
        x -= 1
    end
    y = n-1
    while y % 5 != 0
        y -= 1
    end
    z = n-1
    while z % 15 != 0
        z -= 1
    end
    
    sum = ((x/3) * (3 + x)) / 2
    sum += ((y/5) * (5 + y)) / 2
    sum -= ((z/15) * (15 + z)) / 2
    puts sum    
end