def exp1(base, power)
  return 1 if power == 0
  return base * exp1(base, power-1)
end

def exp2(base,power)
  return 1 if power == 0
  if power % 2 == 0
    square(exp2(base, power / 2))
  else
    base * square(exp2(base, (power - 1) / 2))
  end
end

def square(num)
  num * num
end
