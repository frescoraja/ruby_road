def makechange(value, coins)
  return [value] if coins.include?(value)

  possible_coins = []
  coins.each do |coin|
    next if coin > value
    new_value = value - coin
    remaining_coins = makechange(new_value, coins)
    next if remaining_coins.nil?
    remaining_coins.unshift(coin)
    possible_coins << remaining_coins
  end
  puts "#{possible_coins}"
  return possible_coins.min_by { |coins| coins.count }
end
