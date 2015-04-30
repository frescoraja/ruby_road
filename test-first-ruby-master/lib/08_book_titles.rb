class Book
    def title= (bookname)
        @title = bookname
    end

    def title
        small_words = %w{the of an a are with in on but and or to from}
        @title.capitalize.split(/\s/).map{ |word| small_words.include?(word) ? word : word.capitalize}.join(" ")
    end

end
