def nthfact(n)
    return [1] if n <= 1
    fact = nthfact(n - 1)
    fact << fact.last * (n - 1)
end
