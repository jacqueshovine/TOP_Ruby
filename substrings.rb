def substrings(string, dictionary)

  hash = {}

  string.downcase! #We want all words to be lowercase so we can match them in the dictionary.

  dictionary.each do |e|
    if string.scan(/#{e}/).count > 0
      hash[e] = string.scan(/#{e}/).count #Counts occurences of the regexp in the string and stores it in hash.
    end
  end

  return hash
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

puts substrings("Howdy partner, sit down! How's it going?", dictionary)
