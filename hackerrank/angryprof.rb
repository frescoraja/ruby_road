# Enter your code here. Read input from STDIN. Print output to STDOUT
gets.to_i.times do
    count = 0
    students = gets.split.map(&:to_i)[1]
    gets.split.map(&:to_i).each { |time| count += 1 if time <= 0 }
    if count >= students
        puts "NO"
    else
        puts "YES"
    end
end