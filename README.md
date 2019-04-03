Ruby exercises made following [The Odin Project](https://www.theodinproject.com/courses/ruby-programming/)

# Project 1 : Caesar Cipher

## Description

From Wikipedia:

In cryptography, a Caesar cipher, also known as Caesar’s cipher, the shift cipher, Caesar’s code or Caesar shift, is one of the simplest and most widely known encryption techniques. It is a type of substitution cipher in which each letter in the plaintext is replaced by a letter some fixed number of positions down the alphabet. For example, with a left shift of 3, D would be replaced by A, E would become B, and so on. The method is named after Julius Caesar, who used it in his private correspondence.

## Objectives

Implement a caesar cipher that takes in a string and the shift factor and then outputs the modified string.

## My solution 

The user is prompted to input a string and a shift value. These parameters are fed to the [caesar_cipher](###caesar_cipher) function.  
The function first splits the given string in an array of characters.  
It loops on the array of characters to check if there is a match in an alphabet array containing all 26 letters.  
If the character is found, it will be shifted to the right according to the shift value given, and replaced in the output string by the new character.  
The following checks are made on each character in the string :  
- If the character is uppercase, downcase! function is used on it so it can be found in the alphabet array. The shifted character will then be upcased again to keep case.
- If the character is lowercase, it will just be shifted and replaced.
- Else, the character will not be shifted and simply put in the output string. This means that spaces and punctuation are kept, but also that some values (such as numeric values and non-English letters) will not be ciphered.

## Functions

### caesar_cipher(String, Integer)

The core function. 
Takes 2 parameters :
- The first parameter is a string to be ciphered
- The second parameter is an integer (the shift). Can accept negative values.

The function returns a new string, which is a ciphered version of the parameter string. The returned string depends on the shift value (See [description](##description) for more information).

# Project 2 : Stock Picker

## Objectives

Implement a method #stock_picker that takes in an array of stock prices, one for each hypothetical day. It should return a pair of days representing the best day to buy and the best day to sell. Days start at 0.

```
> stock_picker([17,3,6,9,15,8,6,1,10])
=> [1,4]  # for a profit of $15 - $3 == $12
```

## My solution

The [stock_picker](###stock_picker) function evaluates the difference (stored in a variable) between each value and the *next* other values in the stock array. As it is not possible to sell before buying, only following values are checked.  
This is done with a loop inside a loop. The first loop is fixed on one value, and compares it to all next values.  
For optimization, the second loop only checks values from the current value + 1 in the array :
```
 stocks.drop(i+1).each.with_index(i+1)
```
If the difference is a negative number, it means that profit can be made (because selling price is higher than buying price). The indexes and values of both stocks (buy and sell) are stored in a class variable (for easy access). If an even lower value is found for the difference while looping, the values will be overwritten by new ones.

When finished iterating, if the difference still equals 0, it means no profit can be made. The program will exit with a message. If not, the function will return an array containing the two days (buy and sell), and display a message.

## Functions

### stock_picker(Array)

The core function. Takes one parameter : 
- An array of numeric values representing stock prices.

The function returns an array of Days that represent the best day for buying a stock, and the best day for selling that stock (according to the array given in input).

# Project 3 : Substrings

## Objectives

Implement a method #substrings that takes a word as the first argument and then an array of valid substrings (your dictionary) as the second argument. It should return a hash listing each substring (case insensitive) that was found in the original string and how many times it was found.

```
  > dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
  => ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
  > substrings("below", dictionary)
  => { "below" => 1, "low" => 1 }
```

Next, make sure your method can handle multiple words:

```
> substrings("Howdy partner, sit down! How's it going?", dictionary)
  => { "down" => 1, "how" => 2, "howdy" => 1,"go" => 1, "going" => 1, "it" => 2, "i" => 3, "own" => 1,"part" => 1,"partner" => 1,"sit" => 1 }
```
## My solution

The [substrings](###substrings) function first lowercases the given string. Then it starts looping through the dictionary.  
For each word, the string is scanned to find the number of occurences of this word in the string.  

```
  dictionary.each do |e|
    if string.scan(/#{e}/).count > 0
      hash[e] = string.scan(/#{e}/).count 
    end
  end
```

If one occurence or more is found, the word and the amount of occurences are pushed in the hash.

## Functions

### substrings(String, Array)

The core function. Takes 2 parameters :

- A string
- An array of strings representing a dictionary

The function returns a hash containing words from the dictionary that have been matched in the given string, and the count of each occurence.
