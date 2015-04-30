# Enter your code here. Read input from STDIN. Print output to STDOUT
whatevs = gets.to_i
sticks = gets.split.map(&:to_i).to_a

while !sticks.empty?
    puts sticks.size
    min = sticks.min
    sticks.map! { |stick| stick - min }
    sticks.delete(0)
    
end