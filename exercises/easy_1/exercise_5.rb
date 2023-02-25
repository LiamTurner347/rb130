LOWERCASE = ("a".."z").to_a
UPPERCASE = ("A".."Z").to_a

def decipher(name)
  deciphered_arr = []

  name.chars.each do |letter|
    if LOWERCASE.include?(letter)
      new_index = find_updated_index(LOWERCASE, letter)
      deciphered_arr << LOWERCASE[new_index]
    elsif UPPERCASE.include?(letter)
      new_index = find_updated_index(UPPERCASE, letter)
      deciphered_arr << UPPERCASE[new_index]
    else
      deciphered_arr << letter
    end
  end

  deciphered_arr.join
end

def find_updated_index(array, letter)
  index = array.index(letter) 
  index > 12 ? (index - 13) : (index + 13)
end

p decipher("Nqn Ybirynpr")
p decipher("Tenpr Ubccre")
p decipher("Nqryr Tbyqfgvar")
p decipher("Nyna Ghevat")
p decipher("Puneyrf Onoontr")
p decipher("Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv")
p decipher("Wbua Ngnanfbss")
p decipher("Ybvf Unvog")
p decipher("Pynhqr Funaaba")
p decipher("Fgrir Wbof")
p decipher("Ovyy Tngrf")
p decipher("Gvz Orearef-Yrr")
p decipher("Fgrir Jbmavnx")
p decipher("Xbaenq Mhfr")
p decipher("Fve Nagbal Ubner")
p decipher("Zneiva Zvafxl")
p decipher("Lhxvuveb Zngfhzbgb")
p decipher("Unllvz Fybavzfxv")
p decipher("Tregehqr Oynapu")