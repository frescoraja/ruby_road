def bubblesort(array)
    n = array.size
    while n > 0
        newn = 0
        for index in 1..(n-1)
            if array[index-1] > array[index]
                temp = array[index-1]
                array[index-1] = array[index]
                array[index] = temp
                newn = index
            end
        end
        n = newn
    end
        array
end

p bubblesort([6,4,3,8,5,2,9,0])
p bubblesort([9,8,7,6,5,4,3,2,1])