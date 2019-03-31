def caesar_cipher(string, shift)
  alphabet = ('a'..'z').to_a
  splitted_string = string.chars
  ciphered_string = ''

  splitted_string.each do |i|
    if /[[:upper:]]/.match(i)
      i.downcase!
      index = (alphabet.index(i) + shift) % alphabet.length
      ciphered_string += alphabet[index].upcase
    elsif alphabet.include? i
      index = (alphabet.index(i) + shift) % alphabet.length #If greater than length, we use modulo to remain in array boundaries.
      ciphered_string += alphabet[index]
    else
      ciphered_string += i
    end
  end

  return ciphered_string
end

while true do
  print 'Input a string please : '
  input_string = gets.chomp

  print 'Enter a shift value please (negative values accepted) : '
  input_shift = gets.chomp

  puts 'Your ciphered string : ' + caesar_cipher(input_string, input_shift.to_i) 
end
