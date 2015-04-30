MORSE_CODE = {
    "a" => ".-",
    "b" => "-...",
    "c" => "-.-.",
    "d" => "-..",
    "e" => ".",
    "f" => "..-.",
    "g" => "--.",
    "h" => "....",
    "i" => "..",
    "j" => ".---",
    "k" => "-.-",
    "l" => ".-..",
    "m" => "--",
    "n" => "-.",
    "o" => "---",
    "p" => ".--.",
    "q" => "--.-",
    "r" => ".-.",
    "s" => "...",
    "t" => "-",
    "u" => "..-",
    "v" => "...-",
    "w" => ".--",
    "x" => "-..-",
    "y" => "-.--",
    "z" => "--.."
}
def morse_encode(str)
    words = str.split(" ")
    encoded_words = words.map { |word| morse_encoded_word(word) }
    encoded_words.join("  ")
end

def morse_encoded_word(word)
    letters = word.split("")
    coded = letters.map { |x| MORSE_CODE[x]}
    coded.join(" ")
end
