def nearest_larger(arr, idx)
    distance = 1
    
   while true
       leftcheck = idx - distance
       rightcheck = idx + distance
       
       
       if leftcheck >= 0 && arr[idx] < arr[leftcheck]
           return leftcheck
        elsif  rightcheck < arr.size && arr[rightcheck] > arr[idx]
            return rightcheck
        elsif leftcheck < 0 || rightcheck >= arr.size
           return nil
       end
   
   distance += 1
   end

end
