def num_to_s(num, base)
  letters = ('A'..'F').to_a

  new_string = ""
  quo = num

  while quo > 0
    mod = quo % base
    if mod < 10
      new_string << (quo % base).to_s
    else
      new_string << letters[mod-10]
    end
    quo /= base

  end

  new_string.reverse
end

def caesar_cipher(str, num)
  arr =[]
  str.each_byte do |ascii|
    n = ascii + num
    if (n > 122)
      arr.push((n-26).chr)
    else
      arr.push(n.chr)
    end
  end
  arr.join('')
end
