Ruby exercises made following [The Odin Project](https://www.theodinproject.com/courses/ruby-programming/)

# Project 1 : Caesar Cipher

## Description

From Wikipedia:

In cryptography, a Caesar cipher, also known as Caesar’s cipher, the shift cipher, Caesar’s code or Caesar shift, is one of the simplest and most widely known encryption techniques. It is a type of substitution cipher in which each letter in the plaintext is replaced by a letter some fixed number of positions down the alphabet. For example, with a left shift of 3, D would be replaced by A, E would become B, and so on. The method is named after Julius Caesar, who used it in his private correspondence.

## Objectives

Implement a caesar cipher that takes in a string and the shift factor and then outputs the modified string:

## Functions

### caesar_cipher(String, Integer)

The core function. 
Takes 2 parameters :
- The first parameter is a string to be ciphered
- The second parameter is an integer (the shift). Can accept negative values.

The function returns a new string, which is a ciphered version of the parameter string. The returned string depends on the shift value (See [description](##description) for more information).


