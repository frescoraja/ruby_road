def bubble_sort(arr)
    sorted = false
    until sorted
        sorted = true
        (arr.count-1).times do |i|
            if arr[i] > arr[i+1]
                temp = arr[i]
                arr[i] = arr[i+1]
                arr[i+1] = temp
                sorted = false
            end
        end
    end
    arr
end
