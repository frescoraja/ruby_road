# largest palindrome of 6 digits with two 3-digit factors
# that is less than N
# 101101 < N < 1000000
arr = (101..999).to_a
arr.map! { |x| (x.to_s + x.to_s.reverse).to_i }
gets.to_i.times do
    n = gets.to_i
    index = 0
    pal = arr[0]
    maxpal = pal
    while pal < n
        x = 999
        while x > 99
            if pal % x == 0
                if pal > maxpal && (pal/x) < 1000
                    maxpal = pal
                end
            end
            x -= 1
        end
        index += 1
        pal = arr[index]
    end
    puts maxpal
end