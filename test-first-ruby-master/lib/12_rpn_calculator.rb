class RPNCalculator
    
    def initialize
        @calculator = []
    end

    
    def push(num)
      
      @calculator << num
    
    end
    
    def plus
        if @calculator.size >=2
            @calculator << @calculator.pop + @calculator.pop
        else
            raise "calculator is empty"
        end
    end
    
    def minus
        if @calculator.size >= 2
            diff2 = @calculator.pop
            diff1 = @calculator.pop
            diff = diff1 - diff2
            @calculator << diff
        else
            raise "calculator is empty"
        end
    end
    
    def divide
       if @calculator.size >= 2
           divisor = @calculator.pop.to_f
           dividend = @calculator.pop.to_f
           quotient = dividend / divisor
           @calculator << quotient
        else
            raise "calculator is empty"
        end
    end
    
    def times
       if @calculator.size >= 2
           product = @calculator.pop * @calculator.pop
           @calculator << product
        else
            raise "calculator is empty"
        end
    end
    
    def value
        @calculator.last
    end
    
    def tokens(operators)
        operators.split(" ").map! {
            |x|
            if x == '/' || x == '*' || x == '+' || x == '-'
                x.to_sym
            else
                x.to_i
            end
        }
    end
    
    def evaluate(stream)
        tokens(stream).each {
            |x|
            if x == :+
                self.plus
                elsif x == :-
                self.minus
                elsif x == :/
                self.divide
                elsif x == :*
                self.times
                else
                self.push(x)
                end
        }
        
        self.value
    end
end
