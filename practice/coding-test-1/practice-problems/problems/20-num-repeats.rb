# Write a method that takes in a string and returns the number of
# letters that appear more than once in the string. You may assume
# the string contains only lowercase letters. Count the number of
# letters that repeat, not the number of times they repeat in the
# string.
#
# Difficulty: hard.

def num_repeats(string)
    idx = 0
    repeats = []
    while idx < string.length
        letter = string[idx]
        counter = 0
        while counter < repeats.size
            if repeats[counter][0] == letter
                repeats[counter][1] += 1
                break
            end
            counter += 1
        end
        
        if counter == repeats.size
            repeats.push([letter, 1])
        end
        p repeats
        idx += 1
    end
        
    total_repeats = 0
    idx = 0
    while idx < repeats.size
        if repeats[idx][1] > 1
            total_repeats += 1
        end
        idx += 1
    end
    return total_repeats
end

# These are tests to check that your code is working. After writing
# your solution, they should all print true.

puts('num_repeats("abdbc") == 1: ' + (num_repeats('abdbc') == 1).to_s)
# one character is repeated
puts('num_repeats("aaa") == 1: ' + (num_repeats('aaa') == 1).to_s)
puts('num_repeats("abab") == 2: ' + (num_repeats('abab') == 2).to_s)
puts('num_repeats("cadac") == 2: ' + (num_repeats('cadac') == 2).to_s)
puts('num_repeats("abcde") == 0: ' + (num_repeats('abcde') == 0).to_s)
