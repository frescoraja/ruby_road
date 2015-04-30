=begin
takes input "string" and returns minimal operations required
in order to convert to a palindrome by decrementing letters
until they match
	acc >> acb >> aca (2 operations)
	aaddaa >> 0
	abcdefghijklmnopqrstuvwxyz >> 169
=end

alph = ('a'..'z').to_a
x = gets.to_i
x.times do
    string = gets.strip
    half = string.length / 2
    ops = 0
    for i in 0...half do
        ops += (alph.find_index(string[i]) - alph.find_index(string[-(i+1)])).abs
    end 
    puts ops
end 