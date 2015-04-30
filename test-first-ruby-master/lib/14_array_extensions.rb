class Array
    
    def sum
        if self.empty?
            return 0
        else
            answer = 0
            self.each {|x| answer += x}
            answer
        end
    end
    
    def square
        if self.empty?
            []
        else
            self.map { |x| x * x }
        end
    end
    
    def square!
        if self.empty?
            []
        else
            self.map! { |x| x * x }
        end
    end


end