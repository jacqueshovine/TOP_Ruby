=begin
 Tant que le tableau n'est pas trié, on boucle.
 Variable sorted = true dans la première boucle. Passe à false si un changement
 est fait dans la 2e boucle. 

 On compare chaque élément avec le suivant. Si a > b, on swap.
 L'idée est de faire remonter les plus grands nombres au bout du tableau.
 Au maximum, la 2e boucle s'exécute n-1 fois (car à chaque passage un élément
 est forcément trié), n étant le nombre d'éléments du tableau.

 Ex : [2,1] => [1,2]
 Ex : [2,3,1] => [2,1,3] => [1,2,3]
 Ex : [4,2,3,1] => [2,3,1,4] => [2,1,3,4] => [1,2,3,4]

 
swap = e
array[i] = array[i+1]
array[i+1] = e
sorted = false
=end

def bubble_sort(array)
  n = array.length-1 # n equals the number of elements in the array (minus 1 since we start at 0)
  loop do
    sorted = true # Flag variable. We exit loop if it remains true (it would mean no swap occured, and the array is sorted already)
    for i in 0..n-1 # Since at least one element is sorted for each pass, we don't have to look at the last element
      if array[i] > array[i+1]
        array[i], array[i+1] = array[i+1], array[i]
        sorted = false
      else
        next
      end
    end
    n -= 1 # After each for loop, we know that the last element is sorted. We avoid to check the n last elements each time.
    break if sorted
  end

  return array
end

def bubble_sort_by(array)
  n = array.length-1
  if array.all? { |e| e.is_a? String }
    loop do
      sorted = true
      for i in 0..n-1
        if yield(array[i], array[i+1]) > 0
          array[i], array[i+1] = array[i+1], array[i]
          sorted = false
        else
          next
        end
      end
      n -= 1
      break if sorted
    end
  else
    puts "Error : This method takes an array of strings."
  end

  print array
end

puts "Bubble sort (numbers) : "
print bubble_sort([4,3,78,2,0,2])
puts ""
puts "Bubble sort (string length) : "
bubble_sort_by(["hi","hello","hey"]) do |left,right|
  left.length - right.length
end