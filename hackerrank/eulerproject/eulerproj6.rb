# Calculates difference of sums of number 1 to n squared
# and squares of numbers 1 to n summed
gets.to_i.times do
	n = gets.to_i
    puts ((n * (n + 1)) / 2)**2 - ((n * (n + 1) * (2 * n + 1)) / 6)
end