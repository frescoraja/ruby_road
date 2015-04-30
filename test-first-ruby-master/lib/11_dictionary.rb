class Dictionary
    
    attr_accessor :entries
    
    def initialize
        @entries = {}
    
    end
    
    def add(term)
        if term.class == String
            @entries[term] = nil
        else
            term.each { |key,value| @entries[key] = value }
        end
        
    end
    
    def keywords
        @entries.keys.sort
    end
    
    def include?(term)
        @entries.keys.include?(term)
    end
    
    def find(term)
        result = {}
        @entries.each do
            |key, value|
            if key[0..term.length-1] == term
                result[key] = value
            end
        end
        
        return result
    end
    def printable
        output = @entries.sort.map{|key, value|"[#{key}] \"#{value}\""}.join("\n")
    end
            
        
end
