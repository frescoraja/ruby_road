def digital_root(num)
answer = digital_root_step(num)

while answer > 10
	answer = digital_root_step(answer)
end

answer

end


def digital_root_step(num)

	sum = 0
	mod = 10
	newnum = num

	while newnum > 0 
		digit = newnum % mod
		newnum = newnum / mod
		mod *= 10

		sum += digit
	end
	return sum

end
