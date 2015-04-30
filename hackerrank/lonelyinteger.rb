#takes an integer and then that many times checks for 
#number that appears only once
gets and puts gets.split(/\s+/).map(&:to_i).reduce(:^)