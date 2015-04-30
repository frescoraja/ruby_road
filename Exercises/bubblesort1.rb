def bubblesortq(arr)
    n = arr.size

    while n > 0
        newn = 0
			for i in 1..(n-1)
        if arr[i-1] > arr[i]
            arr[i],arr[i-1] = arr[i-1],arr[i]
            newn = i
            p newn
            p arr
        end
    end
    n = newn
    end
    arr


end

p bubblesortq([1,4,3,9,6,5,4,2])