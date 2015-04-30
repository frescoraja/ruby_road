#takes in # of tests, then read STDIN that many times for
#number of cuts allowed - 9 cuts means 5 cuts horiz, 4 cuts
#vertical, which produces 20 pieces (5x4)
gets.to_i.times do
    cuts = gets.to_i
    ans = cuts / 2 * (cuts / 2 + cuts % 2)
    puts ans
end