def fibs(num)
 	arr = []
 	for i in 1..num
 		if i == 1
 			arr << 0
 		elsif i == 2
 			arr << 1
 		else
 			arr << arr[i-2] + arr[i-3]
 		end
 	end
	arr		
end


 
