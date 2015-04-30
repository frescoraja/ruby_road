def fibonacci(num)
  fibs = [0, 1]
  return fibs.take(num) if num <= 2
  previous_fibonacci = fibonacci(num - 1)
  current = previous_fibonacci[-1] + previous_fibonacci[-2]
  return previous_fibonacci << current
end

def fibo_iter(num)
  fibs = [0, 1]
  return fibs.take(num) if num <= 2

  (num - 2).times do |i|
    new_num = fibs[-1] + fibs[-2]
    fibs << new_num
  end
  fibs
end
