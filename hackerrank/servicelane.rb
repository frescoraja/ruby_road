arr = gets.strip.split(" ")
segs = arr[0].to_i
tests = arr[1].to_i
widths = gets.strip.split(" ").map! { |val| val.to_i }

tests.times do
    maxwidth = 3
    range = gets.strip.split(" ").map! { |val| val.to_i }
    start = range[0]
    stop = range [1]
    while start <= stop
        if widths[start] < maxwidth
            maxwidth = widths[start]
        end
        start += 1
    end
    puts maxwidth
end