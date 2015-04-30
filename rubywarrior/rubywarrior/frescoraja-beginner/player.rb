class Player
  def play_turn(warrior)
      
      if warrior.feel.empty? && (warrior.health > 19 || warrior.health <= @health)
              @health = warrior.health
              warrior.walk!
          else
              @health = warrior.health
              warrior.rest!
          end
      elsif warrior.feel.captive?
            @health = warrior.health
            warrior.rescue!
    
          @health = warrior.health
          warrior.attack!
      end
  end
end
