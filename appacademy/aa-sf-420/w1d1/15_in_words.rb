class Fixnum

def in_words
        if self == 0
            "zero"
        elsif self > 0 && self < 16
            one_to_fifteen(self)
        elsif self > 15 && self < 20
            teens(self)
        elsif self > 19 && self < 100
            tens(self)
        elsif self > 99 && self < 1000
            hundreds(self)
        elsif self > 999 && self < 1_000_000
            thousands(self)
        elsif self > 999_999 && self < 1_000_000_000
            millions(self)
        elsif self > 999_999_999 && self < 1_000_000_000_000
            billions(self)
        elsif self > 999_999_999_999 && self < 1_000_000_000_000_000
            trillions(self)
        end
        
        
    end
    
    def one_to_fifteen(num)
        if num == 0
            nil
        elsif num == 1
            "one"
        elsif num == 2
            "two"
        elsif num == 3
            "three"
        elsif num == 4
            "four"
        elsif num == 5
            "five"
        elsif num == 6
            "six"
        elsif num == 7
            "seven"
        elsif num == 8
            "eight"
        elsif num == 9
            "nine"
        elsif num == 10
            "ten"
        elsif num == 11
            "eleven"
        elsif num == 12
            "twelve"
        elsif num == 13
            "thirteen"
        elsif num == 14
            "fourteen"
        elsif num == 15
            "fifteen"
        end
        
    end
    
    def teens(num)
        if num == 18
            "eighteen"
        else
        "#{one_to_fifteen(num-10)}teen"
        end
    end
    def tens(num)
        if num == 20
            "twenty"
        elsif num == 30
        "thirty"
        elsif num == 40
        "forty"
        elsif num == 50
        "fifty"
        elsif num == 60
        "sixty"
        elsif num == 70
        "seventy"
        elsif num == 80
        "eighty"
        elsif num == 90
        "ninety"
        elsif num < 30
            "twenty #{one_to_fifteen(num-20)}"
        elsif num < 40
            "thirty #{one_to_fifteen(num-30)}"
        elsif num < 50
            "forty #{one_to_fifteen(num-40)}"
        elsif num < 60
            "fifty #{one_to_fifteen(num-50)}"
        elsif num < 70
            "sixty #{one_to_fifteen(num-60)}"
        elsif num < 80
            "seventy #{one_to_fifteen(num-70)}"
        elsif num < 90
            "eighty #{one_to_fifteen(num-80)}"
        elsif num < 100
            "ninety #{one_to_fifteen(num-90)}"
        end
    end
    def hundreds(num)
        if num%100 == 0
            "#{(num/100).in_words} hundred"
        else
            "#{(num/100).in_words} hundred #{(num%100).in_words}"
        end
    end
    def thousands(num)
        if num%1000 == 0
            "#{(num/1000).in_words} thousand"
            else
            "#{(num/1000).in_words} thousand #{(num%1000).in_words}"
            end
    end
    def millions(num)
        if num%1000000 == 0
            "#{(num/1000000).in_words} million"
        else
            "#{(num/1000000).in_words} million #{(num%1000000).in_words}"
        end
    end
    def billions(num)
        if num%1000000000 == 0
            "#{(num/1000000000).in_words} billion"
            else
            "#{(num/1000000000).in_words} billion #{(num%1000000000).in_words}"
        end
    end
    def trillions(num)
        if num%1000000000000 == 0
            "#{(num/1000000000000).in_words} trillion"
            else
            "#{(num/1000000000000).in_words} trillion #{(num%1000000000000).in_words}"
        end
    end
    

end
