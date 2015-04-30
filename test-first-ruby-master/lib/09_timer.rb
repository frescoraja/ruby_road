class Timer
    def seconds
        @seconds = 0
    end
    def seconds=(value)
        @seconds = value
    end
    
    def padded(num)
        if num.to_s.length < 2
            "0#{num}"
            else
            num.to_s
        end
    end
        
    def time_string
        days = @seconds / 86400
        hr = @seconds % 86400 / 3600
        min = @seconds % 3600 / 60
        sec = @seconds % 60
        "#{padded(days)}:#{padded(hr)}:#{padded(min)}:#{padded(sec)}"
    end

end