# def factors(num)
#  factor_array = []
#   for i in 1..num do
#     if num % i == 0
#       factor_array << i
#     end
#   end
#   puts factor_array
# end

def factors(num)
  puts (0..num).to_a.select {|n| num % n== 0 }
end

def bubble_sort(list)
  sorted = false
  until sorted
    sorted = true
    i = 0
    while i < list.length - 1
      if list[i] > list[i + 1]
        list[i], list[i + 1] = list[i + 1], list[i]
        sorted = false
      end
      i += 1
    end
  end
  list
end

def substrings(string)
  length = string.length
  output = []
  (0...length).each do |i|
    (i...length).each do |j|
      output << string[i..j]
    end
  end
  output
end

def subwords(string)
  dictionary = []
  File.foreach("dictionary.txt") do |line|
    dictionary << line.chomp
  end
  words = substrings(string)
  words.select { |word| dictionary.include?(word) }
end
