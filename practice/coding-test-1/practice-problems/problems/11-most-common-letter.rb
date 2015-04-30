# Write a method that takes in a string. Your method should return the
# most common letter in the array, and a count of how many times it
# appears.
#
# Difficulty: medium.

def most_common_letter(string)
    total = 0
    endletter = ''
    for x in 0..(string.length-1)
        letter = string[x]
        counter = 0
        for i in 0..(string.length-1)
            if string[i] == letter
                counter += 1
            end
        end
        total = counter if counter > total
        endletter = letter
    end
    return [endletter,total]
end

# These are tests to check that your code is working. After writing
# your solution, they should all print true.

puts(
  'most_common_letter("abca") == ["a", 2]: ' +
  (most_common_letter('abca') == ['a', 2]).to_s
)
puts(
  'most_common_letter("abbabkfjghhriwoqpjwlkajlhwhrhrhrhwhqhqhwehqwehqwhwhhhhh") == ["h", 18]: ' +
  (most_common_letter('abbabkfjghhriwoqpjwlkajlhwhrhrhrhwhqhqhwehqwehqwhwhhhhh') == ['h', 18]).to_s
)
