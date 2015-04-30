def rel_prime?(a,b)
	if b == 0
		return a == 1
	else
		return rel_prime?(b, a % b)
	end
end

def phi_n(n)
	phi = 0
	for x in 1..n
		if rel_prime?(n,x)
			phi += 1
		end
	end
	return phi
end

puts rel_prime?(1071,462)
puts rel_prime?(13, 9)

puts phi_n(10)
puts phi_n(13)