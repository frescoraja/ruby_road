def cats_with_hats
    hats = Array.new(100,1)
    cats_with_hats = []
    count = 2
    while count < 100
        index = count
        while index <= 100
            hats[index-1] = -hats[index-1]
            index += count
        end
    count += 1
    end

    index = 0
    
    while index < 100
        if hats[index] > -1
            cats_with_hats << index+1
        end
        index += 1
    end
    p cats_with_hats
end

cats_with_hats