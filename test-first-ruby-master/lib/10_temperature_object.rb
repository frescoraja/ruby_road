class Temperature
    
    def initialize(options = {})
        if options.include?(:f)
            @ftemp = options[:f]
        end
        if options.include?(:c)
            @ftemp = options[:c] * 9.0 / 5.0 + 32
        end
    end
    
    def in_fahrenheit
        @ftemp
    end
    
    def in_celsius
        (@ftemp - 32) * 5.0 / 9.0
    end

    def self.from_celsius(cel)
        Temperature.new(:c => cel)
    end

    def self.from_fahrenheit(fahr)
        Temperature.new(:f => fahr)
    end

end

class Celsius < Temperature
    def initialize(cel)
        super(:c => cel)
    end
end

class Fahrenheit < Temperature
    def initialize(fahr)
        super(:f => fahr)
    end
end