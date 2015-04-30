# adds sum of even fibonacci numbers less than n
gets.to_i.times do
    n = gets.to_i
    sum = 0
    fn = 1
    fprev = 1
    while fn < n
        if fn % 2 == 0
            sum += fn
        end
        fprev, fn = fn, fn + fprev
    end
    puts sum
end