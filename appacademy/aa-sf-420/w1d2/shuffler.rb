# def shuffler
#
#   print "What file would you like to shuffle?"
#   open_file = gets.chomp
#
#   contents = File.readlines("#{open_file}.txt")
#   new_file = File.open("#{open_file}-shuffled.txt","w")
#   contents = contents.shuffle
#   contents.each do |line|
#     new_file.puts line
#   end
#   new_file.close
# end

def shuffle_file(filename)
  base = File.basename(filename, ".*")
  extension = File.extname(filename)
  File.open("#{base}-shuffled#{extension}", "w") do |f|
    File.readlines(filename).shuffle.each do |line|
      f.puts line.chomp
    end
  end
end

if __FILE__ == $PROGRAM_NAME
  if ARGV.length == 1
    shuffle_file(ARGV.shift)
  else
    puts "ENTER FILENAME TO SHUFFLE:"
    filename = gets.chomp
    shuffle_file(filename)
  end
end
