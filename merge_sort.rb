# frozen_string_literal: true

def merge_sort(arr)
  return arr if arr.length < 2

  left, right = arr.each_slice((arr.size / 2.0).round).to_a
  left = merge_sort(left)
  right = merge_sort(right)
  merge(left, right)
end

def merge(left, right)
  temp = []
  left[0] > right[0] ? shift_delete(temp, right) : shift_delete(temp, left) until left.empty? || right.empty?

  clean_leftovers(temp, left, right)
  temp
end

def shift_delete(temp, side)
  temp << side[0]
  side.shift
end

def clean_leftovers(temp, left, right)
  shift_delete(temp, left) until left.empty?
  shift_delete(temp, right) until right.empty?
end

p merge_sort([1, 4, 5, 7, 8, 99, 444, 2, 12, 10, 5, 6, 8])
