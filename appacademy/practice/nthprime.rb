def nthprime(n)
  count = 0
  check = 0
  while count < n
    check += 1
    if is_prime?(check)
      count += 1
    end
  end
  check
end

def is_prime?(n)
  return n > 1 if n <= 3
  return false if n % 2 == 0 || n % 3 == 0
  i = 5
  while i*i <= n
    return false if n % i == 0 || n % (i + 2) == 0
    i += 6
  end
  true
end

p nthprime(5)
p nthprime(1)
p nthprime(2)
p nthprime(3)
p nthprime(4)
p nthprime(30)
