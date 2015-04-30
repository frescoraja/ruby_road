def insertionsort(array)
    (array.size).times do |i|
        x = array[i]
        j = i
        while j > 0 && array[j-1] > x
            array[j] = array[j-1]
            j -= 1
        end
        array[j] = x
        
    end
    array

end

p insertionsort([5,4,2,1,6,7])
p insertionsort([9,8,7,6,5,4,3,2,1,0])
p insertionsort([229,80,1732,16,251,413,4134,123,111,120])
p insertionsort([2,1])
