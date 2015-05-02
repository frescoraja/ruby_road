def rbs(user_choice)
  game_choices = ["Rock","Scissors","Paper"]
  user_input = user_choice
  computer_choice = game_choices[rand(3)]
  winning_statements = [["Rock", "Scissors"], ["Scissors", "Paper"], ["Paper", "Rock"]]
  if user_input == computer_choice
    puts "#{computer_choice} Draw"
  elsif winning_statements.include?([user_input, computer_choice])
    puts "#{computer_choice}, Win"
  else
    puts "#{computer_choice}, Lose"
  end
end

rbs(gets.chomp)
