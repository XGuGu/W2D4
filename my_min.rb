def my_min(list)
  result = []
  i = 0
  while (i < list.length)
    result[i] = true
    j = 0
    while (j < list.length)
      if list[i] > list[j]
        result[i] = false
      end
      j += 1
    end
    i += 1
  end
list[result.index(true)]
end

def my_min_n(list)
  min = list[0]
  i = 1
  while (i < list.length)
    if list[i] < min
      min = list[i]
    end
    i += 1
  end
  min
end

def largest_contigous_subsum(list)
  sub_arr = []
  i = 0
  while i < list.length
    j = i
    while j < list.length
      sub_arr << list[i..j].reduce(:+)
      j += 1
    end
    i += 1
  end
  sub_arr.max
end

def optimal(list)
  largest = list.first
  curr = 0
  i = 1
  while (i < list.length)
    curr = curr + list[i]
    if largest < curr
      largest = curr
    end
    if curr < 0
      curr = 0
    end
  i += 1
  end
  largest
end

def first_anagram?(str1, str2)
  array = permutation(str1.chars)
  array.map! {|sub| sub.join('')}
  array.include?(str2)
end

def permutation(array) #1,2,3
  return [array] if array.length <= 1
  first = array.shift

  perms = permutation(array)

  total_permutations = []


  perms.each do |perm|
    (0..perm.length).each do |i|
      total_permutations << perm[0...i] + [first] + perm[i..-1]
    end
  end
  total_permutations
end

# p first_anagram?('abc','b')
def second_anagram?(str1, str2)
  i = 0
  while i < str1.length
      letter = str1[i]
      if j = str2.chars.find_index(letter)
        str2[j] = ""
      end
    i += 1
  end
  str2.length == 0
end

def third_anagram?(str1, str2)
  str1.chars.sort == str2.chars.sort
end

def fouth_anagram?(str1, str2)
  h1 = Hash.new(0)

  str1.chars.each do |elm|
    h1[elm] += 1
  end
  str2.chars.each do |elm|
    h1[elm] -= 1
  end
  h1.values.all?{|el| el == 0}
end

def bad_two_sum?(arr, target_sum)
  i = 0
  while i < arr.length - 1
    j = i + 1
    while j < arr.length
      return true if arr[i] + arr[j] == target_sum
      j += 1
    end
    i += 1
  end
  false
end

def okay_two_sum?(arr, target_sum)
  arr = arr.sort

  until arr.length == 1
    if arr[0] + arr[-1] > target_sum
      arr = arr[0...-1]
    elsif arr[0] + arr[-1] == target_sum
      return true
    else
      arr = arr[1..-1]
    end
  end
  false
end

def two_sum?(arr, target_sum)
  h1 = Hash.new(false)
  arr.each do |elm|
    h1[elm] = true
    if h1[target_sum - elm] == true
      return true
    end
  end
  false
end


def naive_solution(arr, w)
  current_max_range = nil
  max_range_arr = []
  i = 0
  while i + w <= arr.length
    new_arr = arr[i...i + w]
    if current_max_range == nil || new_arr.max - new_arr.min > current_max_range
      current_max_range = new_arr.max - new_arr.min
      max_range_arr = new_arr
    end
    i += 1
  end
  max_range_arr
end

class MyQueue
  def initialize
    @underlying_array = []
    @size
  end

  def enqueue(el)
    underlying_array.push(el)
    @size += 1
    el
  end

  def dequeue
    @size -= 1
    underlying_array.shift
  end

  def peek
    underlying_array.first
  end

  def empty?
    @size == 0
  end

  private

  attr_reader :underlying_array, :size

end

class MyStack
  def initialize
    @array = []
    @size = 0
  end

  def push(el)
    array.push(el)
    @size += 1
    el
  end

  def pop
    @size -= 1
    array.pop
  end

  def empty?
    @size == 0
  end

  def peek
    array.last
  end

  private

  attr_reader :array, :size

end

class StackQueue

  def initialize
    @s1 = MyStack.new
    @s2 = MyStack.new
    @size = 0
  end

  def enqueue(el)
    @s1.push(el)
    @size += 1

  end

  def dequeue
    @size -= 1
    @s2.pop
  end


  def peek
    @s2.last
  end

  def empty?
    @size == 0
  end
end


p naive_solution([1, 3, 2, 5, 4, 8], 5)
