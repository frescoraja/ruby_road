def remix(drinks)
  alcohol = []
  mixer = []
  drinks.each do |alc, mix|
    alcohol << alc
    mixer << mix
  end

  new_drinks = []
  alcohol = alcohol.shuffle
  mixer = mixer.shuffle
  alcohol.count.times do |i|
    new_drinks << [alcohol[i], mixer[i]]
  end
  new_drinks
end
