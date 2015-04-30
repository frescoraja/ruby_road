t = gets.to_i

t.times do
    cycles = gets.to_i
    height = 1
    season = 1
    cycles.times do
        season > 0 ? height *= 2 : height += 1
        season *= -1
    end
    puts height
end