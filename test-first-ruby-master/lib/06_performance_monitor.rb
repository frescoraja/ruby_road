def measure(num = 1)
    start = Time.now
    num.times { yield }
    (Time.now - start) / num
end